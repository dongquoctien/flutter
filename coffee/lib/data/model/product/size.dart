import 'package:freezed_annotation/freezed_annotation.dart';


@immutable
class Size {
  final String? id;
  final String? itemNo;
  final String? mediaUrl;
  final String? name;
  final bool? baseSize;
  final String? size;
  final int? addSalePrice;

  const Size({
    this.id,
    this.itemNo,
    this.mediaUrl,
    this.name,
    this.baseSize,
    this.size,
    this.addSalePrice,
  });

  @override
  String toString() {
    return 'Size(id: $id, itemNo: $itemNo, mediaUrl: $mediaUrl, name: $name, baseSize: $baseSize, size: $size, addSalePrice: $addSalePrice)';
  }

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json['id'] as String?,
        itemNo: json['itemNo'] as String?,
        mediaUrl: json['mediaUrl'] as String?,
        name: json['name'] as String?,
        baseSize: json['baseSize'] as bool?,
        size: json['size'] as String?,
        addSalePrice: json['addSalePrice'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'itemNo': itemNo,
        'mediaUrl': mediaUrl,
        'name': name,
        'baseSize': baseSize,
        'size': size,
        'addSalePrice': addSalePrice,
      };

  Size copyWith({
    String? id,
    String? itemNo,
    String? mediaUrl,
    String? name,
    bool? baseSize,
    String? size,
    int? addSalePrice,
  }) {
    return Size(
      id: id ?? this.id,
      itemNo: itemNo ?? this.itemNo,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      name: name ?? this.name,
      baseSize: baseSize ?? this.baseSize,
      size: size ?? this.size,
      addSalePrice: addSalePrice ?? this.addSalePrice,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Size) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      itemNo.hashCode ^
      mediaUrl.hashCode ^
      name.hashCode ^
      baseSize.hashCode ^
      size.hashCode ^
      addSalePrice.hashCode;
}
