class ProductValues {
  final int productId;
  final int quantity;

  ProductValues({required this.productId, required this.quantity});

  factory ProductValues.fromJson(Map<String, dynamic> json) {
    return ProductValues(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}

class CartProduct {
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductValues> products;
  final int v;

  CartProduct({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<ProductValues> products = productList.map((i) => ProductValues.fromJson(i)).toList();

    return CartProduct(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: products,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> productsJson = products.map((product) => product.toJson()).toList();

    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products': productsJson,
      '__v': v,
    };
  }
}
