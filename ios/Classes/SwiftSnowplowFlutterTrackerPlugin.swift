import Flutter
import UIKit
import SnowplowTracker

public class SwiftSnowplowFlutterTrackerPlugin: NSObject, FlutterPlugin {
    private var tracker: SPTracker?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "snowplow_flutter_tracker", binaryMessenger: registrar.messenger())
        let instance = SwiftSnowplowFlutterTrackerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            onInitialize(call, result)
        case "setSubject":
            onSetSubject(call, result)
        case "trackPageView":
            onTrackPageView(call, result)
        case "trackStructured":
            onTrackStructured(call, result)
        case "trackSelfDescribing":
            onTrackUnstructured(call, result)
        case "trackScreenView":
            onTrackScreenView(call, result)
        case "trackConsentWithdrawn":
            onTrackConsentWithdrawn(call, result)
        case "trackConsentGranted":
            onTrackConsentGranted(call, result)
        case "trackTiming":
            onTrackTiming(call, result)
        case "trackEcommerceTransaction":
            onTrackEcommTransaction(call, result)
        case "trackPushNotification":
            onTrackPushNotification(call, result)
        default:
            result(FlutterMethodNotImplemented)
            return
        }
    }
    
    private func onInitialize(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let arguments = call.arguments as? [String: Any]
        let emitter = TrackerUtil.getEmitter(dictionary: arguments?["emitter"] as? [String: Any])
        tracker = TrackerUtil.getTracker(emitter: emitter, dictionary: arguments)
        
        result(nil)
    }
    
    private func onSetSubject(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if let subjectConfiguration = call.arguments as? [String: Any] {
            tracker?.subject.configure(with: subjectConfiguration)
        }

        result(nil)
    }
    
    private func onTrackPageView(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getPageView(dict: call.arguments as? [String: Any])
        tracker?.trackPageViewEvent(event)
        
        result(nil)
    }
    
    private func onTrackStructured(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getStructured(dict: call.arguments as? [String: Any])
        tracker?.trackStructuredEvent(event)
        
        result(nil)
    }
    
    private func onTrackUnstructured(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getUnstructured(dict: call.arguments as? [String: Any])
        tracker?.trackUnstructuredEvent(event)
        
        result(nil)
    }
    
    private func onTrackScreenView(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getScreenView(dict: call.arguments as? [String: Any])
        tracker?.trackScreenViewEvent(event)
        
        result(nil)
    }
    
    private func onTrackConsentWithdrawn(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getConsentWithdrawn(dict: call.arguments as? [String: Any])
        tracker?.trackConsentWithdrawnEvent(event)
        
        result(nil)
    }
    
    private func onTrackConsentGranted(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getConsentGranted(dict: call.arguments as? [String: Any])
        tracker?.trackConsentGrantedEvent(event)
        
        result(nil)
    }
    
    private func onTrackTiming(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getTiming(dict: call.arguments as? [String: Any])
        tracker?.trackTimingEvent(event)
        
        result(nil)
    }
    
    private func onTrackEcommTransaction(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getEcommTransaction(dict: call.arguments as? [String: Any])
        tracker?.trackEcommerceEvent(event)
        
        result(nil)
    }
    
    private func onTrackPushNotification(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let event = EventUtil.getPushNotification(dict: call.arguments as? [String: Any])
        tracker?.trackPushNotificationEvent(event)
        
        result(nil)
    }
}
