import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/widgets/landingPage.dart';
import 'package:kingdoms_kids/widgets/musicPlayer.dart';
import 'package:kingdoms_kids/widgets/videoPlayer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        'musicPlayer': (context) => MusicPlayer(),
        'videoPlayer': (context) => VideoPlayer(),
      },
      home: const LandingPage(),
    );
  }
}
