import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

String videoId = YoutubePlayer.convertUrlToId('https://youtu.be/oAQKBPsQPME')!;

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  bool loaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        forceHD: false,
        autoPlay: true,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _controller.toggleFullScreenMode();
    final val = ModalRoute.of(context)!.settings.arguments as passedArguments;
    int lanIndex = val.index;
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Scaffold(
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
              body: OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return Stack(
                      children: [
                        // landing Video
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          // height: loaded ? MediaQuery.of(context).size.height * 0.26 : 0,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: youtube(),
                        ),
                        Positioned(
                          // top: loaded ? MediaQuery.of(context).size.height * 0.28 : 0,
                          top: MediaQuery.of(context).size.height * 0.28,
                          left: 0,
                          right: 0,
                          // height: loaded
                          //     ? MediaQuery.of(context).size.height * 0.58
                          //     : MediaQuery.of(context).size.height * 0.98,
                          height: MediaQuery.of(context).size.height * 0.58,
                          child: ListView.builder(
                            itemCount:
                                songsPlayerListByLanguage(lanIndex).length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
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
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  height: 100,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Image.network(
                                        YoutubePlayer.getThumbnail(
                                          videoId: songsPlayerListByLanguage(
                                                  lanIndex)
                                              .values
                                              .toList()[index],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                songsPlayerListByLanguage(
                                                        lanIndex)
                                                    .keys
                                                    .toList()[index],
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontFamily: 'Dosis',
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // _controller.reload();
                                  setState(
                                    () {
                                      if (!loaded) {
                                        const SnackBar snackBar = SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text(
                                              'Player is Loading...Please Wait...'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        videoId =
                                            songsPlayerListByLanguage(lanIndex)
                                                .values
                                                .toList()[index];

                                        _controller.load(videoId);
                                        _controller.play();
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          } else {
            // return Container(
            //   alignment: Alignment.center,
            //   child: FittedBox(
            //     fit: BoxFit.cover,
            //     child: youtube(),
            //   ),
            // );
            _controller.toggleFullScreenMode();
            return const SizedBox();
          }
        },
      ),
    );
  }

  youtube() {
    return YoutubePlayer(
      controller: _controller,
      onReady: () {
        setState(
          () {
            loaded = true;
          },
        );
      },
      showVideoProgressIndicator: true,
      progressIndicatorColor: mainColor,
      progressColors: ProgressBarColors(
        playedColor: mainColor,
        handleColor: subColor,
      ),
    );
  }
}
