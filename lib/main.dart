import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:homework/register_screen.dart';
import 'package:homework/theme_controller.dart';
import 'package:homework/translate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Register App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          supportedLocales: [
            Locale('en', 'US'), 
            Locale('km', 'KH'), 
          ],
          translations: TranslationsEnToKh(),
          localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,  
          GlobalWidgetsLocalizations.delegate,  
          GlobalCupertinoLocalizations.delegate, 
      ],
          home: RegisterScreen(),
        ));
  }
}
