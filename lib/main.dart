import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// Colors (estimate gikan sa screenshot)
const kTeal = Color(0xFF0E8A8A); // AppBar, avatar, heading, icons
const kBackground = Color(0xFFF4F7F7); // background sa screen
const kNameText = Color(0xFF1F2933); // name sa student
const kSubText = Color(0xFF6B7280); // course, year, email

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
  Student(name: 'Juan Dela Cruz', course: 'BS Information Technology', yearLevel: 3, email: 'juan@csucc.edu.ph'),
  Student(name: 'Maria Santos', course: 'BS Information Technology', yearLevel: 2, email: 'maria@csucc.edu.ph'),
  Student(name: 'Pedro Reyes', course: 'BS Computer Science', yearLevel: 1, email: 'pedro@csucc.edu.ph'),
  Student(name: 'Ana Lopez', course: 'BS Information Systems', yearLevel: 4, email: 'ana@csucc.edu.ph'),
  Student(name: 'Carlo Mendoza', course: 'BS Computer Engineering', yearLevel: 2, email: 'carlo@csucc.edu.ph'),
];

// Stateless kay ang icon ug text kay gikan sa parent, wala'y mausab sa sulod
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: kTeal), // teal nga icon
          const SizedBox(width: 6), // gamay nga gap tali sa icon ug text
          Expanded(
            // Expanded para dili mo-overflow ang taas nga email
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: kSubText),
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless kay title lang ang ipakita, fixed ang itsura
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold, // bold nga heading
              color: kTeal, // colored heading
            ),
          ),
          const SizedBox(height: 4),
          const Divider(height: 1, color: kTeal), // linya sa ubos
        ],
      ),
    );
  }
}

// Stateless kay Student object ang gi-pasa, dili niya usbon ang data
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: kTeal,
              child: Text(
                student.name[0], // first letter sa name
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kNameText,
                    ),
                  ),
                  Text(
                    student.course,
                    style: const TextStyle(fontSize: 12, color: kSubText),
                  ),
                  InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless kay static ra ang screen, hard-coded ang list
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kTeal,
        foregroundColor: Colors.white,
        title: const Text(
          'Campus Directory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: [
          const SectionHeader(title: 'Students'),
          // spread (...) para ma-butang ang matag card sa sulod sa ListView
          ...students.map((s) => StudentCard(student: s)),
        ],
      ),
    );
  }
}

// Stateless kay ang theme ug home screen fixed ra
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: kTeal, useMaterial3: true),
      home: const DirectoryScreen(),
    );
  }
}