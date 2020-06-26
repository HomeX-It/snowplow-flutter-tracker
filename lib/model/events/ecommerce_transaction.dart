import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';
import 'package:snowplow_flutter_tracker/model/events/ecommerce_transaction_item.dart';

class EcommerceTransaction extends AbstractEvent {
	final String orderId;
	final double totalValue;
	final String affiliation;
	final double taxValue;
	final double shipping;
	final String city;
	final String state;
	final String country;
	final String currency;
	final List<EcommerceTransactionItem> items;

	EcommerceTransaction._builder(EcommerceTransactionBuilder builder) :
			orderId = builder._orderId,
			totalValue = builder._totalValue,
			affiliation = builder._affiliation,
			taxValue = builder._taxValue,
			shipping = builder._shipping,
			city = builder._city,
			state = builder._state,
			country = builder._country,
			currency = builder._currency,
			items = builder._items;

	@override
  Map<String, Object> toMap() {
    return {
			'orderId': orderId,
			'totalValue': totalValue,
			'affiliation': affiliation,
			'taxValue': taxValue,
			'shipping': shipping,
			'city': city,
			'state': state,
			'country': country,
			'currency': currency,
			'items': items.map((EcommerceTransactionItem ecommerceTransactionItem) {
			  return ecommerceTransactionItem.toMap();
			}).toList(),
		};
  }
}

class EcommerceTransactionBuilder {
	String _orderId;
	double _totalValue;
	String _affiliation;
	double _taxValue;
	double _shipping;
	String _city;
	String _state;
	String _country;
	String _currency;
	List<EcommerceTransactionItem> _items;

	EcommerceTransactionBuilder setOrderId(String orderId) {
		_orderId = orderId;
		return this;
	}

	EcommerceTransactionBuilder setTotalValue(double totalValue) {
		_totalValue = totalValue;
		return this;
	}

	EcommerceTransactionBuilder setAffiliation(String affiliation) {
		_affiliation = affiliation;
		return this;
	}

	EcommerceTransactionBuilder setTaxValue(double taxValue) {
		_taxValue = taxValue;
		return this;
	}

	EcommerceTransactionBuilder setShipping(double shipping) {
		_shipping = shipping;
		return this;
	}

	EcommerceTransactionBuilder setCity(String city) {
		_city = city;
		return this;
	}

	EcommerceTransactionBuilder setState(String state) {
		_state = state;
		return this;
	}

	EcommerceTransactionBuilder setCountry(String country) {
		_country = country;
		return this;
	}

	EcommerceTransactionBuilder setCurrency(String currency) {
		_currency = currency;
		return this;
	}

	EcommerceTransactionBuilder setItems(List<EcommerceTransactionItem> items) {
		_items = items;
		return this;
	}

	EcommerceTransaction build() {
		return EcommerceTransaction._builder(this);
	}
}