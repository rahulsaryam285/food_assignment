import 'dart:convert';

import '../models/all_dishes_model.dart';
import '../models/cart_model.dart';
import '../models/quantity_model.dart';
import '../models/restaurents_dishes_model.dart';
import '../repositories/repositories.dart';
import '../utils/utils.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  Future<List<AllDishesModel>?> getDishes({
    required bool isLoading,
  }) async {
    try {
      var res = await _repository.getDishes(
        isLoading: isLoading,
      );
      if (res.hasError) {
        return null;
      }

      final data = jsonDecode(res.data) as Map<String, dynamic>;
      return (data['data'] as List)
          .map((e) => AllDishesModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      AppLog.error('getDishes $e', st);
      return null;
    }
  }

  Future<List<Datum>?> getDishe({
    required bool isLoading,
  }) async {
    try {
      var res = await _repository.getDishe(
        isLoading: isLoading,
      );
      if (res.hasError) {
        return null;
      }
      final data = jsonDecode(res.data) as Map<String, dynamic>;
      return (data['data']['data'] as List)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      AppLog.error('getDishe $e', st);
      return null;
    }
  }

  Future<List<CartModel>?> getCart({
    required bool isLoading,
  }) async {
    try {
      var res = await _repository.getCart(
        isLoading: isLoading,
      );
      if (res.hasError) {
        return null;
      }
      final data = jsonDecode(res.data) as Map<String, dynamic>;
      return (data['data'] as List)
          .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      AppLog.error('getCart $e', st);
      return null;
    }
  }

  Future<QuntityModel?> addQuantity({
    required bool isLoading,
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _repository.addQuantity(
        isLoading: isLoading,
        data: data,
      );
      if (res.hasError) {
        return null;
      }
      final jsondata = jsonDecode(res.data) as Map<String, dynamic>;
      return QuntityModel.fromJson(jsondata['data'] as Map<String, dynamic>);
    } catch (e, st) {
      AppLog.error('post quantity $e', st);
      return null;
    }
  }
}
