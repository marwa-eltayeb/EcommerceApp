class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final String? brand;
  final double rating;
  final int stock;
  final double discountPercentage;
  final int weight;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.brand,
    required this.rating,
    required this.stock,
    required this.discountPercentage,
    required this.weight,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['thumbnail'],
      category: json['category'],
      brand: json['brand'] as String?,
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      discountPercentage: json['discountPercentage'].toDouble(),
      weight: json['weight'],
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
    );
  }
}