package com.patricktailor.snowplow_flutter_tracker.util

import android.util.Log
import com.snowplowanalytics.snowplow.tracker.emitter.RequestCallback

class EmitterRequestCallback : RequestCallback {
    companion object private val TAG = "SnowplowFlutterTracker"

    override fun onSuccess(p0: Int) {
        Log.d(TAG, "Event sent successfully, number of successfully sent events $p0.")
    }

    override fun onFailure(p0: Int, p1: Int) {
        Log.d(TAG, "Event could not be sent, number of successfully sent events $p0 and number of failed to send events $p1.")
    }
}