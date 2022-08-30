import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    final val = ModalRoute.of(context)!.settings.arguments as passedArguments;
    int index = val.index;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text(
          'Songs',
          style: TextStyle(
              fontFamily: 'Dosis',
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.04),
        ),
      ),
    ));
  }
}
