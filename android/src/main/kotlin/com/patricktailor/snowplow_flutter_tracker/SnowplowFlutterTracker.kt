package com.patricktailor.snowplow_flutter_tracker

import android.content.Context
import com.patricktailor.snowplow_flutter_tracker.util.EventUtil
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
        if (json?.get("userId") != null) {
            tracker.subject.setUserId(json["userId"] as String)
        }
        if (json?.get("viewportWidth") != null && json["viewportHeight"] != null) {
            tracker.subject.setViewPort(json["viewportWidth"] as Int, json["viewportHeight"] as Int)
        }
        if (json?.get("screenResolutionWidth") != null && json["screenResolutionHeight"] != null) {
            tracker.subject.setScreenResolution(json["screenResolutionWidth"] as Int, json["screenResolutionHeight"] as Int)
        }
        if (json?.get("colorDepth") != null) {
            tracker.subject.setColorDepth(json["colorDepth"] as Int)
        }
        if (json?.get("timezone") != null) {
            tracker.subject.setTimezone(json["timezone"] as String)
        }
        if (json?.get("ipAddress") != null) {
            tracker.subject.setIpAddress(json["ipAddress"] as String)
        }
        if (json?.get("userAgent") != null) {
            tracker.subject.setUseragent(json["userAgent"] as String)
        }
        if (json?.get("networkUserId") != null) {
            tracker.subject.setNetworkUserId(json["networkUserId"] as String)
        }
        if (json?.get("domainUserId") != null) {
            tracker.subject.setDomainUserId(json["domainUserId"] as String)
        }
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
}