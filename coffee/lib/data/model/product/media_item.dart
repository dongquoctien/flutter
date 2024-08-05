import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class MediaItem {
  final String? id;
  final String? type;
  final String? mediaUrl;

  const MediaItem({this.id, this.type, this.mediaUrl});

  @override
  String toString() {
    return 'MediaItem(id: $id, type: $type, mediaUrl: $mediaUrl)';
  }

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
        id: json['id'] as String?,
        type: json['type'] as String?,
        mediaUrl: json['mediaUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'mediaUrl': mediaUrl,
      };

  MediaItem copyWith({
    String? id,
    String? type,
    String? mediaUrl,
  }) {
    return MediaItem(
      id: id ?? this.id,
      type: type ?? this.type,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MediaItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ mediaUrl.hashCode;
}
