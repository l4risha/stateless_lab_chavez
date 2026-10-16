import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// Student = blueprint sa data. Final ang fields, mao nga const ang constructor
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded list (5+). Ilisi ang names sa imong mga classmate o kaugalingon
const List<Student> students = [
  Student(name: 'Juan Dela Cruz', course: 'BSIT', yearLevel: 3, email: 'juan@csucc.edu.ph'),
  Student(name: 'Maria Santos', course: 'BSIT', yearLevel: 2, email: 'maria@csucc.edu.ph'),
  Student(name: 'Pedro Reyes', course: 'BSCS', yearLevel: 1, email: 'pedro@csucc.edu.ph'),
  Student(name: 'Ana Lopez', course: 'BSIT', yearLevel: 4, email: 'ana@csucc.edu.ph'),
  Student(name: 'Carlo Mendoza', course: 'BSCE', yearLevel: 2, email: 'carlo@csucc.edu.ph'),
];