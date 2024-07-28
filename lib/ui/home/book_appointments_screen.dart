// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/doctor_model.dart';
import '../../utils/theme_data.dart';

class BookAppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? selectedDay;
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              widget.doctor.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              'Specialty:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              widget.doctor.specialty,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16.h),
            Text(
              'Select Day:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8.h),
            DropdownButton<String>(
              dropdownColor: whiteColor,
              hint: const Text('Select a day'),
              value: selectedDay,
              items: widget.doctor.workDays.map((day) {
                return DropdownMenuItem(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                  selectedTimeSlot = null; // Reset time slot when day changes
                });
              },
            ),
            if (selectedDay != null) ...[
              SizedBox(height: 16.h),
              Text(
                'Select Time Slot:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 8.w,
                children: widget.doctor.availableTimeSlots.map((timeSlot) {
                  return ChoiceChip(
                    label: Text('${timeSlot.start} - ${timeSlot.end}'),
                    selected: selectedTimeSlot == '${timeSlot.start} - ${timeSlot.end}',
                    onSelected: (selected) {
                      setState(() {
                        selectedTimeSlot = selected ? '${timeSlot.start} - ${timeSlot.end}' : null;
                      });
                    },
                    backgroundColor: whiteColor,
                    selectedColor: accentColor,
                    labelStyle: TextStyle(
                      color: selectedTimeSlot == '${timeSlot.start} - ${timeSlot.end}' ? whiteColor : blackColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                      side: const BorderSide(color: accentColor),
                    ),
                  );
                }).toList(),
              ),
            ],
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: selectedDay != null && selectedTimeSlot != null
                  ? () {
                      // Handle appointment booking logic
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
                disabledBackgroundColor: Colors.grey,
              ),
              child: Text(
                'Confirm Appointment',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
