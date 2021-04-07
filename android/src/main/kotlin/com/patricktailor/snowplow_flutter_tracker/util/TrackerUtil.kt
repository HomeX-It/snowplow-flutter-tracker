package com.patricktailor.snowplow_flutter_tracker.util

import android.content.Context
import com.snowplowanalytics.snowplow.tracker.*
import com.snowplowanalytics.snowplow.tracker.emitter.BufferOption
import com.snowplowanalytics.snowplow.tracker.emitter.HttpMethod
import com.snowplowanalytics.snowplow.tracker.emitter.RequestSecurity
import com.snowplowanalytics.snowplow.tracker.utils.LogLevel

class TrackerUtil {
    sealed class GdprContextError(message: String?) : Throwable(message) {
        object MissingLegalBasis: GdprContextError("[GDPR context] GDPR context does not contain legal basis for tracking")
        object UnknownLegalBasis: GdprContextError("[GDPR context] Unknown legal basis for tracking")
    }

    companion object {
        fun getEmitter(json: Map<String, Any>?, logLevel: String, context: Context): Emitter {
            return Emitter.EmitterBuilder(json?.get("uri") as String, context)
                    .method(HttpMethod.valueOf(json["httpMethod"] as String))
                    .option(BufferOption.valueOf(json["bufferOption"] as String))
                    .security(RequestSecurity.valueOf(json["requestSecurity"] as String))
                    .callback(EmitterRequestCallback(LogLevel.valueOf(logLevel)))
                    .build()
        }

        fun getTracker(emitter: Emitter, json: Map<String, Any>?, context: Context): Tracker {
            val namespace = json?.get("namespace") as String
            val appId = json["appId"] as String
            val subject = Subject.SubjectBuilder().build()

            var builder = Tracker.TrackerBuilder(emitter, namespace, appId, context)
                    .subject(subject)
                    .base64(json["base64"] as Boolean)
                    .platform(DevicePlatforms.valueOf(json["devicePlatform"] as String))
                    .level(LogLevel.valueOf(json["logLevel"] as String))
                    .mobileContext(json["mobileContext"] as Boolean)
                    .screenviewEvents(json["screenviewEvents"] as Boolean)
                    .applicationContext(json["applicationContext"] as Boolean)
                    .sessionContext(json["sessionContext"] as Boolean)
                    .sessionCheckInterval((json["sessionCheckInterval"] as Int).toLong())
                    .foregroundTimeout((json["foregroundTimeout"] as Int).toLong())
                    .backgroundTimeout((json["backgroundTimeout"] as Int).toLong())
                    .lifecycleEvents(json["lifecycleEvents"] as Boolean)
                    .screenContext(json["screenContext"] as Boolean)
                    .installTracking(json["installTracking"] as Boolean)
                    .applicationCrash(json["exceptionEvents"] as Boolean)

            val gdprContext = json["gdprContext"] as? Map<String, Any>
            if (gdprContext != null) {
                val processingBasis = getGdprProcessingBasis(gdprContext)
                builder = builder.gdprContext(
                        processingBasis,
                        gdprContext["documentId"]?.toString(),
                        gdprContext["documentVersion"]?.toString(),
                        gdprContext["documentDescription"]?.toString()
                )
            }

            return Tracker.init(builder.build())
        }

        private fun getGdprProcessingBasis(context: Map<String, Any>): Gdpr.Basis {
            val basis = context["basis"] as? String
            if (basis != null) {
                return when(basis) {
                    "consent" -> Gdpr.Basis.CONSENT
                    "contract" -> Gdpr.Basis.CONTRACT
                    "legal_obligation" -> Gdpr.Basis.LEGAL_OBLIGATION
                    "vital_interests" -> Gdpr.Basis.VITAL_INTERESTS
                    "public_task" -> Gdpr.Basis.PUBLIC_TASK
                    "legitimate_interests" -> Gdpr.Basis.LEGITIMATE_INTERESTS
                    else -> throw GdprContextError.UnknownLegalBasis
                }
            } else {
                throw GdprContextError.MissingLegalBasis
            }
        }
    }
}