class Command{
 
  String time;
  double quantity_sugar;
  String price;
  int size;
  String num_serie_destributeur;
  int id_boisson;

  Command(
      {
      required this.time,
      required this.quantity_sugar,
      required this.price,
      required this.size,
      required this.num_serie_destributeur,
      required this.id_boisson});

  factory Command.fromJson(Map<String, dynamic> json) {
    //another constractor that take json objects and return a model

    return Command(
       
        time: json['time_cmd'],
        price: json['prix_cmd'],
        quantity_sugar: json['quantite_sucre'],
        size: json['taille_goblet'],
        id_boisson: json['id_boisson'],
        num_serie_destributeur: json['numero_serie_distributeur']);
  }

//to transform to json
  Map<String, dynamic> toJson() {
    return {
     
      "time_cmd": time,
      "prix_cmd":price,
      "quantite_sucre": quantity_sugar,
      "taille_goblet": size,
      "id_boisson": id_boisson,
      "numero_serie_distributeur": num_serie_destributeur
    };
  }
}

