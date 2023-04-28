class DrinkModel {
  int id;
  String time;
  String title;
  String description;
 double price;
  // String ingredients;
  String image;

  DrinkModel(
      {required this.id,
      required this.time,
      required this.title,
      required this.description,
      required this.price,
      // required this.ingredients,
      required this.image});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    //another constractor that take json objects and return a model

    return DrinkModel(
        id: json['id_boisson'],
        time:json['duree_preparation_boisson'],
        title: json['libelle_boisson'],
        description: json['description_boisson'],
        price: json['prix_boisson'],
        // ingredients: json['ingredients'],
        image: json['path_image_boisson']);
  }

//to transform to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "price": price,
      // "ingrdients": ingredients,
      "image": image
    };
  }
}
