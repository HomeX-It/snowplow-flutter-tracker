import 'package:flutter/foundation.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

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

  /// [contexts] Attached contexts.
  final Set<SelfDescribingJson> contexts;

  /// Create a [EcommerceTransactionItem]
  const EcommerceTransactionItem({
    this.itemId,
    this.sku,
    this.price,
    this.quantity,
    this.name,
    this.category,
    this.currency,
    this.contexts = const {},
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
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EcommerceTransactionItem &&
          runtimeType == other.runtimeType &&
          itemId == other.itemId &&
          sku == other.sku &&
          price == other.price &&
          quantity == other.quantity &&
          name == other.name &&
          category == other.category &&
          currency == other.currency &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      itemId.hashCode ^
      sku.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      name.hashCode ^
      category.hashCode ^
      currency.hashCode ^
      contexts.hashCode;
}
