import 'package:ecommerce_udemy/features/cartscreen/data/model/cart_model.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final bool loading;
  final String? error;
  final List<CartModel> carts;
  final List<ProductInCart> productInCarts;

  const CartState({
    this.loading = false,
    this.error,
    this.carts = const [],
    this.productInCarts = const [],
  });

  CartState copyWith({
    bool? loading,
    String? error,
    List<CartModel>? carts,
    List<ProductInCart>? productInCarts,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      carts: carts ?? this.carts,
      productInCarts: productInCarts ?? this.productInCarts,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        carts,
        productInCarts,
      ];
}