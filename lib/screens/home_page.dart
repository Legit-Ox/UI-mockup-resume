import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resume/responsive/responsive_layout.dart';
import 'package:resume/widgets/Desktop_Body.dart';
import 'package:resume/widgets/Mobile_Body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      desktopBody: DesktopBody(),
      mobileBody: MobileBody(),
    );
  }
}
