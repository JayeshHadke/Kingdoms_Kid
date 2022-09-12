import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/widgets/landingPage.dart';
import 'package:kingdoms_kids/widgets/musicPlayer.dart';
import 'package:kingdoms_kids/widgets/videoPlayer.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        'musicPlayer': (context) => MusicPlayer(),
        'videoPlayer': (context) => VideoPlayer(),
      },
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}
