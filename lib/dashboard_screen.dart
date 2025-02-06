import 'package:flutter/material.dart';
import 'package:homework/register_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Dashboard'),
            SizedBox(height: 20),
           ElevatedButton(
  onPressed: () {
    // Clear the text fields
    _emailController.clear();
    _passwordController.clear();

    // Optionally, log the user out or navigate away from the current screen
     Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()), // Navigate to LoginScreen
                );
  },
  child: Text('Logout'),
),

          ],
        ),
      ),
    );
  }
}