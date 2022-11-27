import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentor/firebase_options.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/view/auth/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.darkColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.darkColor,
        ),
      ),
      home: const SignUpView(),
    );
  }
}
