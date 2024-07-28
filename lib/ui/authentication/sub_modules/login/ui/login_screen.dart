import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/utils/theme_data.dart';

import '../../../../../utils/widgets/logo.dart';
import '../../../../home/home_screen.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(
                size: 150.r,
              ),
              SizedBox(height: 40.h),
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 20.h),
              // Email field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              // Password field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.h),
              // Login button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen(),
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
              // Forgot password link
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ForgotPassword(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
