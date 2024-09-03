import 'package:drink_up/models/m_ingredient.dart';
import 'package:drink_up/services/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  ValueNotifier<List<IngredientModel>> allIngredients = ValueNotifier([]);
  ValueNotifier<bool> xFetching = ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitLoad();
  }

  Future<void> onInitLoad() async {
    fetchAllIngredients();
  }

  Future<void> fetchAllIngredients() async {
    allIngredients.value = [];

    ///remove all the data before fetching
    String url = ApiEndPoint().baseUrl + ApiEndPoint().getAllIngredientsUrl;
    xFetching.value = true;
    GetConnect client = GetConnect(timeout: const Duration(seconds: 10));

    Response response = await client.get(url);
    xFetching.value = false;

    if (response.isOk) {
      Iterable iterable = response.body["drinks"] ?? [];
      List<IngredientModel> temp = [];
      for (var element in iterable) {
        IngredientModel data = IngredientModel.fromApi(data: element);
        temp.add(data);
      }
      allIngredients.value = temp;
    } else {
      //do something
    }
  }
}
