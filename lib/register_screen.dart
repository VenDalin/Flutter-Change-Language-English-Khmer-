import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/dashboard_screen.dart';
import 'package:homework/login_screen.dart';

import 'theme_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _fullNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    void _register() {
  if (_formKey.currentState!.validate()) {
    Get.snackbar("Success".tr, "Registration successful!".tr);
    // Navigate to Dashboard screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()), // Assuming you have a DashboardScreen widget
    );
  }
}


    void _switchLanguage() {
      if (Get.locale == Locale('en', 'US')) {
        Get.updateLocale(Locale('km', 'KH'));
      } else {
        Get.updateLocale(Locale('en', 'US'));
      }
    }

    return Obx(() {

      bool isDarkMode = themeController.isDarkMode.value;

      return Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,  // Toggle background color
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : const Color.fromARGB(255, 147, 125, 227),  // Change AppBar color based on theme
          title: GestureDetector(
            onTap: () {
                    // Navigate to LoginScreen when "Login" is tapped
                    Get.to(() => LoginScreen());  // Navigate to LoginScreen
                  },
            child: Text(
              'Login'.tr,  // Translated title
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),  // Adjust title text color based on theme
            ),
          ),
          
          actions: [
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Colors.white,  // Change icon color based on theme
              ),
              onPressed: () => themeController.toggleTheme(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Image.asset(
                  Get.locale == Locale('en', 'US')
                      ? 'assets/flags/us.png'  // English flag
                      : 'assets/flags/km.png', // Khmer flag
                  width: 30.0,
                  height: 30.0,
                ),
                onPressed: _switchLanguage,  // Switch language on press
              ),
            ),
          ],
        ),
        
        body: Padding(   
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isDarkMode ? 'assets/flags/km.png' : 'assets/flags/km.png',  // Choose logo based on dark mode
                    height: 150,  // Adjust the size as needed
                  ),
                  SizedBox(height: 40),
                      TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: "FullName".tr,  // Translated label for Full Name
                        prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 147, 125, 227)),
                        filled: false,
                        fillColor: isDarkMode ? Colors.grey[700] : const Color.fromARGB(255, 231, 230, 230),  // Change field background color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white : const Color.fromARGB(255, 231, 230, 230),   // Change border color based on theme
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "pleaseEnterFullName".tr;  // Translation for empty Full Name
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                  // Email Text Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "email".tr,  // Translated label
                      prefixIcon: Icon(Icons.email, color: const Color.fromARGB(255, 147, 125, 227)),
                      
                      filled: false,
                      fillColor: isDarkMode ? Colors.black : const Color.fromARGB(255, 231, 230, 230),  // Change field background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide(
                            color: isDarkMode ? Colors.white : const Color.fromARGB(255, 231, 230, 230),   // Change border color based on theme
                          ),
              
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "pleaseEnterEmail".tr;
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "invalidEmail".tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
              
                  // Password Text Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "password".tr,  // Translated label
                      prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 147, 125, 227)),
                      filled: false,
                      fillColor: isDarkMode ? Colors.grey[700] : const Color.fromARGB(255, 147, 125, 227),  // Change field background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide(
                            color: isDarkMode ? Colors.white : const Color.fromARGB(255, 231, 230, 230),   // Change border color based on theme
                          ),
              
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "pleaseEnterPassword".tr;
                      } else if (value.length < 6) {
                        return "passwordLength".tr;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
              
                  // Register Button
                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 147, 125, 227),  // Orange button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                    ),
                    child: Text(
                      'register'.tr,  // Translated button text
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
