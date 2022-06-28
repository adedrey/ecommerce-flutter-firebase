class Product {
  String? id;
  String? title;
  String? description;
  double? price;
  String? imageUrl;
  String? productCategoryName;
  int? quantity;
  String? productName;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.productCategoryName,
    this.quantity,
    this.productName,
  });

  static List<Product> generateProducts() {
    return [
      Product(
        productName: "Gucci oversize",
        price: 70.99,
        imageUrl: "assets/images/arrival1.png",
      ),
      Product(
        productName: "T-shirt oversize",
        price: 80.99,
        imageUrl: "assets/images/arrival2.png",
      ),
    ];
  }
}
