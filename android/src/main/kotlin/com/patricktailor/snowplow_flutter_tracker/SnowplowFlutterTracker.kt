package com.patricktailor.snowplow_flutter_tracker

import android.content.Context
import com.patricktailor.snowplow_flutter_tracker.util.EventUtil
import com.patricktailor.snowplow_flutter_tracker.util.SubjectUtil
import com.patricktailor.snowplow_flutter_tracker.util.TrackerUtil
import com.snowplowanalytics.snowplow.tracker.Emitter
import com.snowplowanalytics.snowplow.tracker.Tracker

class SnowplowFlutterTracker(private val context: Context) {
    private lateinit var emitter: Emitter
    private lateinit var tracker: Tracker

    fun initialize(json: Map<String, Any>?) {
        emitter = TrackerUtil.getEmitter(json?.get("emitter") as Map<String, Any>?, json?.get("logLevel") as String, context)
        tracker = TrackerUtil.getTracker(emitter, json, context)
    }

    fun setSubject(json: Map<String, Any>?) {
        json?.let { SubjectUtil.configure(tracker.subject, it) }
    }

    fun enableGdprContext(json: Map<String, Any>?) {
        json?.let {
            val basis = TrackerUtil.getGdprProcessingBasis(it);

            tracker.enableGdprContext(
                    basis,
                    it["documentId"]?.toString(),
                    it["documentVersion"]?.toString(),
                    it["documentDescription"]?.toString()
            )
        }
    }

    fun disableGdprContext() {
        tracker.disableGdprContext()
    }

    fun trackSelfDescribingEvent(json: Map<String, Any>?) {
        val selfDescribing = EventUtil.getSelfDescribingEvent(json)
        tracker.track(selfDescribing)
    }

    fun trackStructuredEvent(json: Map<String, Any>?) {
        val structured = EventUtil.getStructuredEvent(json)
        tracker.track(structured)
    }

    fun trackScreenViewEvent(json: Map<String, Any>?) {
        val screenView = EventUtil.getScreenViewEvent(json)
        tracker.track(screenView)
    }

    fun trackPageViewEvent(json: Map<String, Any>?) {
        val pageView = EventUtil.getPageViewEvent(json)
        tracker.track(pageView)
    }

    fun trackTimingEvent(json: Map<String, Any>?) {
        val timing = EventUtil.getTimingEvent(json)
        tracker.track(timing)
    }

    fun trackEcommerceTransaction(json: Map<String, Any>?) {
        val ecommerceTransaction = EventUtil.getEcommerceTransactionEvent(json)
        tracker.track(ecommerceTransaction)
    }

    fun trackConsentGranted(json: Map<String, Any>?) {
        val consentGranted = EventUtil.getConsentGrantedEvent(json)
        tracker.track(consentGranted)
    }

    fun trackConsentWithdrawn(json: Map<String, Any>?) {
        val consentWithdrawn = EventUtil.getConsentWithdrawnEvent(json)
        tracker.track(consentWithdrawn)
    }

    fun close() {
        Tracker.close()
    }
}