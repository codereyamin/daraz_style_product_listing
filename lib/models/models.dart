class Product {
  final int id;
  final String title;
  final double price;
  final String image;

  Product({required this.id, required this.title, required this.price, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(id: json['id'], title: json['title'], price: (json['price'] as num).toDouble(), image: json['image']);
  }
}

class UserProfile {
  final int id;
  final String username;
  final String email;

  UserProfile({required this.id, required this.username, required this.email});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(id: json['id'], username: json['username'], email: json['email']);
  }
}
