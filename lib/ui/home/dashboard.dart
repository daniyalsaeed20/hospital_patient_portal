import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        color: backGroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Medical Condition',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: appBarColor),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                children: [
                  _buildInfoCard(
                    context,
                    icon: Icons.favorite,
                    label: 'Heart Rate',
                    value: '72 bpm',
                  ),
                  _buildInfoCard(
                    context,
                    icon: Icons.monitor_heart,
                    label: 'Blood Pressure',
                    value: '120/80 mmHg',
                  ),
                  _buildInfoCard(
                    context,
                    icon: Icons.water_drop,
                    label: 'Sugar Level',
                    value: '90 mg/dL',
                  ),
                  _buildInfoCard(
                    context,
                    icon: Icons.thermostat,
                    label: 'Temperature',
                    value: '98.6°F',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    return Card(color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.sp, color: accentColor,),
            SizedBox(height: 16.h),
            Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: appBarColor),
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
