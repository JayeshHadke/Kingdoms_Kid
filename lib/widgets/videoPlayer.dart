import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'EColTNIbOko',
  );
  @override
  Widget build(BuildContext context) {
    final val = ModalRoute.of(context)!.settings.arguments as passedArguments;
    int lanIndex = val.index;
    print(_controller.initialVideoId);
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
        body: Stack(
          children: [
            // landing Video
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.26,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: mainColor,
                progressColors: ProgressBarColors(
                  playedColor: mainColor,
                  handleColor: subColor,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.28,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.55,
              child: ListView.builder(
                itemCount: songsPlayerListByLanguage(lanIndex).length,
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
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Image.network(
                            YoutubePlayer.getThumbnail(
                              videoId: songsPlayerListByLanguage(lanIndex)
                                  .values
                                  .toList()[index],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    songsPlayerListByLanguage(lanIndex)
                                        .keys
                                        .toList()[index],
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: 'Dosis',
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
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
                      setState(
                        () {
                          _controller.load(
                            songsPlayerListByLanguage(lanIndex)
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
          ],
        ),
      ),
    );
  }
}
