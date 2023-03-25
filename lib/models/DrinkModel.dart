class DrinkModel {
  int id;
  String title;
  String description;
  String price;
  String ingredients;
  String image;

  DrinkModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.ingredients,
      required this.image});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    //another constractor that take json objects and return a model

    return DrinkModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        ingredients: json['ingredients'],
        image: json['image']);
  }

//to transform to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "price": price,
      "ingrdients": ingredients,
      "image": image
    };
  }
}
