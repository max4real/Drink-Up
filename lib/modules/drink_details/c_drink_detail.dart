import 'package:drink_up/models/m_drink_by_ingredient.dart';
import 'package:drink_up/models/m_drink_detail.dart';
import 'package:drink_up/services/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkDetailController extends GetxController {
  late DrinkDetailModel detailModel; /////here
  late DrinkByIngredientModel data_;
  ValueNotifier<bool> xFetching = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onInitLoad({required DrinkByIngredientModel data}) async {
    data_ = data;
    await fetchDetail();
  }

  Future<void> fetchDetail() async {
    String url = ApiEndPoint().baseUrl +
        ApiEndPoint().getDrinkDetailUrl +
        data_.drinkId.toString();

    xFetching.value = true;
    GetConnect client = GetConnect(timeout: const Duration(seconds: 10));
    final response = await client.get(url);

    if (response.isOk) {
      Iterable iterable = response.body["drinks"] ?? [];
      Map<String, dynamic> rawData = iterable.firstOrNull ?? {};
      detailModel = DrinkDetailModel.fromApi(data: rawData);
      xFetching.value = false;
    }
  }
}
