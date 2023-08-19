import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_app/consts.dart';
import 'package:shop_app/views/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        "assets/json/splashView2.json",
        width: 120,
        height: 120,
      ),
      backgroundColor: backColor,
      nextScreen: const HomeView(),
      splashIconSize: 350,
      duration: 1700,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
