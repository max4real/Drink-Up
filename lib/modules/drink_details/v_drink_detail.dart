import 'package:drink_up/models/m_drink_by_ingredient.dart';
import 'package:drink_up/modules/drink_details/c_drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkDetailPage extends StatelessWidget {
  late DrinkByIngredientModel drinkByIngredientModel;
   DrinkDetailPage({super.key, required this.drinkByIngredientModel});

  @override
  Widget build(BuildContext context) {
    DrinkDetailController controller = Get.put(DrinkDetailController());
    controller.onInitLoad(data: drinkByIngredientModel);
    return Scaffold(
        appBar: AppBar(
          title: Text(drinkByIngredientModel.drinkName),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Hero(
                      tag: drinkByIngredientModel.drinkImage,
                      child: Image.network(
                        drinkByIngredientModel.drinkImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            Expanded(
              child: SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable: controller.xFetching,
                  builder: (context, value, child) {
                    if (value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                        
                          SizedBox(
                            width: double.infinity,
                            height: 110,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: controller.detailModel.cocktailDetail
                                    .map((toElement) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          child: Image.network(toElement
                                              .ingredientModel.ingredientImage),
                                        ),
                                        SizedBox(
                                            height: 30,
                                            child: Column(
                                              children: [
                                                Text(
                                                  toElement
                                                      .ingredientModel.ingredientName,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  toElement.measurement
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Colors.black),
                            child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Instruction",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      controller.detailModel.instructions
                                         ,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    )
                                  ],
                                )),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
