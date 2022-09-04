import 'package:flutter/material.dart';
import 'package:kingdoms_kids/widgets/landingPage.dart';
import 'package:kingdoms_kids/widgets/mainPage.dart';
import 'package:kingdoms_kids/widgets/musicPlayer.dart';
import 'package:kingdoms_kids/widgets/videoPlayer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          'musicPlayer': (context) => MusicPlayer(),
          'videoPlayer': (context) => VideoPlayer(),
        },
        home: const MyApp(),
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
    // return check().then((value) {
    //   return value;
    // })
    //     ? const LandingPage()
    //     : const MainPage();
    return LandingPage();
  }
}

Future<Widget> check() async {
  final p = await SharedPreferences.getInstance();
  if (p.getInt('logged') == null || p.getInt('logged') == 0) {
    await p.setInt('logged', 1);
    return const LandingPage();
  } else {
    return const MainPage();
  }
}
