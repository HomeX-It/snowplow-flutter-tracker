package com.patricktailor.snowplow_flutter_tracker

import android.content.Context
import android.util.Log
import androidx.annotation.Nullable
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class MethodCallHandlerImpl(private val context: Context) : MethodCallHandler {
    @Nullable private var channel: MethodChannel? = null
    @Nullable private var tracker: SnowplowFlutterTracker? = null

    companion object {
        const val TAG = "MethodCallHandlerImpl"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "initialize" -> {
                onInitialize(call, result)
            }
            "setSubject" -> {
                onSetSubject(call, result)
            }
            "enableGdprContext" -> {
                onEnableGdprContext(call, result)
            }
            "disableGdprContext" -> {
                onDisableGdprContext(result)
            }
            "trackSelfDescribing" -> {
                onTrackSelfDescribing(call, result)
            }
            "trackStructured" -> {
                onTrackStructured(call, result)
            }
            "trackScreenView" -> {
                onTrackScreenView(call, result)
            }
            "trackPageView" -> {
                onTrackPageView(call, result)
            }
            "trackTiming" -> {
                onTrackTiming(call, result)
            }
            "trackEcommerceTransaction" -> {
                onTrackEcommerceTransaction(call, result)
            }
            "trackConsentGranted" -> {
                onTrackConsentGranted(call, result)
            }
            "trackConsentWithdrawn" -> {
                onTrackConsentWithdrawn(call, result)
            }
            "close" -> {
                onClose(result)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    fun startListening(messenger: BinaryMessenger) {
        if (channel != null) {
            Log.d(TAG, "Setting a method call handler before the last was disposed.")
            stopListening()
        }

        channel = MethodChannel(messenger, "snowplow_flutter_tracker")
        channel?.setMethodCallHandler(this)
    }

    fun stopListening() {
        if (channel == null) {
            Log.d(TAG, "Tried to stop listening when no MethodChannel had been initialized.")
            return;
        }

        channel?.setMethodCallHandler(null)
        channel = null
    }

    private fun onInitialize(call: MethodCall, result: MethodChannel.Result) {
        val trackerJson: Map<String, Any>? = call.arguments as? Map<String, Any>
        tracker = SnowplowFlutterTracker(context);
        tracker?.initialize(trackerJson)
        result.success(null)
    }

    private fun onSetSubject(call: MethodCall, result: MethodChannel.Result) {
        val subjectJson = call.arguments as Map<String, Any>?
        tracker?.setSubject(subjectJson)
        result.success(null)
    }

    private fun onEnableGdprContext(call: MethodCall, result: MethodChannel.Result) {
        val rawGdprContext = call.arguments as Map<String, Any>?
        tracker?.enableGdprContext(rawGdprContext)
        result.success(null)
    }

    private fun onDisableGdprContext(result: MethodChannel.Result) {
        tracker?.disableGdprContext()
        result.success(null)
    }

    private fun onTrackSelfDescribing(call: MethodCall, result: MethodChannel.Result) {
        val selfDescribingJson = call.arguments as Map<String, Any>?
        tracker?.trackSelfDescribingEvent(selfDescribingJson)
        result.success(null)
    }

    private fun onTrackStructured(call: MethodCall, result: MethodChannel.Result) {
        val structuredJson = call.arguments as Map<String, Any>?
        tracker?.trackStructuredEvent(structuredJson)
        result.success(null)
    }

    private fun onTrackScreenView(call: MethodCall, result: MethodChannel.Result) {
        val screenViewJson = call.arguments as Map<String, Any>?
        tracker?.trackScreenViewEvent(screenViewJson)
        result.success(null)
    }

    private fun onTrackPageView(call: MethodCall, result: MethodChannel.Result) {
        val pageViewJson = call.arguments as Map<String, Any>?
        tracker?.trackPageViewEvent(pageViewJson)
        result.success(null)
    }

    private fun onTrackTiming(call: MethodCall, result: MethodChannel.Result) {
        val timingJson = call.arguments as Map<String, Any>?
        tracker?.trackTimingEvent(timingJson)
        result.success(null)
    }

    private fun onTrackEcommerceTransaction(call: MethodCall, result: MethodChannel.Result) {
        val ecommerceTransactionJson = call.arguments as Map<String, Any>?
        tracker?.trackEcommerceTransaction(ecommerceTransactionJson)
        result.success(null)
    }

    private fun onTrackConsentGranted(call: MethodCall, result: MethodChannel.Result) {
        val consentGrantedJson = call.arguments as Map<String, Any>?
        tracker?.trackConsentGranted(consentGrantedJson)
        result.success(null)
    }

    private fun onTrackConsentWithdrawn(call: MethodCall, result: MethodChannel.Result) {
        val consentWithdrawnJson = call.arguments as Map<String, Any>?
        tracker?.trackConsentWithdrawn(consentWithdrawnJson)
        result.success(null)
    }

    private fun onClose(result: MethodChannel.Result) {
        tracker?.close()
        tracker = null
        result.success(null)
    }
}