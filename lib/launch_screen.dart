import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/ui/home/home_screen.dart';

import 'utils/widgets/logo.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1976D2), // Primary color
              Color(0xFF1976D2),
              Color(0xFF4CAF50), // Secondary color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300.h, // Adjusted for simplicity
              child: const Row(),
            ),
            Logo(size: 150.r,),
            SizedBox(
              height: 100.h, // Adjusted for simplicity
              child: const Row(),
            ),
            Text('Patient Portal',
                style: Theme.of(context).textTheme.headlineLarge),
            const Loader(),
          ],
        ),
      ),
    );
  }
}

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  bool checker = false;
  bool hasEnded = false;

  Timer? timer;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    if (timer != null) {
      timer!.cancel();
      timer = null;
    }

    timer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        checker = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Row(
        mainAxisAlignment:
            hasEnded ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            margin: EdgeInsets.only(bottom: 5.h),
            duration: const Duration(seconds: 1),
            height: 2.w,
            width: checker ? 140.w : 0.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5), // Background color
              borderRadius: BorderRadius.circular(
                90.r,
              ),
            ),
            onEnd: () {
              setState(() {
                hasEnded = true;
                checker = false;
              });
              if (timer != null) {
                timer!.cancel();
                timer = null;
              }
              timer = Timer(const Duration(seconds: 1), () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen(
                      ),
                    ),
                    (Route<dynamic> route) => false);
              });
            },
          ),
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Icon(
                    Icons
                        .local_hospital, // Changed to a hospital-related icon
                    color: const Color(0xFFF5F5F5), // Background color
                    size: animationController.value * 30,
                  );
                }),
          )
        ],
      ),
    );
  }
}
