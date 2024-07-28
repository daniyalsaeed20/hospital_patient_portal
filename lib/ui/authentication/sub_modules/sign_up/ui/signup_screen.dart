import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/widgets/logo.dart';
import '../../../../home/home_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(
                  size: 150.r,
                ),
                SizedBox(height: 40.h),
                Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 20.h),
                // Name field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Email field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                // Contact field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.h),
                // Password field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                // Sign Up button
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
                        'Sign Up',
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
                  child:  Text(
                    'Back to Authentication',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
