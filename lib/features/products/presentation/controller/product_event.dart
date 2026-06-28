import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {}

class SearchProductsEvent extends ProductEvent {
  final String query;

  SearchProductsEvent(this.query);
}

// class RefreshProductsEvent extends ProductEvent {}

// class SearchProductsEvent extends ProductEvent {
//   final String query;
//
//   const SearchProductsEvent(this.query);
//
//   @override
//   List<Object?> get props => [query];
// }