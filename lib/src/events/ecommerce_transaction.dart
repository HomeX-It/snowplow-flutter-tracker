import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'ecommerce_transaction_item.dart';

/// [EcommerceTransaction] event.
@immutable
class EcommerceTransaction implements AbstractEvent {
  /// [orderId] ID of the eCommerce transaction.
  final String orderId;

  /// [totalValue] Total transaction value.
  final double totalValue;

  /// [affiliation] Transaction affiliation.
  final String? affiliation;

  /// [taxValue] Transaction tax value.
  final double taxValue;

  /// [shipping] Delivery cost charged.
  final double shipping;

  /// [city] Delivery address city.
  final String? city;

  /// [state] Delivery address state.
  final String? state;

  /// [country] Delivery address country.
  final String? country;

  /// [currency] Transaction currency.
  final String? currency;

  /// [items] An array of items in the transaction.
  final List<EcommerceTransactionItem> items;

  /// Create a [EcommerceTransaction] event
  EcommerceTransaction({
    required this.orderId,
    required this.totalValue,
    this.affiliation,
    required this.taxValue,
    required this.shipping,
    this.city,
    this.state,
    this.country,
    this.currency,
    required this.items,
  })   : assert(orderId.isNotEmpty, 'orderId cannot be empty'),
        assert(items.isNotEmpty, 'items cannot be empty');

  @override
  Map<String, Object?> toMap() {
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
      'items': items
          .map((EcommerceTransactionItem ecommerceTransactionItem) =>
              ecommerceTransactionItem.toMap())
          .toList(),
    };
  }
}
