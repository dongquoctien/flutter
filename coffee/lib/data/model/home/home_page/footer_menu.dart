import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class FooterMenu {
  final String? name;
  final String? seoName;

  const FooterMenu({this.name, this.seoName});

  factory FooterMenu.fromJson(Map<String, dynamic> json) => FooterMenu(
        name: json['name'] as String?,
        seoName: json['seoName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'seoName': seoName,
      };

  FooterMenu copyWith({
    String? name,
    String? seoName,
  }) {
    return FooterMenu(
      name: name ?? this.name,
      seoName: seoName ?? this.seoName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FooterMenu) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ seoName.hashCode;
}
