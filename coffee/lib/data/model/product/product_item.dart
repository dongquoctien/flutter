import 'package:freezed_annotation/freezed_annotation.dart';

import 'media_item.dart';
import 'optional.dart';
import 'size.dart';

@immutable
class ProductItem {
  final String? id;
  final String? itemNo;
  final int? v;
  final String? basicItemNo;
  final String? basicMatl;
  final dynamic itemType;
  final String? mch2;
  final String? mch3;
  final String? mch4;
  final String? mch5;
  final String? mch6;
  final List<MediaItem>? mediaItems;
  final String? mediaUrl;
  final String? name;
  final int? price;
  final int? salePrice;
  final String? seoName;
  final String? shortDesc;
  final String? size;
  final List<Size>? sizes;
  final String? subName;
  final DateTime? updatedDate;
  final List<Optional>? optionals;

  const ProductItem({
    this.id,
    this.itemNo,
    this.v,
    this.basicItemNo,
    this.basicMatl,
    this.itemType,
    this.mch2,
    this.mch3,
    this.mch4,
    this.mch5,
    this.mch6,
    this.mediaItems,
    this.mediaUrl,
    this.name,
    this.price,
    this.salePrice,
    this.seoName,
    this.shortDesc,
    this.size,
    this.sizes,
    this.subName,
    this.updatedDate,
    this.optionals,
  });

  @override
  String toString() {
    return 'Item(id: $id, itemNo: $itemNo, v: $v, basicItemNo: $basicItemNo, basicMatl: $basicMatl, id: $id, itemType: $itemType, mch2: $mch2, mch3: $mch3, mch4: $mch4, mch5: $mch5, mch6: $mch6, mediaItems: $mediaItems, mediaUrl: $mediaUrl, name: $name, price: $price, salePrice: $salePrice, seoName: $seoName, shortDesc: $shortDesc, size: $size, sizes: $sizes, subName: $subName, updatedDate: $updatedDate, optionals: $optionals)';
  }

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json['_id'] as String?,
        itemNo: json['itemNo'] as String?,
        v: json['__v'] as int?,
        basicItemNo: json['basicItemNo'] as String?,
        basicMatl: json['basicMatl'] as String?,
        itemType: json['itemType'] as dynamic,
        mch2: json['mch2'] as String?,
        mch3: json['mch3'] as String?,
        mch4: json['mch4'] as String?,
        mch5: json['mch5'] as String?,
        mch6: json['mch6'] as String?,
        mediaItems: (json['mediaItems'] as List<dynamic>?)
            ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        mediaUrl: json['mediaUrl'] as String?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        salePrice: json['salePrice'] as int?,
        seoName: json['seoName'] as String?,
        shortDesc: json['shortDesc'] as String?,
        size: json['size'] as String?,
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
            .toList(),
        subName: json['subName'] as String?,
        updatedDate: json['updatedDate'] == null
            ? null
            : DateTime.parse(json['updatedDate'] as String),
        optionals: (json['optionals'] as List<dynamic>?)
            ?.map((e) => Optional.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'itemNo': itemNo,
        '__v': v,
        'basicItemNo': basicItemNo,
        'basicMatl': basicMatl,
        'id': id,
        'itemType': itemType,
        'mch2': mch2,
        'mch3': mch3,
        'mch4': mch4,
        'mch5': mch5,
        'mch6': mch6,
        'mediaItems': mediaItems?.map((e) => e.toJson()).toList(),
        'mediaUrl': mediaUrl,
        'name': name,
        'price': price,
        'salePrice': salePrice,
        'seoName': seoName,
        'shortDesc': shortDesc,
        'size': size,
        'sizes': sizes?.map((e) => e.toJson()).toList(),
        'subName': subName,
        'updatedDate': updatedDate?.toIso8601String(),
        'optionals': optionals?.map((e) => e.toJson()).toList(),
      };

  ProductItem copyWith({
    String? id,
    String? itemNo,
    int? v,
    String? basicItemNo,
    String? basicMatl,
    dynamic itemType,
    String? mch2,
    String? mch3,
    String? mch4,
    String? mch5,
    String? mch6,
    List<MediaItem>? mediaItems,
    String? mediaUrl,
    String? name,
    int? price,
    int? salePrice,
    String? seoName,
    String? shortDesc,
    String? size,
    List<Size>? sizes,
    String? subName,
    DateTime? updatedDate,
    List<Optional>? optionals,
  }) {
    return ProductItem(
      id: id ?? this.id,
      itemNo: itemNo ?? this.itemNo,
      v: v ?? this.v,
      basicItemNo: basicItemNo ?? this.basicItemNo,
      basicMatl: basicMatl ?? this.basicMatl,
      itemType: itemType ?? this.itemType,
      mch2: mch2 ?? this.mch2,
      mch3: mch3 ?? this.mch3,
      mch4: mch4 ?? this.mch4,
      mch5: mch5 ?? this.mch5,
      mch6: mch6 ?? this.mch6,
      mediaItems: mediaItems ?? this.mediaItems,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      seoName: seoName ?? this.seoName,
      shortDesc: shortDesc ?? this.shortDesc,
      size: size ?? this.size,
      sizes: sizes ?? this.sizes,
      subName: subName ?? this.subName,
      updatedDate: updatedDate ?? this.updatedDate,
      optionals: optionals ?? this.optionals,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      itemNo.hashCode ^
      v.hashCode ^
      basicItemNo.hashCode ^
      basicMatl.hashCode ^
      id.hashCode ^
      itemType.hashCode ^
      mch2.hashCode ^
      mch3.hashCode ^
      mch4.hashCode ^
      mch5.hashCode ^
      mch6.hashCode ^
      mediaItems.hashCode ^
      mediaUrl.hashCode ^
      name.hashCode ^
      price.hashCode ^
      salePrice.hashCode ^
      seoName.hashCode ^
      shortDesc.hashCode ^
      size.hashCode ^
      sizes.hashCode ^
      subName.hashCode ^
      updatedDate.hashCode ^
      optionals.hashCode;
}
