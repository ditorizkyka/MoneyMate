import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_mate/app/widget/authfield.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Hello Momates!',
                  style: TypographyApp.headline1,
                ),
                Gap.h8,
                Text(
                  'Signup to your account',
                  style: TypographyApp.text1,
                ),
                Gap.h48,
                AuthTextField(),
                Gap.h12,
                AuthTextField(),
                Gap.h12,
                AuthTextField(),
                Gap.h12,
                AuthTextField(),
                Gap.h12,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(SizeApp.h12),
                    backgroundColor: ColorApp.darkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.offAllNamed('/dashboard');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.),
                      Gap.w12,
                      Text('Sign Up', style: TypographyApp.text2)
                    ],
                  ),
                ),
                Gap.h12,
                Text(
                  'Or',
                ),
                Gap.h12,
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.),
                      Gap.w12,
                      Text('Sign in with Facebook')
                    ],
                  ),
                ),
                Gap.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signin');
                      },
                      child: Text(
                        'Sign In',
                        style: TypographyApp.text1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
