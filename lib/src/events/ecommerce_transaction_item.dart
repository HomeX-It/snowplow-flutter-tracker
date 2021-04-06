import 'package:flutter/foundation.dart';

/// [EcommerceTransactionItem]
@immutable
class EcommerceTransactionItem {
  /// [itemId] ID of the eCommerce transaction.
  final String? itemId;

  /// [sku] Item SKU.
  final String? sku;

  /// [price] Item price.
  final double? price;

  /// [quantity] Item quantity.
  final int? quantity;

  /// [name] Item name.
  final String? name;

  /// [category] Item category.
  final String? category;

  /// [currency] Transaction currency.
  final String? currency;

  /// Create a [EcommerceTransactionItem]
  EcommerceTransactionItem({
    this.itemId,
    this.sku,
    this.price,
    this.quantity,
    this.name,
    this.category,
    this.currency,
  });

  /// Converts the ecommerce transaction item object to JSON.
  Map<String, Object?> toMap() {
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
