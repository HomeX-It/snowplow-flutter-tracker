package com.patricktailor.snowplow_flutter_tracker

import android.util.Log
import androidx.annotation.NonNull;
import androidx.annotation.Nullable
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.PluginRegistry.Registrar

class SnowplowFlutterTrackerPlugin: FlutterPlugin {
  @Nullable private var methodCallHandler: MethodCallHandlerImpl? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    methodCallHandler = MethodCallHandlerImpl(flutterPluginBinding.applicationContext)
    methodCallHandler!!.startListening(flutterPluginBinding.binaryMessenger)
  }

  companion object {
    const val TAG = "SnowplowFlutterTrackerPlugin"

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val handler = MethodCallHandlerImpl(registrar.context())
      handler.startListening(registrar.messenger())
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    if (methodCallHandler == null) {
      Log.wtf(TAG, "Already detached from the engine.")
      return;
    }

    methodCallHandler!!.stopListening()
    methodCallHandler = null
  }
}
