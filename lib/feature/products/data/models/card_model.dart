class CartItem {
  final String productId;
  final String title;
  final String image;
  final double price;
  final int quantity;

  CartItem({
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      "productId": productId,
      "title": title,
      "image": image,
      "price": price,
      "quantity": quantity,
    };
  }
}
