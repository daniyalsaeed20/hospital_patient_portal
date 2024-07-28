class TimeSlot {
  final String start;
  final String end;

  TimeSlot({required this.start, required this.end});
}

class Doctor {
  final String name;
  final String specialty;
  final List<TimeSlot> availableTimeSlots;
  final String workHours;
  final List<String> workDays;
  final String officeNumber;

  Doctor({
    required this.name,
    required this.specialty,
    required this.availableTimeSlots,
    required this.workHours,
    required this.workDays,
    required this.officeNumber,
  });
}
