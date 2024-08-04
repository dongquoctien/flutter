import 'package:freezed_annotation/freezed_annotation.dart';

import 'children.dart';

@immutable
class Category {
  final String? code;
  final String? name;
  final String? seoName;
  final String? description;
  final int? priority;
  final String? imageUrl;
  final String? bannerUrl;
  final List<Children>? childrens;

  const Category({
    this.code,
    this.name,
    this.seoName,
    this.description,
    this.priority,
    this.imageUrl,
    this.bannerUrl,
    this.childrens,
  });

  @override
  String toString() {
    return 'Category(code: $code, name: $name, seoName: $seoName, description: $description, priority: $priority, imageUrl: $imageUrl, bannerUrl: $bannerUrl, childrens: $childrens)';
  }

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        code: json['code'] as String?,
        name: json['name'] as String?,
        seoName: json['seoName'] as String?,
        description: json['description'] as String?,
        priority: json['priority'] as int?,
        imageUrl: json['imageUrl'] as String?,
        bannerUrl: json['bannerUrl'] as String?,
        childrens: (json['childrens'] as List<dynamic>?)
            ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'seoName': seoName,
        'description': description,
        'priority': priority,
        'imageUrl': imageUrl,
        'bannerUrl': bannerUrl,
        'childrens': childrens?.map((e) => e.toJson()).toList(),
      };

  Category copyWith({
    String? code,
    String? name,
    String? seoName,
    String? description,
    int? priority,
    String? imageUrl,
    String? bannerUrl,
    List<Children>? childrens,
  }) {
    return Category(
      code: code ?? this.code,
      name: name ?? this.name,
      seoName: seoName ?? this.seoName,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      childrens: childrens ?? this.childrens,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      code.hashCode ^
      name.hashCode ^
      seoName.hashCode ^
      description.hashCode ^
      priority.hashCode ^
      imageUrl.hashCode ^
      bannerUrl.hashCode ^
      childrens.hashCode;
}
