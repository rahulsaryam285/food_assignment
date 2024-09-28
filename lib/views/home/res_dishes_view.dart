import 'package:flutter/material.dart';
import 'package:food/views/home/dish_card.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../res/res.dart';
import '../../utils/enums.dart';
import '../../widgets/widgets.dart';

class RestDishesView extends StatelessWidget {
  const RestDishesView({super.key});

  static const String route = '/rest-dishes';

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      initState: (state) {
        Get.find<HomeController>().getDishe();
      },
      dispose: (state) {
        Get.find<HomeController>().getDishes();
      },
      builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('Restaurents Dishes'),
              centerTitle: true,
            ),
            body: controller.restaurentsDishe.isEmpty
                ? const AppLoader()
                : ListView.separated(
                    padding: Dimens.edgeInsets10_0,
                    itemCount: controller.restaurentsDishe.length,
                    itemBuilder: (context, index) {
                      final dish = controller.restaurentsDishe[index];

                      return DishCard(
                        onDescreaseTap: () {
                          controller.addQuantity(
                            disheId: dish.id,
                            restaurentId: dish.restaurentId,
                            type: CartType.minus,
                            isAllDishes: false,
                          );
                        },
                        onIncreaseTap: () {
                          controller.addQuantity(
                            disheId: dish.id,
                            restaurentId: dish.restaurentId,
                            type: CartType.add,
                            isAllDishes: false,
                          );
                        },
                        imageUrl: dish.coverImage,
                        name: dish.name,
                        price: dish.price,
                        quantity: '${dish.quantity ?? 0}',
                        rating: dish.vote,
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.boxHeight20,
                  ),
          ));
}
