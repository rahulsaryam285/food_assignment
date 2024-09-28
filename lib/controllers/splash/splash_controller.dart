import 'package:get/get.dart';

import '../../utils/navigators/navigators.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startOnInit();
  }

  var isLoggedIn = false;

  void startOnInit() async {
    await Future.delayed(const Duration(seconds: 2));
    RouteManagement.goToHome();
    // if (isLoggedIn) {
    //   RouteManagement.goToHome();
    // } else {
    //   RouteManagement.goToSignIn();
    // }
  }
}
