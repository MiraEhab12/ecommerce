class CartResponseModel {
  final List<CartModel> carts;
  final int total;
  final int skip;
  final int limit;

  CartResponseModel({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartResponseModel.fromMap(Map<String, dynamic> map) {
    return CartResponseModel(
      carts: (map['carts'] as List<dynamic>? ?? [])
          .map((e) => CartModel.fromMap(e))
          .toList(),
      total: map['total'] ?? 0,
      skip: map['skip'] ?? 0,
      limit: map['limit'] ?? 0,
    );
  }
}
class CartModel {
  final int id;
  final List<ProductInCart> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? 0,
      products: (map['products'] as List<dynamic>? ?? [])
          .map((e) => ProductInCart.fromMap(e))
          .toList(),
      total: (map['total'] ?? 0).toDouble(),
      discountedTotal: (map['discountedTotal'] ?? 0).toDouble(),
      userId: map['userId'] ?? 0,
      totalProducts: map['totalProducts'] ?? 0,
      totalQuantity: map['totalQuantity'] ?? 0,
    );
  }
}
class ProductInCart {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  ProductInCart({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory ProductInCart.fromMap(Map<String, dynamic> map) {
    return ProductInCart(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 0,
      total: (map['total'] ?? 0).toDouble(),
      discountPercentage:
          (map['discountPercentage'] ?? 0).toDouble(),
      discountedTotal:
          (map['discountedTotal'] ?? 0).toDouble(),
      thumbnail: map['thumbnail'] ?? '',
    );
  }
}