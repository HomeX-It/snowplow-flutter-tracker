/// [EcommerceTransactionItem]
class EcommerceTransactionItem {
	/// [itemId] ID of the eCommerce transaction.
	final String itemId;
	/// [sku] Item SKU.
	final String sku;
	/// [price] Item price.
	final double price;
	/// [quantity] Item quantity.
	final int quantity;
	/// [name] Item name.
	final String name;
	/// [category] Item category.
	final String category;
	/// [currency] Transaction currency.
	final String currency;

  EcommerceTransactionItem._builder(EcommerceTransactionItemBuilder builder) :
			itemId = builder._itemId,
			sku = builder._sku,
			price = builder._price,
			quantity = builder._quantity,
			name = builder._name,
			category = builder._category,
			currency = builder._currency;

	/// Converts the ecommerce transaction item object to JSON.
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

/// The protocol for building ecommerce transaction item events.
class EcommerceTransactionItemBuilder {
	String _itemId;
	String _sku;
	double _price;
	int _quantity;
	String _name;
	String _category;
	String _currency;

	/// Set the item ID.
	EcommerceTransactionItemBuilder setItemId(String itemId) {
		_itemId = itemId;
		return this;
	}

	/// Set the Sku.
	EcommerceTransactionItemBuilder setSku(String sku) {
		_sku = sku;
		return this;
	}

	/// Set the price.
	EcommerceTransactionItemBuilder setPrice(double price) {
		_price = price;
		return this;
	}

	/// Set the quantity.
	EcommerceTransactionItemBuilder setQuantity(int quantity) {
		_quantity = quantity;
		return this;
	}

	/// Set the name.
	EcommerceTransactionItemBuilder setName(String name) {
		_name = name;
		return this;
	}

	/// Set the category.
	EcommerceTransactionItemBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	/// Set the currency.
	EcommerceTransactionItemBuilder setCurrency(String currency) {
		_currency = currency;
		return this;
	}

	/// Creates a ecommerce transaction item.
	EcommerceTransactionItem build() {
		return EcommerceTransactionItem._builder(this);
	}
}