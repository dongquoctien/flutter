import 'package:freezed_annotation/freezed_annotation.dart';

import 'footer_menu.dart';
import 'header_banner.dart';
import 'hot_item.dart';

@immutable
class HomePage {
  final List<HeaderBanner>? headerBanner;
  final List<HotItem>? hotItem;
  final List<List<FooterMenu>>? footerMenu;
  final List<dynamic>? topMenu;

  const HomePage({
    this.headerBanner,
    this.hotItem,
    this.footerMenu,
    this.topMenu,
  });

  factory HomePage.fromJson(Map<String, dynamic> json) => HomePage(
        headerBanner: (json['headerBanner'] as List<dynamic>?)
            ?.map((e) => HeaderBanner.fromJson(e as Map<String, dynamic>))
            .toList(),
        hotItem: (json['hotItem'] as List<dynamic>?)
            ?.map((e) => HotItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        footerMenu: (json['footerMenu'] as List<dynamic>?)
            ?.map((e) => (e as List<dynamic>)
                .map((e) => FooterMenu.fromJson(e as Map<String, dynamic>))
                .toList())
            .toList(),
        topMenu: json['topMenu'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'headerBanner': headerBanner?.map((e) => e.toJson()).toList(),
        'hotItem': hotItem?.map((e) => e.toJson()).toList(),
        'footerMenu':
            footerMenu?.map((e) => e.map((e) => e.toJson()).toList()).toList(),
        'topMenu': topMenu,
      };

  HomePage copyWith({
    List<HeaderBanner>? headerBanner,
    List<HotItem>? hotItem,
    List<List<FooterMenu>>? footerMenu,
    List<dynamic>? topMenu,
  }) {
    return HomePage(
      headerBanner: headerBanner ?? this.headerBanner,
      hotItem: hotItem ?? this.hotItem,
      footerMenu: footerMenu ?? this.footerMenu,
      topMenu: topMenu ?? this.topMenu,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HomePage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      headerBanner.hashCode ^
      hotItem.hashCode ^
      footerMenu.hashCode ^
      topMenu.hashCode;
}
