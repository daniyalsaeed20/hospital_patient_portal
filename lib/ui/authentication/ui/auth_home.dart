import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/ui/authentication/sub_modules/login/ui/login_screen.dart';
import 'package:hospital_patient_portal/ui/authentication/sub_modules/sign_up/ui/signup_screen.dart';

import '../../../utils/widgets/logo.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(
            size: 150.r,
          ),
          SizedBox(height: 40.h),
          Text(
            'Patient Portal',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 100.h,
            child: const Row(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              );
            },
            child: SizedBox(
              width: 200.w,
              child: const Center(
                child: Text(
                  'Login',
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Sign up button
          ElevatedButton(
            onPressed: () {Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SignUp(),
                ),
              ); },
            child: SizedBox(
              width: 200.w,
              child: const Center(
                child: Text(
                  'Sign Up',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
