import 'package:freezed_annotation/freezed_annotation.dart';


import 'product_item.dart';

@immutable
class Product {
  final String? name;
  final String? description;
  final String? seoName;
  final List<ProductItem>? items;

  const Product({this.name, this.description, this.seoName, this.items});

  @override
  String toString() {
    return 'Product(name: $name, description: $description, seoName: $seoName, items: $items)';
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'] as String?,
        description: json['description'] as String?,
        seoName: json['seoName'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'seoName': seoName,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  Product copyWith({
    String? name,
    String? description,
    String? seoName,
    List<ProductItem>? items,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      seoName: seoName ?? this.seoName,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ seoName.hashCode ^ items.hashCode;
}
