package com.patricktailor.snowplow_flutter_tracker.util

import com.snowplowanalytics.snowplow.tracker.Subject

class SubjectUtil {
    companion object {
        fun configure(subject: Subject, json: Map<String, Any>) {
            if (json?.get("userId") != null) {
                subject.setUserId(json["userId"] as String)
            }

            if (json?.get("viewportWidth") != null && json["viewportHeight"] != null) {
                subject.setViewPort(json["viewportWidth"] as Int, json["viewportHeight"] as Int)
            }
            if (json?.get("screenResolutionWidth") != null && json["screenResolutionHeight"] != null) {
                subject.setScreenResolution(json["screenResolutionWidth"] as Int, json["screenResolutionHeight"] as Int)
            }
            if (json?.get("colorDepth") != null) {
                subject.setColorDepth(json["colorDepth"] as Int)
            }
            if (json?.get("timezone") != null) {
                subject.setTimezone(json["timezone"] as String)
            }
            if (json?.get("language") != null) {
                subject.setLanguage(json["language"] as String)
            }
            if (json?.get("ipAddress") != null) {
                subject.setIpAddress(json["ipAddress"] as String)
            }
            if (json?.get("userAgent") != null) {
                subject.setUseragent(json["userAgent"] as String)
            }
            if (json?.get("networkUserId") != null) {
                subject.setNetworkUserId(json["networkUserId"] as String)
            }
            if (json?.get("domainUserId") != null) {
                subject.setDomainUserId(json["domainUserId"] as String)
            }
        }
    }
}
