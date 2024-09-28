import 'package:flutter/material.dart';
import 'package:food/views/home/dish_card.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../res/res.dart';
import '../../utils/enums.dart';
import '../../utils/navigators/navigators.dart';
import '../../widgets/loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dishes'),
              centerTitle: true,
            ),
            body: controller.allDishes.isEmpty
                ? const AppLoader()
                : ListView.separated(
                    padding: Dimens.edgeInsets10_0,
                    itemCount: controller.allDishes.length,
                    itemBuilder: (context, index) {
                      final dish = controller.allDishes[index];
                      return DishCard(
                        onDescreaseTap: () {
                          controller.addQuantity(
                            disheId: dish.id,
                            restaurentId: dish.restaurentId,
                            type: CartType.minus,
                          );
                        },
                        onIncreaseTap: () {
                          controller.addQuantity(
                            disheId: dish.id,
                            restaurentId: dish.restaurentId,
                            type: CartType.add,
                          );
                        },
                        onTapCard: RouteManagement.goToRestDisth,
                        imageUrl: dish.coverImage,
                        name: dish.name,
                        price: dish.price,
                        quantity: '${dish.quantity ?? 0}',
                        rating: dish.vote,
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.boxHeight20,
                  ),
          );
        },
      );
}
