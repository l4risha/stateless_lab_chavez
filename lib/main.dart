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

// Stateless kay ang icon ug text kay gikan sa parent, wala'y mausab sa sulod
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6), // gamay nga gap tali sa icon ug text
        Expanded(child: Text(text)), // Expanded para dili mo-overflow ang taas nga email
      ],
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold, // bold nga heading
              color: Theme.of(context).colorScheme.primary, // colored heading
            ),
          ),
          const Divider(), // linya sa ubos
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
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(child: Text(student.name[0])), // first letter sa name
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(student.course),
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
      appBar: AppBar(title: const Text('Campus Directory')),
      body: ListView(
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
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const DirectoryScreen(),
    );
  }
}