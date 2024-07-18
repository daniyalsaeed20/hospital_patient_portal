import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdfx/pdfx.dart';

import '../../utils/theme_data.dart';
import 'pdf_view.dart';

class LabResults extends StatelessWidget {
  LabResults({super.key});

  final List<Map<String, String>> labResults = const [
    {
      'date': '2024-07-10',
      'type': 'Complete Blood Count',
      'result': 'All values within normal range.',
    },
    {
      'date': '2024-07-08',
      'type': 'Lipid Panel',
      'result': 'Cholesterol levels are slightly elevated.',
    },
    {
      'date': '2024-07-05',
      'type': 'Blood Sugar',
      'result': 'Normal glucose levels.',
    },
    {
      'date': '2024-07-01',
      'type': 'Thyroid Function Test',
      'result': 'Thyroid function normal.',
    },
  ];

  final PdfControllerPinch pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('assets/sample.pdf'),
  );

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
              'Lab Results',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: appBarColor),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: labResults.length,
                itemBuilder: (context, index) {
                  final labResult = labResults[index];
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
                            'Date: ${labResult['date']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Type: ${labResult['type']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Result: ${labResult['result']}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SimplePage(),
                      ),
                    );
                                },
                                child: const Text('View Report'),
                              ),
                            ],
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
