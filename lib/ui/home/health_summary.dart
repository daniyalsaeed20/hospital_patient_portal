import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_data.dart';

class HealthSummary extends StatelessWidget {
  const HealthSummary({super.key});

  final List<Map<String, String>> reports = const [
    {
      'date': '2024-07-01',
      'type': 'Blood Test',
      'summary': 'All values within normal range.',
    },
    {
      'date': '2024-06-15',
      'type': 'X-Ray',
      'summary': 'No fractures detected.',
    },
    {
      'date': '2024-05-20',
      'type': 'MRI Scan',
      'summary': 'No significant abnormalities found.',
    },
    {
      'date': '2024-04-10',
      'type': 'CT Scan',
      'summary': 'Normal results, no issues found.',
    },
  ];

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
              'Health Summary',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: appBarColor),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  return Card(
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    elevation: elevation,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${report['date']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Type: ${report['type']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Summary: ${report['summary']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
