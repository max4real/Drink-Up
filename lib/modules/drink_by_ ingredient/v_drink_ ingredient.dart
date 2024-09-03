import 'package:drink_up/modules/drink_by_%20ingredient/c_drink_by_%20ingredient.dart';
import 'package:drink_up/modules/drink_details/v_drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkByIngredient extends StatelessWidget {
  String name_;
  DrinkByIngredient({super.key, required this.name_});

  @override
  Widget build(BuildContext context) {
    DrinkByIngredientController controller =
        Get.put(DrinkByIngredientController());
    controller.onInitLoad(name: name_);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Lest's Drink"),
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.xFetching,
          builder: (context, value, child) {
            if (value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 148, 135, 246),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.fetchDrinksByIngredient();
                },
                child: ValueListenableBuilder(
                  valueListenable: controller.drinkByIngredient_Lst,
                  builder: (context, value, child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 4 / 5),
                      itemCount: value.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final each = value[index];
                        return GestureDetector(
                          onTap: (){
                            Get.to(DrinkDetailPage(drinkByIngredientModel: each));
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 108, 118, 228)
                                .withOpacity(1),
                            // const Color.fromARGB(255, 148, 135, 246) .withOpacity(1),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    each.drinkImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        // borderRadius: BorderRadius.circular(5)
                                        ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.5, vertical: 4),
                                    child: Text(
                                      each.drinkName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
