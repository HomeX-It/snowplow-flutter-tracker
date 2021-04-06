package com.patricktailor.snowplow_flutter_tracker.util

import android.content.Context
import com.snowplowanalytics.snowplow.tracker.DevicePlatforms
import com.snowplowanalytics.snowplow.tracker.Emitter
import com.snowplowanalytics.snowplow.tracker.Subject
import com.snowplowanalytics.snowplow.tracker.Tracker
import com.snowplowanalytics.snowplow.tracker.emitter.BufferOption
import com.snowplowanalytics.snowplow.tracker.emitter.HttpMethod
import com.snowplowanalytics.snowplow.tracker.emitter.RequestSecurity
import com.snowplowanalytics.snowplow.tracker.utils.LogLevel

class TrackerUtil {
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

            return Tracker.init(Tracker.TrackerBuilder(emitter, namespace, appId, context)
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
                    .build()
            )
        }
    }
}