import 'package:flutter/material.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        HomeView.id: (context) => const HomeView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
