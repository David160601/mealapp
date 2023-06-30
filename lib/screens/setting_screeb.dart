import 'package:flutter/material.dart';
import 'package:mealapp/widgets/app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: "Setting"),
      body: Center(
        child: Text("setting screen"),
      ),
    ));
  }
}
