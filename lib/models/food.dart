class Food {
  String foodName;
  String desc;
  String foodImage;
  List ingredients;
  int price;

  Food(
      {required this.foodName,
      required this.price,
      required this.desc,
      required this.foodImage,
      required this.ingredients});

  factory Food.fromJson(Map map) {
    return Food(
        foodName: map['foodName'] as String,
        foodImage: map['foodImage'] as String,
        desc: map['desc'] as String,
        price: map['price'] as int,
        ingredients: map['ingredients'] as List);
  }
}
