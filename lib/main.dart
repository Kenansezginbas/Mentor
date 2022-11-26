import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.darkColor,
      ),
      home: HomeView(),
    );
  }
}
