package com.patricktailor.snowplow_flutter_tracker.util

import com.snowplowanalytics.snowplow.tracker.events.*
import com.snowplowanalytics.snowplow.tracker.payload.SelfDescribingJson

class EventUtil {
    companion object {
        fun getSelfDescribingEvent(json: Map<String, Any>?): SelfDescribing {
            val selfDescribingJson = getSelfDescribingJson(json)
            return SelfDescribing.builder().eventData(selfDescribingJson).build()
        }

        fun getStructuredEvent(json: Map<String, Any>?): Structured {
            val builder = Structured.builder()

            if (json?.get("category") != null) {
                builder.category(json["category"] as String)
            }
            if (json?.get("action") != null) {
                builder.action(json["action"] as String)
            }
            if (json?.get("label") != null) {
                builder.label(json["label"] as String)
            }
            if (json?.get("property") != null) {
                builder.property(json["property"] as String)
            }
            if (json?.get("value") != null) {
                builder.value(json["value"] as Double)
            }

            return builder.build()
        }

        fun getScreenViewEvent(json: Map<String, Any>?): ScreenView {
            val builder = ScreenView.builder()

            if (json?.get("name") != null) {
                builder.name(json["name"] as String)
            }
            if (json?.get("type") != null) {
                builder.type(json["type"] as String)
            }
            if (json?.get("transitionType") != null) {
                builder.transitionType(json["transitionType"] as String)
            }
            if (json?.get("previousName") != null) {
                builder.previousName(json["previousName"] as String)
            }
            if (json?.get("previousType") != null) {
                builder.previousType(json["previousType"] as String)
            }

            return builder.build()
        }

        fun getPageViewEvent(json: Map<String, Any>?): PageView {
            val builder = PageView.builder()
            
            if (json?.get("pageUrl") != null) {
                builder.pageUrl(json["pageUrl"] as String)
            }
            if (json?.get("pageTitle") != null) {
                builder.pageTitle(json["pageTitle"] as String)
            }
            if (json?.get("referrer") != null) {
                builder.referrer(json["referrer"] as String)
            }
            
            return builder.build()
        }

        fun getTimingEvent(json: Map<String, Any>?): Timing {
            val builder = Timing.builder()

            if (json?.get("category") != null) {
                builder.category(json["category"] as String)
            }
            if (json?.get("variable") != null) {
                builder.variable(json["variable"] as String)
            }
            if (json?.get("timing") != null) {
                builder.timing(json["timing"] as Int)
            }
            if (json?.get("label") != null) {
                builder.label(json["label"] as String)
            }

            return builder.build()
        }

        fun getEcommerceTransactionEvent(json: Map<String, Any>?): EcommerceTransaction {
            val builder = EcommerceTransaction.builder()

            if (json?.get("orderId") != null) {
                builder.orderId(json["orderId"] as String)
            }
            if (json?.get("totalValue") != null) {
                builder.totalValue(json["totalValue"] as Double)
            }
            if (json?.get("affiliation") != null) {
                builder.affiliation(json["affiliation"] as String)
            }
            if (json?.get("taxValue") != null) {
                builder.taxValue(json["taxValue"] as Double)
            }
            if (json?.get("shipping") != null) {
                builder.shipping(json["shipping"] as Double)
            }
            if (json?.get("city") != null) {
                builder.city(json["city"] as String)
            }
            if (json?.get("state") != null) {
                builder.state(json["state"] as String)
            }
            if (json?.get("country") != null) {
                builder.country(json["country"] as String)
            }
            if (json?.get("currency") != null) {
                builder.currency(json["currency"] as String)
            }
            if (json?.get("items") != null) {
                val items = (json["items"] as List<Map<String, Any>>).map(::getEcommerceTransactionItem)
                builder.items(items)
            }

            return builder.build()
        }

        fun getConsentGrantedEvent(json: Map<String, Any>?): ConsentGranted {
            val builder = ConsentGranted.builder()

            if (json?.get("expiry") != null) {
                builder.expiry(json["expiry"] as String)
            }
            if (json?.get("documentId") != null) {
                builder.documentId(json["documentId"] as String)
            }
            if (json?.get("documentVersion") != null) {
                builder.documentVersion(json["documentVersion"] as String)
            }
            if (json?.get("documentName") != null) {
                builder.documentName(json["documentName"] as String)
            }
            if (json?.get("documentDescription") != null) {
                builder.documentDescription(json["documentDescription"] as String)
            }
            if (json?.get("consentDocuments") != null) {
                val consentDocuments = (json["consentDocuments"] as List<Map<String, Any>>).map(::getConsentDocuments)
                builder.consentDocuments(consentDocuments)
            }

            return builder.build()
        }

        fun getConsentWithdrawnEvent(json: Map<String, Any>?): ConsentWithdrawn {
            val builder = ConsentWithdrawn.builder()
            
            if (json?.get("all") != null) {
                builder.all(json["all"] as Boolean)
            }
            if (json?.get("documentId") != null) {
                builder.documentId(json["documentId"] as String)
            }
            if (json?.get("documentVersion") != null) {
                builder.documentVersion(json["documentVersion"] as String)
            }
            if (json?.get("documentName") != null) {
                builder.documentName(json["documentName"] as String)
            }
            if (json?.get("documentDescription") != null) {
                builder.documentDescription(json["documentDescription"] as String)
            }
            if (json?.get("consentDocuments") != null) {
                val consentDocuments = (json["consentDocuments"] as List<Map<String, Any>>).map(::getConsentDocuments)
                builder.consentDocuments(consentDocuments)
            }
            
            return builder.build()
        }

        private fun getSelfDescribingJson(json: Map<String, Any>?): SelfDescribingJson {
            val eventData = json?.get("eventData") as Map<String, Any>?
            return SelfDescribingJson(eventData?.get("schema") as String, eventData["payload"] as Map<String, Any>)
        }

        private fun getEcommerceTransactionItem(json: Map<String, Any>?): EcommerceTransactionItem {
            val builder = EcommerceTransactionItem.builder()

            if (json?.get("itemId") != null) {
                builder.itemId(json["itemId"] as String)
            }
            if (json?.get("sku") != null) {
                builder.sku(json["sku"] as String)
            }
            if (json?.get("price") != null) {
                builder.price(json["price"] as Double)
            }
            if (json?.get("quantity") != null) {
                builder.quantity(json["quantity"] as Int)
            }
            if (json?.get("name") != null) {
                builder.name(json["name"] as String)
            }
            if (json?.get("category") != null) {
                builder.category(json["category"] as String)
            }
            if (json?.get("currency") != null) {
                builder.currency(json["currency"] as String)
            }

            return builder.build()
        }

        private fun getConsentDocuments(json: Map<String, Any>?): ConsentDocument {
            val builder = ConsentDocument.builder()

            if (json?.get("documentId") != null) {
                builder.documentId(json["documentId"] as String)
            }
            if (json?.get("documentVersion") != null) {
                builder.documentVersion(json["documentVersion"] as String)
            }
            if (json?.get("documentName") != null) {
                builder.documentName(json["documentName"] as String)
            }
            if (json?.get("documentDescription") != null) {
                builder.documentDescription(json["documentDescription"] as String)
            }

            return builder.build()
        }
    }
}