import 'package:flutter/material.dart';
import 'package:todo/views/widgets/widget.dart';
import 'package:todo/views/widgets/color_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: barlowBold(text: "Home Screens", color: white, size: 18),
      ),
    );
  }
}
