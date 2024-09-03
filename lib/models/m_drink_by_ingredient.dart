class DrinkByIngredientModel {
  String drinkName;
  String drinkImage;
  int drinkId;

  DrinkByIngredientModel(
      {required this.drinkName,
      required this.drinkImage,
      required this.drinkId});

  factory DrinkByIngredientModel.fromApi({required Map<String, dynamic> data}) {
    int drink_id = int.tryParse(data["idDrink"].toString()) ?? -1;
    return DrinkByIngredientModel(
        drinkName: data["strDrink"].toString(),
        drinkImage: data["strDrinkThumb"].toString(),
        drinkId: drink_id);
  }
}
