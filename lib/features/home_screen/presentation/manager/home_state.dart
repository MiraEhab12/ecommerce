import 'package:ecommerce_udemy/features/home_screen/data/model/home_model.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final bool loading;
  final String? error;
  final List<ProductModel> products;

  const ProductState({
    this.loading = false,
    this.error,
    this.products = const [],
  });

  ProductState copyWith({
    bool? loading,
    String? error,
    List<ProductModel>? products,
  }) {
    return ProductState(
      loading: loading ?? this.loading,
      error: error,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [loading, error, products];
}
