import 'package:drink_up/models/m_drink_by_ingredient.dart';
import 'package:drink_up/services/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkByIngredientController extends GetxController {
  ValueNotifier<List<DrinkByIngredientModel>> drinkByIngredient_Lst =
      ValueNotifier([]);
  ValueNotifier<bool> xFetching = ValueNotifier(false);
  late String name_;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onInitLoad({required String name}) async {
    name_ = name;
    fetchDrinksByIngredient();
  }

  Future<void> fetchDrinksByIngredient() async {
    String url =
        ApiEndPoint().baseUrl + ApiEndPoint().getDrinkByIngredientsUrl + name_;

    xFetching.value = true;
    GetConnect client = GetConnect(timeout: const Duration(seconds: 10));
    final response = await client.get(url);
    xFetching.value = false;

    if (response.isOk) {
      Iterable iterable = response.body["drinks"] ?? [];
      List<DrinkByIngredientModel> temp = [];
      for (var element in iterable) {
        DrinkByIngredientModel data =
            DrinkByIngredientModel.fromApi(data: element);
        temp.add(data);
      }

      drinkByIngredient_Lst.value = temp;
    }
  }
}
