import 'package:flutter/material.dart';
import 'package:kingdoms_kids/widgets/landingPage.dart';
import 'package:kingdoms_kids/widgets/musicPlayer.dart';
import 'package:kingdoms_kids/widgets/videoPlayer.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          'musicPlayer': (context) => MusicPlayer(),
          'videoPlayer': (context) => VideoPlayer(),
        },
        home: MyApp(),
      ),
    );

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
