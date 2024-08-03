import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class HeaderBanner {
  final String? name;
  final String? subTitle;
  final String? actionType;
  final String? imageUrl;
  final String? actionId;
  final String? url;
  final String? id;
  final String? screenType;

  const HeaderBanner({
    this.name,
    this.subTitle,
    this.actionType,
    this.imageUrl,
    this.actionId,
    this.url,
    this.id,
    this.screenType,
  });

  factory HeaderBanner.fromJson(Map<String, dynamic> json) => HeaderBanner(
        name: json['name'] as String?,
        subTitle: json['subTitle'] as String?,
        actionType: json['actionType'] as String?,
        imageUrl: json['imageUrl'] as String?,
        actionId: json['actionId'] as String?,
        url: json['url'] as String?,
        id: json['id'] as String?,
        screenType: json['screenType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'subTitle': subTitle,
        'actionType': actionType,
        'imageUrl': imageUrl,
        'actionId': actionId,
        'url': url,
        'id': id,
        'screenType': screenType,
      };

  HeaderBanner copyWith({
    String? name,
    String? subTitle,
    String? actionType,
    String? imageUrl,
    String? actionId,
    String? url,
    String? id,
    String? screenType,
  }) {
    return HeaderBanner(
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      actionType: actionType ?? this.actionType,
      imageUrl: imageUrl ?? this.imageUrl,
      actionId: actionId ?? this.actionId,
      url: url ?? this.url,
      id: id ?? this.id,
      screenType: screenType ?? this.screenType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HeaderBanner) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      subTitle.hashCode ^
      actionType.hashCode ^
      imageUrl.hashCode ^
      actionId.hashCode ^
      url.hashCode ^
      id.hashCode ^
      screenType.hashCode;
}
