import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/widgets/logo.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                'Forgot Password',
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
              // Submit button
              ElevatedButton(
                onPressed: () {
                  // Implement password reset functionality
                },
                child: SizedBox(
                  width: 200.w,
                  child: const Center(
                    child: Text(
                      'Reset Password',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Back to login link
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the login screen
                },
                child: const Text(
                  'Back to Login',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
