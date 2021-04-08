package com.patricktailor.snowplow_flutter_tracker.util

import com.snowplowanalytics.snowplow.tracker.Subject

class SubjectUtil {
    companion object {
        fun configure(subject: Subject, json: Map<String, Any>) {
            if (json["userId"] != null) {
                subject.setUserId(json["userId"] as String)
            }
            if (json["viewportWidth"] != null && json["viewportHeight"] != null) {
                subject.setViewPort(json["viewportWidth"] as Int, json["viewportHeight"] as Int)
            }
            if (json["screenResolutionWidth"] != null && json["screenResolutionHeight"] != null) {
                subject.setScreenResolution(json["screenResolutionWidth"] as Int, json["screenResolutionHeight"] as Int)
            }
            if (json["colorDepth"] != null) {
                subject.setColorDepth(json["colorDepth"] as Int)
            }
            if (json["timezone"] != null) {
                subject.setTimezone(json["timezone"] as String)
            }
            if (json["language"] != null) {
                subject.setLanguage(json["language"] as String)
            }
            if (json["ipAddress"] != null) {
                subject.setIpAddress(json["ipAddress"] as String)
            }
            if (json["userAgent"] != null) {
                subject.setUseragent(json["userAgent"] as String)
            }
            if (json["networkUserId"] != null) {
                subject.setNetworkUserId(json["networkUserId"] as String)
            }
            if (json["domainUserId"] != null) {
                subject.setDomainUserId(json["domainUserId"] as String)
            }
        }
    }
}
