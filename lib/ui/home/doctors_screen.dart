import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/doctor_model.dart';
import '../../utils/theme_data.dart';
import 'book_appointments_screen.dart';

class DoctorsScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Smith',
      specialty: 'Cardiologist',
      availableTimeSlots: [
        TimeSlot(start: '10:00 AM', end: '12:00 PM'),
        TimeSlot(start: '2:00 PM', end: '4:00 PM'),
      ],
      workHours: '9:00 AM - 5:00 PM',
      workDays: ['Monday', 'Wednesday', 'Friday'],
      officeNumber: '123-456-7890',
    ),
    Doctor(
      name: 'Dr. Jane Doe',
      specialty: 'Dermatologist',
      availableTimeSlots: [
        TimeSlot(start: '11:00 AM', end: '1:00 PM'),
        TimeSlot(start: '3:00 PM', end: '5:00 PM'),
      ],
      workHours: '10:00 AM - 6:00 PM',
      workDays: ['Tuesday', 'Thursday'],
      officeNumber: '098-765-4321',
    ),
    Doctor(
      name: 'Dr. Alice Johnson',
      specialty: 'Pediatrician',
      availableTimeSlots: [
        TimeSlot(start: '9:00 AM', end: '11:00 AM'),
        TimeSlot(start: '1:00 PM', end: '3:00 PM'),
      ],
      workHours: '8:00 AM - 4:00 PM',
      workDays: ['Monday', 'Wednesday', 'Friday'],
      officeNumber: '555-123-4567',
    ),
    Doctor(
      name: 'Dr. Michael Brown',
      specialty: 'Neurologist',
      availableTimeSlots: [
        TimeSlot(start: '8:00 AM', end: '10:00 AM'),
        TimeSlot(start: '12:00 PM', end: '2:00 PM'),
      ],
      workHours: '7:00 AM - 3:00 PM',
      workDays: ['Monday', 'Tuesday', 'Wednesday'],
      officeNumber: '222-333-4444',
    ),
    Doctor(
      name: 'Dr. Emily Clark',
      specialty: 'Ophthalmologist',
      availableTimeSlots: [
        TimeSlot(start: '10:00 AM', end: '12:00 PM'),
        TimeSlot(start: '2:00 PM', end: '4:00 PM'),
      ],
      workHours: '9:00 AM - 5:00 PM',
      workDays: ['Thursday', 'Friday'],
      officeNumber: '555-666-7777',
    ),
    Doctor(
      name: 'Dr. Richard Lee',
      specialty: 'Orthopedic',
      availableTimeSlots: [
        TimeSlot(start: '1:00 PM', end: '3:00 PM'),
        TimeSlot(start: '4:00 PM', end: '6:00 PM'),
      ],
      workHours: '12:00 PM - 8:00 PM',
      workDays: ['Tuesday', 'Thursday', 'Saturday'],
      officeNumber: '888-999-0000',
    ),
    Doctor(
      name: 'Dr. Olivia Martinez',
      specialty: 'Dentist',
      availableTimeSlots: [
        TimeSlot(start: '9:00 AM', end: '11:00 AM'),
        TimeSlot(start: '1:00 PM', end: '3:00 PM'),
      ],
      workHours: '8:00 AM - 4:00 PM',
      workDays: ['Wednesday', 'Friday'],
      officeNumber: '123-321-4567',
    ),
    Doctor(
      name: 'Dr. William Davis',
      specialty: 'Dermatologist',
      availableTimeSlots: [
        TimeSlot(start: '10:00 AM', end: '12:00 PM'),
        TimeSlot(start: '2:00 PM', end: '4:00 PM'),
      ],
      workHours: '9:00 AM - 5:00 PM',
      workDays: ['Monday', 'Thursday'],
      officeNumber: '987-654-3210',
    ),
    Doctor(
      name: 'Dr. Sophia Wilson',
      specialty: 'Gynecologist',
      availableTimeSlots: [
        TimeSlot(start: '11:00 AM', end: '1:00 PM'),
        TimeSlot(start: '3:00 PM', end: '5:00 PM'),
      ],
      workHours: '10:00 AM - 6:00 PM',
      workDays: ['Tuesday', 'Thursday', 'Saturday'],
      officeNumber: '111-222-3333',
    ),
    Doctor(
      name: 'Dr. Benjamin Anderson',
      specialty: 'Endocrinologist',
      availableTimeSlots: [
        TimeSlot(start: '8:00 AM', end: '10:00 AM'),
        TimeSlot(start: '12:00 PM', end: '2:00 PM'),
      ],
      workHours: '7:00 AM - 3:00 PM',
      workDays: ['Monday', 'Wednesday', 'Friday'],
      officeNumber: '444-555-6666',
    ),
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
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
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
                  Text(
                    doctor.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    doctor.specialty,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Work Hours:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    doctor.workHours,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Work Days:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  WorkDaysCircles(workDays: doctor.workDays), // Use the new widget
                  SizedBox(height: 8.h),
                  Text(
                    'Office Number:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        doctor.officeNumber,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        icon: Icon(Icons.phone, color: accentColor),
                        onPressed: () => _makePhoneCall(doctor.officeNumber),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Available Time Slots:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    children: doctor.availableTimeSlots.map((timeSlot) {
                      return Chip(
                        label: Text('${timeSlot.start} - ${timeSlot.end}'),
                        backgroundColor: accentColor,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: whiteColor),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAppointmentScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: Text(
                      'Book Appointment',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: whiteColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}

class WorkDaysCircles extends StatelessWidget {
  final List<String> workDays;

  const WorkDaysCircles({Key? key, required this.workDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> allDays = [
      'M', 'T', 'W', 'T', 'F', 'S', 'S'
    ]; // Monday to Sunday
    const List<String> fullDays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];

    return Row(
      children: allDays.asMap().entries.map((entry) {
        int idx = entry.key;
        String shortDay = entry.value;
        bool isWorking = workDays.contains(fullDays[idx]);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: CircleAvatar(
            radius: 14.r,
            backgroundColor: isWorking ? accentColor : Colors.grey,
            child: Text(
              shortDay,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: whiteColor),
            ),
          ),
        );
      }).toList(),
    );
  }
}
