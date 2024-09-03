import 'package:drink_up/modules/drink_by_%20ingredient/v_drink_%20ingredient.dart';
import 'package:drink_up/modules/home_page/c_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage_ extends StatelessWidget {
  const HomePage_({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
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
                  controller.fetchAllIngredients();
                },
                child: ValueListenableBuilder(
                  valueListenable: controller.allIngredients,
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
                          onTap: () {
                            Get.to(() =>
                                DrinkByIngredient(name_: each.ingredientName));
                          },
                          child: Card(
                            // color: const Color.fromARGB(255, 108, 118, 228).withOpacity(1),
                            color: const Color.fromARGB(255, 223, 225, 230).withOpacity(1),

                            // const Color.fromARGB(255, 148, 135, 246) .withOpacity(1),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.network(
                                    each.ingredientImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 18, 16, 54).withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    child: Text(
                                      each.ingredientName,
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
