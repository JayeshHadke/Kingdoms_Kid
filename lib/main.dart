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
  late bool logged;

  _MyAppState() {
    check().then((value) {
      setState(() {
        logged = value;
        print('-------------------------------$logged---------------------');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return logged ? const LandingPage() : const MainPage();
  }
}

Future<bool> check() async {
  final p = await SharedPreferences.getInstance();
  if (p.containsKey('logged')) {
    return true;
  } else {
    await p.setInt('logged', 1);
    return false;
  }
}
