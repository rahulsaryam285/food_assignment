import '../data/data.dart';
import '../models/models.dart';
import '../utils/enums.dart';

class HomeRepository {
  final ApiWrapper _apiWrapper = ApiWrapper();

  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjozLCJpYXQiOjE3MjY3Mzk3MzIsImV4cCI6MTc1ODI3NTczMn0.12s9mY9zh0yNlEA2UD4zFvr_uE4_RzK9pqqbumS5IsA'
  };

  Future<ResponseModel> getDishes({required bool isLoading}) async {
    return await _apiWrapper.makeRequest(
      Apis.allDishes,
      type: RequestType.get,
      headers: headers,
      showLoader: isLoading,
    );
  }

  Future<ResponseModel> getDishe({required bool isLoading}) async {
    return await _apiWrapper.makeRequest(
      Apis.dishes,
      type: RequestType.get,
      headers: headers,
      showLoader: isLoading,
    );
  }

  Future<ResponseModel> getCart({required bool isLoading}) async {
    return await _apiWrapper.makeRequest(
      Apis.cart,
      type: RequestType.get,
      headers: headers,
      showLoader: isLoading,
    );
  }

  Future<ResponseModel> addQuantity({
    required bool isLoading,
    required Map<String, dynamic> data,
  }) async {
    return await _apiWrapper.makeRequest(
      Apis.quantity,
      type: RequestType.post,
      payload: data,
      headers: headers,
      showLoader: isLoading,
    );
  }
}
