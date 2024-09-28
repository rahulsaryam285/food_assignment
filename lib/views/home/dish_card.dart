import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../res/res.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    this.onTapCard,
    required this.onDescreaseTap,
    required this.onIncreaseTap,
    required this.rating,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });

  final VoidCallback? onTapCard;
  final VoidCallback onIncreaseTap;

  final VoidCallback onDescreaseTap;
  final String imageUrl;
  final String name;
  final String rating;
  final String price;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      //  () {
      //   RouteManagement.goToRestDisth();
      // },
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
                '${Apis.imageUrl}$imageUrl',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
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
                          borderRadius: BorderRadius.circular(Dimens.ten)),
                      child: Text(
                        rating,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
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
                        borderRadius: BorderRadius.circular(Dimens.twenty),
                      ),
                      margin: Dimens.edgeInsets0
                          .copyWith(bottom: Dimens.ten, right: Dimens.ten),
                      height: Dimens.fifty,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: onDescreaseTap,
                            icon: const Icon(
                              Icons.remove_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            quantity,
                            style: TextStyle(fontSize: Dimens.twenty),
                          ),
                          IconButton(
                            onPressed: onIncreaseTap,
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
  }
}
