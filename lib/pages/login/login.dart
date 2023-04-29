import 'package:flutter/material.dart';

import '../student/student_home.dart';
import '../instructor/instructor_home.dart';
import '../admin/admin_home.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Log in as student'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentHome()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Log in as an instructor'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InstructorHome()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Log in as an admin'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminHome()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}