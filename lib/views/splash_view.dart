import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/splash/splash.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String route = '/splash';

  @override
  Widget build(BuildContext context) =>
      GetBuilder<SplashController>(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(),
                SizedBox(height: 30),
                Text('Fluter Food'),
              ],
            ),
          ),
        );
      });
}
