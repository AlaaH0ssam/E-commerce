class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width']?.toDouble() ?? 0.0,
      height: json['height']?.toDouble() ?? 0.0,
      depth: json['depth']?.toDouble() ?? 0.0,
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Furniture {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String availabilityStatus;
  final String warrantyInformation;
  final String shippingInformation;
  final List<String> tags;
  final String imageUrl;

  Furniture({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.availabilityStatus,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.tags,
    required this.imageUrl,
  });

  factory Furniture.fromJson(Map<String, dynamic> json) {
    return Furniture(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'].toDouble(),
      dimensions: Dimensions.fromJson(json['dimensions']),
      availabilityStatus: json['availabilityStatus'],
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      tags: List<String>.from(json['tags'] ?? []),
      imageUrl: json['thumbnail'] ?? '',
    );
  }
}
