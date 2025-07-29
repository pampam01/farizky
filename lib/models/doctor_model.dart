// lib/models/doctor_model.dart
class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final String bio;

  const Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.bio,
  });
}