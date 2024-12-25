import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/helper/pref.dart';
import 'package:ai_assistant/screens/model/home_type.dart';
import 'package:ai_assistant/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showonBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            appName,
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: Icon(Icons.brightness_4_rounded),
              iconSize: 27,
            )
          ],
        ), //app bar
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.04, vertical: mq.height * 0.015),
          children: HomeType.values
              .map(
                (e) => HomeCard(
                  homeType: e,
                ),
              )
              .toList(),
        )).animate().fade(duration: 1.seconds);
  }
}
