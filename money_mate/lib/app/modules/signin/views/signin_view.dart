import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_mate/app/widget/authfield.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
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
                  'Signin to your account',
                  style: TypographyApp.text1,
                ),
                Gap.h48,
                AuthTextField(),
                Gap.h12,
                AuthTextField(),
                Gap.h12,
                Container(
                  width: double.infinity,
                  height: SizeApp.h40,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorApp.darkGreen,
                  ),

                  // child: ,
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
                      ]),
                ),
                Gap.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signup');
                      },
                      child: Text(
                        'Sign up',
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
