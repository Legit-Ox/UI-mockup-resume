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
  late Map<String, dynamic> myInfo = {};

  //Fetching content from the JSON file
  Future<void> fetchContent() async {
    final String response =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    myInfo = await json.decode(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ResponsiveLayout(
        desktopBody: DesktopBody(
          myInfo: myInfo,
        ),
        mobileBody: MobileBody(
          myInfo: myInfo,
        ),
      ),
    );
  }
}
