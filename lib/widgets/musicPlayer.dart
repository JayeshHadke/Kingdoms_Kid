import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:kingdoms_kids/widgets/musicPlayerWidget.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final val = ModalRoute.of(context)!.settings.arguments as passedArguments;
    int lanIndex = val.index;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.delayed(Duration.zero);
      },
      child: SafeArea(
        child: Scaffold(
          /* AppBar for Music Player Layout Page */
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: mainColor,
            title: Text(
              'Music',
              style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
          ),
          /* Body of Music Player */
          body: Stack(
            children: [
              /* Music Player List with Images and Titles */
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.74,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: musicPlayerListByLanguage(lanIndex).length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.width * 0.01),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/music_temp.jpg',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  musicPlayerListByLanguage(lanIndex)
                                      .keys
                                      .toList()[index],
                                  style: TextStyle(
                                      fontFamily: 'Dosis',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                ),
                                Text(
                                  musicPlayerListByLanguage(lanIndex)
                                      .keys
                                      .toList()[index],
                                  style: TextStyle(
                                      fontFamily: 'Dosis',
                                      color: Colors.black45,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            currentMusic = index;
                            _audioPlayer.setSourceUrl(
                              musicPlayerListByLanguage(lanIndex)
                                  .values
                                  .toList()[index],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, -1),
                          blurRadius: 3,
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.height * 0.02),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: callMusicPlayer(lanIndex),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget callMusicPlayer(int lanIndex) {
    return MusicPlayerWidget(
      audioPlayer: _audioPlayer,
      arr: musicPlayerListByLanguage(lanIndex),
    );
  }
}
