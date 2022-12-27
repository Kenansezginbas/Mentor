import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentor/firebase_options.dart';
import 'package:mentor/themes/custom_colors.dart';
import 'package:mentor/view/add_question.dart';
import 'package:mentor/view/auth/sign_in_view.dart';
import 'package:mentor/view/auth/sign_up_view.dart';
import 'package:mentor/view/controller/tab_bar_controller.dart';
import 'package:mentor/view/home_view.dart';
import 'package:mentor/view/menu_view.dart';
import 'package:mentor/view/question_answer_view.dart';

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
        scaffoldBackgroundColor: ColorManager.darkColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.darkColor,
        ),
      ),
      routes: {
        "/signIn": (context) => const SignInView(),
        "/signUp": (context) => const SignUpView(),
        "/tabBarController": (context) => const TabBarController(),
        "/homeView": (context) => const HomeView(),
        "/menuView": (context) => const MenuView(),
        "/questionAnswerView": (context) => const QuestionAnswerView(),
        "/addQuestion": (context) => const AddQuestion()
      },
      home: const TabBarController(),
    );
  }
}
