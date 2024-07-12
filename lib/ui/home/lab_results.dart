import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';

class LabResults extends StatelessWidget {
  const LabResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              radius,
            ),
            topRight: Radius.circular(
              radius,
            ),
          ),
          color: backGroundColor),
      child: const Center(child: Text('Lab Results')),
    );
  }
}