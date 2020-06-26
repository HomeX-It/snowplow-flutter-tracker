import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class EcommerceTransactionItem extends AbstractEvent {
	final String itemId;
	final String sku;
	final double price;
	final int quantity;
	final String name;
	final String category;
	final String currency;

  EcommerceTransactionItem._builder(EcommerceTransactionItemBuilder builder) :
			itemId = builder._itemId,
			sku = builder._sku,
			price = builder._price,
			quantity = builder._quantity,
			name = builder._name,
			category = builder._category,
			currency = builder._currency;

  @override
  Map<String, Object> toMap() {
    return {
			'itemId': itemId,
			'sku': sku,
			'price': price,
			'quantity': quantity,
			'name': name,
			'category': category,
			'currency': currency,
		};
  }
}

class EcommerceTransactionItemBuilder {
	String _itemId;
	String _sku;
	double _price;
	int _quantity;
	String _name;
	String _category;
	String _currency;

	EcommerceTransactionItemBuilder setItemId(String itemId) {
		_itemId = itemId;
		return this;
	}

	EcommerceTransactionItemBuilder setSku(String sku) {
		_sku = sku;
		return this;
	}

	EcommerceTransactionItemBuilder setPrice(double price) {
		_price = price;
		return this;
	}

	EcommerceTransactionItemBuilder setQuantity(int quantity) {
		_quantity = quantity;
		return this;
	}

	EcommerceTransactionItemBuilder setName(String name) {
		_name = name;
		return this;
	}

	EcommerceTransactionItemBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	EcommerceTransactionItemBuilder setCurrency(String currency) {
		_currency = currency;
		return this;
	}

	EcommerceTransactionItem build() {
		return EcommerceTransactionItem._builder(this);
	}
}