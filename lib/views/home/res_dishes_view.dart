import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/home/home.dart';
import 'package:get/get.dart';

import '../../data/remote/apis.dart';
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
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: Dimens.twoHundredFifty,
                            width: Dimens.percentWidth(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.thirty,
                              ),
                              child: Image.network(
                                '${Apis.imageUrl}${dish.coverImage}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: Dimens.edgeInsets10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dish.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimens.fifteen,
                                      ),
                                    ),
                                    Container(
                                      padding: Dimens.edgeInsets5,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(
                                              Dimens.ten)),
                                      child: Text(
                                        dish.vote,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimens.fifteen,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dish.price,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimens.fifteen,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Free Delivery',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimens.fifteen,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimens.twenty),
                                      ),
                                      margin: Dimens.edgeInsets0.copyWith(
                                          bottom: Dimens.ten,
                                          right: Dimens.ten),
                                      height: Dimens.fifty,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller.addQuantity(
                                                disheId: dish.id,
                                                restaurentId: dish.restaurentId,
                                                type: CartType.minus,
                                                isAllDishes: false,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove_outlined,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${dish.quantity ?? 0}',
                                            style: TextStyle(
                                                fontSize: Dimens.twenty),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.addQuantity(
                                                disheId: dish.id,
                                                restaurentId: dish.restaurentId,
                                                type: CartType.add,
                                                isAllDishes: false,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.boxHeight20,
                  ),
          ));
}
