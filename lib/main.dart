import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/reset_cubit/reset_cubit.dart';
import 'package:shop_app/cubits/signup_cubit/signup_cubit.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/splash_view.dart';

import 'cubits/signin_cubit/signin_cubit.dart';
import 'firebase_options.dart';
import 'views/reset_password_view.dart';
import 'views/sign_in_view.dart';
import 'views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninCubit(),
        ),
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => ResetCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shop App',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          HomeView.id: (context) => const HomeView(),
          SplashView.id: (context) => const SplashView(),
          ResetPasswordView.id: (context) => ResetPasswordView(),
          SignInView.id: (context) => SignInView(),
          SignUpView.id: (context) => SignUpView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
