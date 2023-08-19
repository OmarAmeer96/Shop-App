import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../consts.dart';
import '../cubits/reset_cubit/reset_cubit.dart';
import '../helpers/show_error_snack_bar.dart';
import '../helpers/show_success_snack_bar.dart';
import '../helpers/validation_helper.dart';
import '../widgets/custom_email_text_field.dart';
import '../widgets/custom_main_button.dart';

// ignore: must_be_immutable
class ResetPasswordView extends StatelessWidget {
  static String id = "ResetPasswordScreen";
  final _form = GlobalKey<FormState>();
  late String? email;

  final _emailController = TextEditingController();

  bool _isLoading = false;

  ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<ResetCubit, ResetState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          _isLoading = true;
        } else if (state is ResetEmpty) {
          _isLoading = false;
          showSuccessSnackBar(context, state.emptyMessage);
        } else if (state is ResetSuccess) {
          _isLoading = false;
          showSuccessSnackBar(context, state.successMessage);
          Navigator.pop(context);
        } else if (state is ResetFailure) {
          _isLoading = false;
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: backColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(height: screenHeight * 0.13),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: textColor,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gilroy-Medium",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Enter your email",
                    style: TextStyle(
                      color: const Color(0xff7C7C7C),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Gilroy-Medium",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  CustomEmailTextField(
                    controller: _emailController,
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      return validateEmail(value!);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: BlocBuilder<ResetCubit, ResetState>(
                      builder: (context, state) {
                        return _isLoading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff8d0000),
                                ),
                              )
                            : CustomMainButton(
                                text: "Send Reset Email",
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    BlocProvider.of<ResetCubit>(context)
                                        .resetPassword(
                                      emailController: _emailController,
                                    );
                                  }
                                },
                              );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back to Sign In Screen?",
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
