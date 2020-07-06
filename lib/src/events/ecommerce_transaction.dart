import 'abstract_event.dart';
import 'ecommerce_transaction_item.dart';

/// [EcommerceTransaction] event.
class EcommerceTransaction implements AbstractEvent {
  /// [orderId] ID of the eCommerce transaction.
  final String orderId;

  /// [totalValue] Total transaction value.
  final double totalValue;

  /// [affiliation] Transaction affiliation.
  final String affiliation;

  /// [taxValue] Transaction tax value.
  final double taxValue;

  /// [shipping] Delivery cost charged.
  final double shipping;

  /// [city] Delivery address city.
  final String city;

  /// [state] Delivery address state.
  final String state;

  /// [country] Delivery address country.
  final String country;

  /// [currency] Transaction currency.
  final String currency;

  /// [items] An array of items in the transaction.
  final List<EcommerceTransactionItem> items;

  EcommerceTransaction._builder(EcommerceTransactionBuilder builder)
      : assert(builder._orderId != null && builder._orderId.isNotEmpty,
            'orderId cannot be null or empty'),
        assert(builder._totalValue != null, 'totalValue cannot be null'),
        assert(builder._taxValue != null, 'taxValue cannot be null'),
        assert(builder._shipping != null, 'shipping cannot be null'),
        assert(builder._items != null && builder._items.isNotEmpty,
            'items cannot be null or empty'),
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

/// The protocol for building ecommerce transaction events.
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

  /// Set the order ID.
  EcommerceTransactionBuilder setOrderId(String orderId) {
    _orderId = orderId;
    return this;
  }

  /// Set the total value.
  EcommerceTransactionBuilder setTotalValue(double totalValue) {
    _totalValue = totalValue;
    return this;
  }

  /// Set the affiliation.
  EcommerceTransactionBuilder setAffiliation(String affiliation) {
    _affiliation = affiliation;
    return this;
  }

  /// Set the tax value.
  EcommerceTransactionBuilder setTaxValue(double taxValue) {
    _taxValue = taxValue;
    return this;
  }

  /// Set the shipping.
  EcommerceTransactionBuilder setShipping(double shipping) {
    _shipping = shipping;
    return this;
  }

  /// Set the city.
  EcommerceTransactionBuilder setCity(String city) {
    _city = city;
    return this;
  }

  /// Set the state.
  EcommerceTransactionBuilder setState(String state) {
    _state = state;
    return this;
  }

  /// Set the country.
  EcommerceTransactionBuilder setCountry(String country) {
    _country = country;
    return this;
  }

  /// Set the currency.
  EcommerceTransactionBuilder setCurrency(String currency) {
    _currency = currency;
    return this;
  }

  /// Set the items.
  EcommerceTransactionBuilder setItems(List<EcommerceTransactionItem> items) {
    _items = items;
    return this;
  }

  /// Creates an ecommerce event.
  EcommerceTransaction build() {
    return EcommerceTransaction._builder(this);
  }
}
