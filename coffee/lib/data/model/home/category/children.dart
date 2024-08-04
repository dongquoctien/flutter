import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Children {
  final String? code;
  final String? name;
  final String? seoName;
  final String? description;
  final int? priority;
  final String? imageUrl;
  final String? bannerUrl;

  const Children({
    this.code,
    this.name,
    this.seoName,
    this.description,
    this.priority,
    this.imageUrl,
    this.bannerUrl,
  });

  @override
  String toString() {
    return 'Children(code: $code, name: $name, seoName: $seoName, description: $description, priority: $priority, imageUrl: $imageUrl, bannerUrl: $bannerUrl)';
  }

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        code: json['code'] as String?,
        name: json['name'] as String?,
        seoName: json['seoName'] as String?,
        description: json['description'] as String?,
        priority: json['priority'] as int?,
        imageUrl: json['imageUrl'] as String?,
        bannerUrl: json['bannerUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'seoName': seoName,
        'description': description,
        'priority': priority,
        'imageUrl': imageUrl,
        'bannerUrl': bannerUrl,
      };

  Children copyWith({
    String? code,
    String? name,
    String? seoName,
    String? description,
    int? priority,
    String? imageUrl,
    String? bannerUrl,
    List<Children>? childrens,
  }) {
    return Children(
      code: code ?? this.code,
      name: name ?? this.name,
      seoName: seoName ?? this.seoName,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Children) return false;
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
      bannerUrl.hashCode ;
}
