import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';
import 'appointment_details_screen.dart';
import 'medication_details_screen.dart'; // Import the new screen

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              ProfileSection(context: context),
              SizedBox(height: 20.h),
              Text(
                'Last Recorded Medical Condition',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: appBarColor),
              ),
              SizedBox(height: 20.h),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  InfoCard(
                      context: context,
                      icon: Icons.favorite,
                      label: 'Heart Rate',
                      value: '72 bpm'),
                  InfoCard(
                      context: context,
                      icon: Icons.monitor_heart,
                      label: 'Blood Pressure',
                      value: '120/80 mmHg'),
                  InfoCard(
                      context: context,
                      icon: Icons.water_drop,
                      label: 'Sugar Level',
                      value: '90 mg/dL'),
                  InfoCard(
                      context: context,
                      icon: Icons.thermostat,
                      label: 'Temperature',
                      value: '98.6°F'),
                ],
              ),
              SizedBox(height: 20.h),
              InfoSection(
                title: 'Upcoming Appointments',
                icon: Icons.calendar_today,
                mainText: 'Dr. Smith',
                subText: '12 Dec 2023, 10:00 AM',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentDetailsScreen(
                        doctorName: 'Dr. Smith',
                        appointmentDate: '12 Dec 2023',
                        appointmentTime: '10:00 AM',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              InfoSection(
                title: 'Current Medications',
                icon: Icons.medical_services,
                mainText: 'Metformin',
                subText: '500mg, Twice a day',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MedicationDetailsScreen(
                        medicationName: 'Metformin',
                        dosage: '500mg',
                        frequency: 'Twice a day',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage:
              const AssetImage('assets/images/profile.jpg'), // Example image
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe', // Example name
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'ID: 123456', // Example ID
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Age: 30', // Example age
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.context,
    required this.icon,
    required this.label,
    required this.value,
  });

  final BuildContext context;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: elevation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.sp, color: accentColor),
          SizedBox(height: 10.h),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String mainText;
  final String subText;
  final VoidCallback onTap;

  const InfoSection({
    super.key,
    required this.title,
    required this.icon,
    required this.mainText,
    required this.subText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: appBarColor),
        ),
        SizedBox(height: 10.h),
        Card(
          color: whiteColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: ListTile(
            leading: Icon(icon, color: appBarColor),
            title: Text(mainText, style: Theme.of(context).textTheme.bodyLarge),
            subtitle:
                Text(subText, style: Theme.of(context).textTheme.bodySmall),
            trailing: const Icon(Icons.arrow_forward_ios, color: appBarColor),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
