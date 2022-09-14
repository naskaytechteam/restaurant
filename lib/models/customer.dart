class Customer {
  String name;
  String email;
  String? phoneNo;
  String? image;
  String? favoriteFood;

  Customer({required this.name,
    required this.email,
    this.phoneNo,
    this.image,
    this.favoriteFood
  });

  factory Customer.fromJson(Map map) {
    return Customer(
        name: map['name'],
        email: map['email'],
        phoneNo: map['phoneNo'],
        favoriteFood: map['favoriteFood'],
        image: map['image']);
  }

  Map<String, dynamic> topJson() {
    return {'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'image': image,
      'favoriteFood':favoriteFood
    };
  }
}
