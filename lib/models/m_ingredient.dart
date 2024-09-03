import 'package:drink_up/services/api_end_point.dart';

class IngredientModel {
  String ingredientName;
  String ingredientImage;

  IngredientModel(
      {required this.ingredientName, required this.ingredientImage});

  factory IngredientModel.fromApi({required Map<String, dynamic> data}){
    return IngredientModel(
      ingredientName: data["strIngredient1"].toString(), 
      ingredientImage: "${ApiEndPoint().ingredientImageBaseUrl+"/"+data["strIngredient1"]}.png");
  }
}