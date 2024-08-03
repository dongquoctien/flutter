import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class HotItem {
  final String? name;
  final String? description;
  final String? seoName;
  final int? itemDisplayNumber;
  final String? id;
  final String? screenType;

  const HotItem({
    this.name,
    this.description,
    this.seoName,
    this.itemDisplayNumber,
    this.id,
    this.screenType,
  });

  factory HotItem.fromJson(Map<String, dynamic> json) => HotItem(
        name: json['name'] as String?,
        description: json['description'] as String?,
        seoName: json['seoName'] as String?,
        itemDisplayNumber: json['itemDisplayNumber'] as int?,
        id: json['id'] as String?,
        screenType: json['screenType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'seoName': seoName,
        'itemDisplayNumber': itemDisplayNumber,
        'id': id,
        'screenType': screenType,
      };

  HotItem copyWith({
    String? name,
    String? description,
    String? seoName,
    int? itemDisplayNumber,
    String? id,
    String? screenType,
  }) {
    return HotItem(
      name: name ?? this.name,
      description: description ?? this.description,
      seoName: seoName ?? this.seoName,
      itemDisplayNumber: itemDisplayNumber ?? this.itemDisplayNumber,
      id: id ?? this.id,
      screenType: screenType ?? this.screenType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HotItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      seoName.hashCode ^
      itemDisplayNumber.hashCode ^
      id.hashCode ^
      screenType.hashCode;
}
