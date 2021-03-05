package com.patricktailor.snowplow_flutter_tracker.util

import android.util.Log
import com.snowplowanalytics.snowplow.tracker.emitter.RequestCallback
import com.snowplowanalytics.snowplow.tracker.utils.LogLevel

class EmitterRequestCallback(private val logLevel: LogLevel) : RequestCallback {
    companion object private val TAG = "SnowplowFlutterTracker"

    override fun onSuccess(p0: Int) {
        if(logLevel != LogLevel.OFF)
            Log.d(TAG, "Event sent successfully, number of successfully sent events $p0.")
    }

    override fun onFailure(p0: Int, p1: Int) {
        if(logLevel != LogLevel.OFF)
            Log.d(TAG, "Event could not be sent, number of successfully sent events $p0 and number of failed to send events $p1.")
    }
}