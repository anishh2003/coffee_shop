// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoffeeModel {
  int id;
  String title;
  String description;
  String image;
  double smallPrice;
  double mediumPrice;
  double largePrice;
  int quantity;
  CoffeeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.smallPrice,
    required this.mediumPrice,
    required this.largePrice,
    this.quantity = 0,
  });
}
