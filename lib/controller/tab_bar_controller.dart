import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/view/home_view.dart';
import 'package:mentor/view/menu_view.dart';
import 'package:mentor/view/question_answer_view.dart';
import 'package:mentor/widgets/buttons/custom_fab_button.dart';
import 'package:mentor/widgets/rows/logo_widget.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeView(),
          QuestionAnswerView(),
          MenuView(),
        ],
      ),
      floatingActionButton: _currentIndex == 1
          ? CustomFabButton(
              onPressed: () {},
            )
          : null,
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  BottomNavigationBar customBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          _pageController.jumpToPage(value);
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: CustomColors.darkColor,
      selectedItemColor: CustomColors.yellowColor,
      unselectedItemColor: CustomColors.whiteColor,
      items: [
        customBottomNavigationBarItem(CupertinoIcons.house, "Anasayfa"),
        customBottomNavigationBarItem(
            CupertinoIcons.question_square, "Soru - Cevap"),
        customBottomNavigationBarItem(Icons.more_horiz, "Menü"),
      ],
    );
  }

  BottomNavigationBarItem customBottomNavigationBarItem(
          IconData icondata, String label) =>
      BottomNavigationBarItem(icon: Icon(icondata), label: label);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
}
