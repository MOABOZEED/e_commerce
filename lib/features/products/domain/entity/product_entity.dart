import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final List<String>? image;
  final int quantity;

  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.quantity = 0,
  });

  ProductEntity copyWith({
    int? quantity,
  }) {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    quantity,
  ];
}