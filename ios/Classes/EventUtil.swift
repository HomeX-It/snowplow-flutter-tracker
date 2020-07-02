//
//  EventUtil.swift
//  snowplow_flutter_tracker
//
//  Created by Szabó Patrik on 2020. 06. 30..
//

import Foundation
import SnowplowTracker

struct EventUtil {
    static public func getPageView(dict: [String: Any]?) -> SPPageView {
        return SPPageView.build { (SPPageViewBuilder) in
            SPPageViewBuilder.setPageUrl((dict?["pageUrl"] as? String)!)
            SPPageViewBuilder.setPageTitle(dict?["pageTitle"] as? String)
            SPPageViewBuilder.setReferrer(dict?["referrer"] as? String)
        }
    }
    
    static public func getStructured(dict: [String: Any]?) -> SPStructured {
        return SPStructured.build { (SPStructuredBuilder) in
            SPStructuredBuilder.setCategory((dict?["category"] as? String)!)
            SPStructuredBuilder.setAction((dict?["action"] as? String)!)
            SPStructuredBuilder.setLabel(dict?["label"] as? String)
            SPStructuredBuilder.setProperty(dict?["property"] as? String)
            SPStructuredBuilder.setValue((dict?["value"] as? Double)!)
        }
    }
    
    static public func getUnstructured(dict: [String: Any]?) -> SPUnstructured {
        let eventData: SPSelfDescribingJson = getSelfDescribingJson(dict: dict?["eventData"] as? [String: Any])
        
        return SPUnstructured.build { (SPUnstructuredBuilder) in
            SPUnstructuredBuilder.setEventData(eventData)
        }
    }
    
    static public func getScreenView(dict: [String: Any]?) -> SPScreenView {
        return SPScreenView.build { (SPScreenViewBuilder) in
            SPScreenViewBuilder.setName((dict?["name"] as? String)!)
            SPScreenViewBuilder.setType(dict?["type"] as? String)
            SPScreenViewBuilder.setTransitionType(dict?["transitionType"] as? String)
            SPScreenViewBuilder.setPreviousScreenName(dict?["previousName"] as? String)
            SPScreenViewBuilder.setPreviousScreenType(dict?["previousType"] as? String)
        }
    }
    
    static public func getConsentWithdrawn(dict: [String: Any]?) -> SPConsentWithdrawn {
        let documents = getConsentDocuments(payloads: (dict?["consentDocuments"] as? Array<[String: Any]>)!)
        
        return SPConsentWithdrawn.build { (SPConsentWithdrawnBuilder) in
            SPConsentWithdrawnBuilder.setAll((dict?["all"] as? Bool)!)
            SPConsentWithdrawnBuilder.setDocumentId((dict?["documentId"] as? String)!)
            SPConsentWithdrawnBuilder.setVersion((dict?["documentVersion"] as? String)!)
            SPConsentWithdrawnBuilder.setName((dict?["documentName"] as? String)!)
            SPConsentWithdrawnBuilder.setDescription((dict?["documentDescription"] as? String)!)
            SPConsentWithdrawnBuilder.setDocuments(documents)
        }
    }
    
    static public func getConsentGranted(dict: [String: Any]?) -> SPConsentGranted {
        let documents = getConsentDocuments(payloads: (dict?["consentDocuments"] as? Array<[String: Any]>)!)
        
        return SPConsentGranted.build { (SPConsentGrantedBuilder) in
            SPConsentGrantedBuilder.setExpiry(dict?["expiry"] as? String)
            SPConsentGrantedBuilder.setDocumentId((dict?["documentId"] as? String)!)
            SPConsentGrantedBuilder.setVersion((dict?["documentVersion"] as? String)!)
            SPConsentGrantedBuilder.setName(dict?["documentName"] as? String)
            SPConsentGrantedBuilder.setDescription(dict?["documentDescription"] as? String)
            SPConsentGrantedBuilder.setDocuments(documents)
        }
    }
    
    static public func getTiming(dict: [String: Any]?) -> SPTiming {
        return SPTiming.build { (SPTimingBuilder) in
            SPTimingBuilder.setCategory((dict?["category"] as? String)!)
            SPTimingBuilder.setVariable((dict?["variable"] as? String)!)
            SPTimingBuilder.setTiming((dict?["timing"] as? Int)!)
            SPTimingBuilder.setLabel(dict?["label"] as? String)
        }
    }
    
    static public func getEcommTransaction(dict: [String: Any]?) -> SPEcommerce {
        let items = getEcommTransactionItems(ecommerceItems: (dict?["items"] as? Array<[String: Any]>)!)
        
        return SPEcommerce.build { (SPEcommTransactionBuilder) in
            SPEcommTransactionBuilder.setOrderId((dict?["orderId"] as? String)!)
            SPEcommTransactionBuilder.setTotalValue((dict?["totalValue"] as? Double)!)
            SPEcommTransactionBuilder.setAffiliation(dict?["affiliation"] as? String)
            SPEcommTransactionBuilder.setTaxValue((dict?["taxValue"] as? Double)!)
            SPEcommTransactionBuilder.setShipping((dict?["shipping"] as? Double)!)
            SPEcommTransactionBuilder.setCity(dict?["city"] as? String)
            SPEcommTransactionBuilder.setState(dict?["state"] as? String)
            SPEcommTransactionBuilder.setCountry(dict?["country"] as? String)
            SPEcommTransactionBuilder.setCurrency(dict?["currency"] as? String)
            SPEcommTransactionBuilder.setItems(items)
        }
    }
    
    static public func getPushNotification(dict: [String: Any]?) -> SPPushNotification {
        let notification = getNotificationContent(dict: (dict?["notificationContent"] as? [String: Any])!)
        
        return SPPushNotification.build { (SPPushNotificationBuilder) in
            SPPushNotificationBuilder.setAction((dict?["action"] as? String)!)
            SPPushNotificationBuilder.setDeliveryDate((dict?["deliveryDate"] as? String)!)
            SPPushNotificationBuilder.setTrigger((dict?["trigger"] as? String)!)
            SPPushNotificationBuilder.setCategoryIdentifier((dict?["categoryIdentifier"] as? String)!)
            SPPushNotificationBuilder.setThreadIdentifier((dict?["threadIdentifier"] as? String)!)
            SPPushNotificationBuilder.setNotification(notification)
        }
    }
    
    static private func getSelfDescribingJson(dict: [String: Any]?) -> SPSelfDescribingJson {
        let payload: SPPayload = SPPayload.init(nsDictionary: dict?["payload"] as? [String: NSObject])
        return SPSelfDescribingJson.init(schema: dict?["schema"] as? String, andPayload: payload)
    }
    
    static private func getConsentDocuments(payloads: Array<[String: Any]>) -> Array<SPSelfDescribingJson> {
        return payloads.map({ (element: [String: Any]) -> SPSelfDescribingJson in
            let payload = SPPayload.init(nsDictionary: element as? [String: NSObject])
            return SPSelfDescribingJson.init(schema: kSPConsentDocumentSchema, andPayload: payload)
        })
    }
    
    static private func getEcommTransactionItems(ecommerceItems: Array<[String: Any]>) -> Array<SPEcommerceItem> {
        return ecommerceItems.map { (ecommerceItem: [String : Any]) -> SPEcommerceItem in
            return SPEcommerceItem.build { (SPEcommTransactionItemBuilder) in
                SPEcommTransactionItemBuilder.setItemId((ecommerceItem["itemId"] as? String)!)
                SPEcommTransactionItemBuilder.setSku((ecommerceItem["sku"] as? String)!)
                SPEcommTransactionItemBuilder.setPrice((ecommerceItem["price"] as? Double)!)
                SPEcommTransactionItemBuilder.setQuantity((ecommerceItem["quantity"] as? Int)!)
                SPEcommTransactionItemBuilder.setName(ecommerceItem["name"] as? String)
                SPEcommTransactionItemBuilder.setCategory(ecommerceItem["category"] as? String)
                SPEcommTransactionItemBuilder.setCurrency(ecommerceItem["currency"] as? String)
            }
        }
    }
    
    static private func getNotificationContent(dict: [String: Any]) -> SPNotificationContent {
        let badge: NSNumber = NSNumber.init(integerLiteral: (dict["badge"] as? Int)!)
        
        return SPNotificationContent.build { (SPNotificationContentBuilder) in
            SPNotificationContentBuilder.setTitle((dict["title"] as? String)!)
            SPNotificationContentBuilder.setSubtitle(dict["subtitle"] as? String)
            SPNotificationContentBuilder.setBody((dict["body"] as? String)!)
            SPNotificationContentBuilder.setBadge(badge)
            SPNotificationContentBuilder.setSound(dict["sounds"] as? String)
            SPNotificationContentBuilder.setLaunchImageName(dict["launchImageName"] as? String)
            SPNotificationContentBuilder.setUserInfo(dict["userInfo"] as? [String: Any])
            SPNotificationContentBuilder.setAttachments(dict["attachments"] as? Array<Any>)
        }
    }
}
