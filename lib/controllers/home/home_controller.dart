import 'package:get/get.dart';

import '../../models/all_dishes_model.dart';
import '../../models/cart_model.dart';
import '../../models/quantity_model.dart';
import '../../models/restaurents_dishes_model.dart';
import '../../utils/utils.dart';
import '../../view_models/view_models.dart';

class HomeController extends GetxController {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  List<AllDishesModel> allDishes = [];

  List<Datum> restaurentsDishe = [];

  List<CartModel> cart = [];

  QuntityModel? quntity;

  @override
  void onInit() {
    super.onInit();
    getDishes();
  }

  Future<void> getDishes({
    bool isLoading = false,
  }) async {
    final response = await _viewModel.getDishes(isLoading: isLoading);
    if (response != null) {
      allDishes = response;
      getCart();
    }
  }

  Future<void> getDishe({
    bool isLoading = false,
  }) async {
    final response = await _viewModel.getDishe(isLoading: isLoading);
    if (response != null) {
      restaurentsDishe = response;
      getCart(isAllDishes: false);
    }
  }

  Future<void> getCart({
    bool isLoading = false,
    bool isAllDishes = true,
  }) async {
    final response = await _viewModel.getCart(isLoading: isLoading);
    if (response != null) {
      cart = response;
      if (isAllDishes) {
        for (var x = 0; x < allDishes.length; x++) {
          for (var y in cart.first.cartDetails) {
            if (allDishes[x].id == y.disheId) {
              allDishes[x].quantity = y.quantity;
            }
          }
        }
      } else {
        for (var x = 0; x < restaurentsDishe.length; x++) {
          for (var y in cart.first.cartDetails) {
            if (restaurentsDishe[x].id == y.disheId) {
              restaurentsDishe[x].quantity = y.quantity;
            }
          }
        }
      }
    }
    update();
  }

  Future<void> addQuantity({
    bool isLoading = false,
    required int restaurentId,
    required int disheId,
    required CartType type,
    bool isAllDishes = true,
  }) async {
    final response = await _viewModel.addQuantity(
      isLoading: isLoading,
      data: {
        'restaurent_id': restaurentId,
        'dishe_id': disheId,
        "type": type.name,
      },
    );
    if (response != null) {
      quntity = response;

      if (isAllDishes) {
        getDishes();
      } else {
        getDishe();
      }
    }
  }
}
