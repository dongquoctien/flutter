import 'package:freezed_annotation/freezed_annotation.dart';


@immutable
class Optional {
  final String? id;
  final String? label;
  final List<String>? values;
  final String? defaultValue;
  final String? displayType;

  const Optional({
    this.id,
    this.label,
    this.values,
    this.defaultValue,
    this.displayType,
  });

  @override
  String toString() {
    return 'Optional(id: $id, label: $label, values: $values, defaultValue: $defaultValue, displayType: $displayType)';
  }

  factory Optional.fromJson(Map<String, dynamic> json) => Optional(
        id: json['id'] as String?,
        label: json['label'] as String?,
        values: json['values'] as List<String>?,
        defaultValue: json['defaultValue'] as String?,
        displayType: json['displayType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'values': values,
        'defaultValue': defaultValue,
        'displayType': displayType,
      };

  Optional copyWith({
    String? id,
    String? label,
    List<String>? values,
    String? defaultValue,
    String? displayType,
  }) {
    return Optional(
      id: id ?? this.id,
      label: label ?? this.label,
      values: values ?? this.values,
      defaultValue: defaultValue ?? this.defaultValue,
      displayType: displayType ?? this.displayType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Optional) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      values.hashCode ^
      defaultValue.hashCode ^
      displayType.hashCode;
}
