import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Paging {
  final int? totalCount;
  final int? pageSize;
  final int? totalPages;
  final int? pageNumber;
  final int? pagingCounter;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  final dynamic prev;
  final int? next;

  const Paging({
    this.totalCount,
    this.pageSize,
    this.totalPages,
    this.pageNumber,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prev,
    this.next,
  });

  @override
  String toString() {
    return 'Paging(totalCount: $totalCount, pageSize: $pageSize, totalPages: $totalPages, pageNumber: $pageNumber, pagingCounter: $pagingCounter, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prev: $prev, next: $next)';
  }

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        totalCount: json['totalCount'] as int?,
        pageSize: json['pageSize'] as int?,
        totalPages: json['totalPages'] as int?,
        pageNumber: json['pageNumber'] as int?,
        pagingCounter: json['pagingCounter'] as int?,
        hasPrevPage: json['hasPrevPage'] as bool?,
        hasNextPage: json['hasNextPage'] as bool?,
        prev: json['prev'] as dynamic,
        next: json['next'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'pageSize': pageSize,
        'totalPages': totalPages,
        'pageNumber': pageNumber,
        'pagingCounter': pagingCounter,
        'hasPrevPage': hasPrevPage,
        'hasNextPage': hasNextPage,
        'prev': prev,
        'next': next,
      };

  Paging copyWith({
    int? totalCount,
    int? pageSize,
    int? totalPages,
    int? pageNumber,
    int? pagingCounter,
    bool? hasPrevPage,
    bool? hasNextPage,
    dynamic prev,
    int? next,
  }) {
    return Paging(
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
      pageNumber: pageNumber ?? this.pageNumber,
      pagingCounter: pagingCounter ?? this.pagingCounter,
      hasPrevPage: hasPrevPage ?? this.hasPrevPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      prev: prev ?? this.prev,
      next: next ?? this.next,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Paging) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      totalCount.hashCode ^
      pageSize.hashCode ^
      totalPages.hashCode ^
      pageNumber.hashCode ^
      pagingCounter.hashCode ^
      hasPrevPage.hashCode ^
      hasNextPage.hashCode ^
      prev.hashCode ^
      next.hashCode;
}
