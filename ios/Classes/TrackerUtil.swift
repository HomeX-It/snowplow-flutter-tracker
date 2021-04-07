//
//  TrackerUtil.swift
//  snowplow_flutter_tracker
//
//  Created by Szabó Patrik on 2020. 06. 29..
//

import Foundation
import SnowplowTracker

struct TrackerUtil {
    static func getTracker(emitter: SPEmitter, dictionary: [String: Any]?) -> SPTracker? {
        let subject = SPSubject.init()
        
        return SPTracker.build { (SPTrackerBuilder) in
            SPTrackerBuilder?.setEmitter(emitter)
            SPTrackerBuilder?.setTrackerNamespace(dictionary?["namespace"] as? String)
            SPTrackerBuilder?.setAppId(dictionary?["appId"] as? String)
            SPTrackerBuilder?.setSubject(subject)
            SPTrackerBuilder?.setBase64Encoded(dictionary?["base64"] as? Bool ?? false)
            SPTrackerBuilder?.setDevicePlatform(getDevicePlatform(devicePlatformAsString: dictionary?["devicePlatform"] as? String))
            SPTrackerBuilder?.setAutotrackScreenViews(dictionary?["screenviewEvents"] as? Bool ?? false)
            SPTrackerBuilder?.setApplicationContext(dictionary?["applicationContext"] as? Bool ?? false)
            SPTrackerBuilder?.setSessionContext(dictionary?["sessionContext"] as? Bool ?? false)
            SPTrackerBuilder?.setCheckInterval(dictionary?["sessionCheckInterval"] as? Int ?? 15)
            SPTrackerBuilder?.setForegroundTimeout(dictionary?["foregroundTimeout"] as? Int ?? 600)
            SPTrackerBuilder?.setBackgroundTimeout(dictionary?["backgroundTimeout"] as? Int ?? 300)
            SPTrackerBuilder?.setLifecycleEvents(dictionary?["lifecycleEvents"] as? Bool ?? false)
            SPTrackerBuilder?.setScreenContext(dictionary?["screenContext"] as? Bool ?? false)
            SPTrackerBuilder?.setInstallEvent(dictionary?["installTracking"] as? Bool ?? false)
            SPTrackerBuilder?.setLogLevel(getLogLevel(rawValue: dictionary?["logLevel"] as? String))
            SPTrackerBuilder?.setExceptionEvents(dictionary?["exceptionEvents"] as? Bool ?? false)

            if let gdprContext = dictionary?["gdprContext"] as? [String: Any] {
                SPTrackerBuilder?.setGdprContextWith(
                    getGdprProcessingBasis(from: gdprContext),
                    documentId: gdprContext["documentId"] as? String,
                    documentVersion: gdprContext["documentVersion"] as? String,
                    documentDescription: gdprContext["documentDescription"] as? String
                )
            }
        }
    }
    
    static func getEmitter(dictionary: [String: Any]?) -> SPEmitter {
        return SPEmitter.build { (SPEmitterBuilder) in
            SPEmitterBuilder?.setUrlEndpoint(dictionary?["uri"] as? String)
            SPEmitterBuilder?.setHttpMethod(getHttpMethod(httpMethodAsString: dictionary?["httpMethod"] as? String))
            SPEmitterBuilder?.setProtocol(getProtocol(protocolAsString: dictionary?["requestSecurity"] as? String))
        }
    }

    private static func getGdprProcessingBasis(from context: [String: Any]) -> SPGdprProcessingBasis {
        guard let basis = context["basis"] as? String else {
            fatalError("[GDPR context] GDPR context does not contain legal basis for tracking")
        }

        switch basis {
        case "consent":
            return SPGdprProcessingBasis.consent
        case "contract":
            return SPGdprProcessingBasis.contract
        case "legal_obligation":
            return SPGdprProcessingBasis.legalObligation
        case "vital_interests":
            return SPGdprProcessingBasis.vitalInterest
        case "public_task":
            return SPGdprProcessingBasis.publicTask
        case "legitimate_interests":
            return SPGdprProcessingBasis.legitimateInterests
        default:
            fatalError("[GDPR context] Unknown legal basis for tracking")
        }
    }

    private static func getLogLevel(rawValue: String?) -> SPLogLevel {
        switch rawValue {
        case "OFF":
            return SPLogLevel.off
        case "ERROR":
            return SPLogLevel.error
        case "DEBUG":
            return SPLogLevel.debug
        case "VERBOSE":
            return SPLogLevel.verbose
        default:
            return SPLogLevel.off
        }
    }
    
    private static func getDevicePlatform(devicePlatformAsString: String?) -> SPDevicePlatform {
        switch devicePlatformAsString {
        case "web":
            return SPDevicePlatform.web
        case "pc":
            return SPDevicePlatform.desktop
        case "srv":
            return SPDevicePlatform.serverSideApp
        case "app":
            return SPDevicePlatform.general
        case "tv":
            return SPDevicePlatform.connectedTV
        case "cnsl":
            return SPDevicePlatform.gameConsole
        case "iot":
            return SPDevicePlatform.internetOfThings
        default:
            return SPDevicePlatform.mobile
        }
    }
    
    private static func getHttpMethod(httpMethodAsString: String?) -> SPRequestOptions {
        switch httpMethodAsString {
        case "GET":
            return SPRequestOptions.get
        default:
            return SPRequestOptions.post
        }
    }
    
    private static func getProtocol(protocolAsString: String?) -> SPProtocol {
        switch protocolAsString {
        case "HTTP":
            return SPProtocol.http
        default:
            return SPProtocol.https
        }
    }
}
