import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/home/home.dart';
import 'package:flutter_food/res/res.dart';
import 'package:flutter_food/utils/navigators/navigators.dart';
import 'package:flutter_food/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../../utils/enums.dart';

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

                      return InkWell(
                        onTap: () {
                          RouteManagement.goToRestDisth();
                        },
                        child: Stack(
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
                                                  restaurentId:
                                                      dish.restaurentId,
                                                  type: CartType.minus,
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
                                                  restaurentId:
                                                      dish.restaurentId,
                                                  type: CartType.add,
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.boxHeight20,
                  ),
          );
        },
      );
}
