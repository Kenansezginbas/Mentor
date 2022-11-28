import 'package:flutter/material.dart';
import 'package:mentor/widgets/containers/menu_container.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuContainer(),
    );
  }
}
