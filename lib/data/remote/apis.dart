/// This class is used for all the APIs endpoints
class Apis {
  const Apis._();

  static const String baseUrl =
      'http://milzac.node.profcymabackend.com:3002/api/';

  static const allDishes = 'without-login/masters/all-recommended-dishes';
  static const dishes = 'user/restaurents/dishes';
  static const cart = 'user/cart';
  static const quantity = 'user/cart/quantity';

  static const String imageUrl = 'http://milzac.node.profcymabackend.com:3002';
}
