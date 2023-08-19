import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/consts.dart';
import 'package:shop_app/views/home_view.dart';
import 'package:shop_app/views/sign_up_view.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import '../helpers/show_error_snack_bar.dart';
import '../helpers/validation_helper.dart';
import '../widgets/custom_email_text_field.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/custom_password_text_field.dart';
import '../helpers/show_success_snack_bar.dart';
import 'reset_password_view.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  static String id = "SignInScreen";
  final _form = GlobalKey<FormState>();
  late String? email;
  late String? password;
  late String? rePassword;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninLoading) {
          _isLoading = true;
        } else if (state is SigninSuccess) {
          Navigator.pushNamed(context, HomeView.id);
          _isLoading = false;
          showSuccessSnackBar(context, state.successMessage);
        } else if (state is SigninFailure) {
          showErrorSnackBar(context, state.errorMessage);
          _isLoading = false;
        }
      },
      child: Scaffold(
        backgroundColor: backColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.06),
                  Center(
                    child: Image.asset(
                      "assets/images/logoLogin.png",
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.3,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: textColor,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gilroy-Medium",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Enter your email and password",
                    style: TextStyle(
                      color: const Color(0xff7C7C7C),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Gilroy-Medium",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomEmailTextField(
                    controller: _emailController,
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      return validateEmail(value!);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomPasswordTextField(
                    controller: _passwordController,
                    text: "PASSWORD",
                    onChanged: (data) {
                      password = data;
                    },
                    validator: (value) {
                      return validatePassword(value!);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.002),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ResetPasswordView.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: color1,
                            fontSize: screenWidth * 0.04,
                            decoration: TextDecoration.underline,
                            fontFamily: "Gilroy-Medium",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Center(
                    child: BlocBuilder<SigninCubit, SigninState>(
                      builder: (context, state) {
                        return _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff8d0000),
                                ),
                              )
                            : CustomMainButton(
                                text: "Sign In",
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    BlocProvider.of<SigninCubit>(context)
                                        .signInUser(
                                      email: email!,
                                      password: password!,
                                    );
                                  }
                                },
                              );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                            color: textColor,
                            fontSize: screenWidth * 0.036,
                            fontFamily: "Gilroy-Medium",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignUpView.id);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: const Color(0xff8D070F),
                              fontSize: screenWidth * 0.04,
                              decoration: TextDecoration.underline,
                              fontFamily: "Gilroy-Medium",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
