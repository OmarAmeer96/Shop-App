import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/consts.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import '../helpers/show_error_snack_bar.dart';
import '../helpers/validation_helper.dart';
import '../widgets/custom_email_text_field.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/custom_password_text_field.dart';
import '../helpers/show_success_snack_bar.dart';
import 'sign_in_view.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  static String id = "SignUpScreen";
  late String? email;
  late String? password;
  late String? rePassword;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          _isLoading = true;
        } else if (state is SignupSuccess) {
          _isLoading = false;
          Navigator.pop(context);
          showSuccessSnackBar(context, state.successMessage);
          Navigator.pushNamed(context, SignInView.id);
        } else if (state is SignupFailure) {
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
                    "Sign Up",
                    style: TextStyle(
                      color: textColor,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gilroy-Medium",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Enter your emails and password",
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
                  SizedBox(height: screenHeight * 0.015),
                  CustomPasswordTextField(
                    controller: _rePasswordController,
                    text: "RE-PASSWORD",
                    onChanged: (data) {
                      rePassword = data;
                    },
                    validator: (value) {
                      return validateRePassword(value!, _passwordController);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "By continuing you agree to our ",
                                style: TextStyle(
                                  color: color1,
                                  fontSize: screenWidth * 0.036,
                                  fontFamily: "Gilroy-Regular",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                ),
                              ),
                              Text(
                                "Terms of Service",
                                style: TextStyle(
                                  color: const Color(0xff8D070F),
                                  fontSize: screenWidth * 0.036,
                                  fontFamily: "Gilroy-Medium",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "and ",
                                style: TextStyle(
                                  color: color1,
                                  fontSize: screenWidth * 0.036,
                                  fontFamily: "Gilroy-Regular",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                ),
                              ),
                              Text(
                                "Privacy Policy.",
                                style: TextStyle(
                                  color: const Color(0xff8D070F),
                                  fontSize: screenWidth * 0.036,
                                  fontFamily: "Gilroy-Medium",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff8d0000),
                                ),
                              )
                            : CustomMainButton(
                                text: "Sign Up",
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    BlocProvider.of<SignupCubit>(context)
                                        .signUpUser(
                                      email: email!,
                                      password: password!,
                                    );
                                  }
                                },
                              );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: textColor,
                            fontSize: screenWidth * 0.036,
                            fontFamily: "Gilroy-Medium",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignInView.id);
                          },
                          child: Text(
                            "Sign In",
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
