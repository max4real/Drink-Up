import 'package:drink_up/models/m_drink_by_ingredient.dart';
import 'package:drink_up/models/m_ingredient.dart';
import 'package:drink_up/modules/drink_by_%20ingredient/v_drink_%20ingredient.dart';

class DrinkDetailModel extends DrinkByIngredientModel {
  String instructions;
  List<CockTaillDetailModel> cocktailDetail;

  DrinkDetailModel({
    required super.drinkName,
    required super.drinkImage,
    required super.drinkId,
    required this.instructions,
    required this.cocktailDetail,
  });

  factory DrinkDetailModel.fromApi({required Map<String, dynamic> data}) {
    int id;
    id = int.tryParse(data["idDrink"].toString()) ?? -1;

    List<CockTaillDetailModel> temp = [];

    for (var i = 1; i <= 15; i++) {
      String? strIngredient = data["strIngredient$i"];
      String? strMeasure = data["strMeasure$i"];

      if (strIngredient == null) {
        break;
      } else {
        IngredientModel ingredientModel_ =
            IngredientModel.fromApi(data: {"strIngredient1": strIngredient});

        CockTaillDetailModel mesure = CockTaillDetailModel(
            ingredientModel: ingredientModel_, measurement: strMeasure);

        temp.add(mesure);
      }
    }

    return DrinkDetailModel(
      drinkName: data["strDrink"].toString(),
      drinkImage: data["strDrinkThumb"].toString(),
      drinkId: id,
      instructions: data["strInstructions"].toString(),
      cocktailDetail: temp,
    );
  }
}

class CockTaillDetailModel {
  IngredientModel ingredientModel;

  String? measurement;

  CockTaillDetailModel({
    required this.ingredientModel,
    required this.measurement,
  });
}
