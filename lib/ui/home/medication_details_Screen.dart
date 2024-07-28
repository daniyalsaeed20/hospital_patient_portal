import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';

class MedicationDetailsScreen extends StatelessWidget {
  final String medicationName;
  final String dosage;
  final String frequency;
  final String additionalInfo;

  const MedicationDetailsScreen({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    this.additionalInfo = 'Take with food to avoid stomach upset.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medication Details',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: whiteColor),
        ),
        backgroundColor: appBarColor,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              elevation: elevation,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionContent(context: context, title: 'Medication:', content: medicationName, icon: Icons.medical_services),
                    const Divider(),
                    SectionContent(context: context, title: 'Dosage:', content: dosage, icon: Icons.local_hospital),
                    const Divider(),
                    SectionContent(context: context, title: 'Frequency:', content: frequency, icon: Icons.schedule),
                    if (additionalInfo.isNotEmpty) ...[
                      const Divider(),
                      SectionContent(context: context, title: 'Additional Information:', content: additionalInfo, icon: Icons.info_outline),
                    ],
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.edit, color: whiteColor),
          label: Text(
            'Edit Medication',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: whiteColor),
          ),
          onPressed: () {
            // Edit medication logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        OutlinedButton.icon(
          icon: const Icon(Icons.cancel, color: appBarColor),
          label: Text(
            'Stop Medication',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: appBarColor),
          ),
          onPressed: () {
            // Stop medication logic
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            side: const BorderSide(color: appBarColor),
          ),
        ),
      ],
    );
  }
}

class SectionContent extends StatelessWidget {
  const SectionContent({
    super.key,
    required this.context,
    required this.title,
    required this.content,
    required this.icon,
  });

  final BuildContext context;
  final String title;
  final String content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(icon, color: appBarColor, size: 24.sp),
          SizedBox(width: 8.w),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, color: appBarColor),
              ),
              SizedBox(height: 4.h),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
