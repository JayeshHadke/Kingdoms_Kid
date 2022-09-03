import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class MusicPlayerWidget extends StatefulWidget {
  late Map<String, String> arr;
  late AudioPlayer audioPlayer;

  MusicPlayerWidget({Key? key, required this.audioPlayer, required this.arr})
      : super(key: key);

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState(arr: arr);
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  Map<String, String> arr;
  final List<IconData> _icons = [
    Icons.play_arrow_rounded,
    Icons.pause_rounded,
  ];
  Duration _duration = Duration();
  Duration _position = Duration();
  var path;
  bool isLoop = false;
  bool isPlaying = false;
  _MusicPlayerWidgetState({
    required this.arr,
  }) {
    path = arr.values.toList()[currentMusic];
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.audioPlayer.onDurationChanged.listen(
      (event) {
        setState(
          () {
            _duration = event;
          },
        );
      },
    );
    widget.audioPlayer.onPositionChanged.listen(
      (event) {
        setState(
          () {
            _position = event;
          },
        );
      },
    );
    widget.audioPlayer.onPlayerComplete.listen(
      (event) {
        setState(
          () {
            nextMusicButton();
          },
        );
      },
    );
    widget.audioPlayer.setSourceUrl(arr.values.toList()[currentMusic]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          arr.keys.toList()[currentMusic],
          style: TextStyle(
              fontFamily: 'Dosis',
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height * 0.04),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_position.toString().split(".")[0].split(":")[1]}:${_position.toString().split(".")[0].split(":")[2]}",
            ),
            Text(
              "${_duration.toString().split(".")[0].split(":")[1]}:${_duration.toString().split(".")[0].split(":")[2]}",
            ),
          ],
        ),
        Slider(
          min: 0.0,
          max: _duration.inSeconds.toDouble() + 1,
          inactiveColor: Colors.grey,
          activeColor: mainColor,
          value: _position.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(
              () {
                if (!isPlaying) {
                  widget.audioPlayer
                      .play(UrlSource(arr.values.toList()[currentMusic]));
                  isPlaying = true;
                }
                widget.audioPlayer.seek(Duration(seconds: value.toInt()));
                value = value;
              },
            );
          },
        ),
        CustomAudioPlayer(),
      ],
    );
  }

  Widget CustomAudioPlayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Loop Button
        IconButton(
          onPressed: () {
            if (isLoop) {
              widget.audioPlayer.setReleaseMode(ReleaseMode.release);
              setState(
                () {
                  isLoop = false;
                },
              );
            } else if (!isLoop) {
              widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
              setState(
                () {
                  isLoop = true;
                },
              );
            }
          },
          icon: isLoop
              ? Icon(
                  Icons.loop_rounded,
                  color: subColor,
                )
              : const Icon(
                  Icons.loop_rounded,
                  color: Colors.black,
                ),
        ),

        //Previous Song Button
        IconButton(
          onPressed: () {
            setState(
              () {
                if (currentMusic > 0) currentMusic--;
                _position = Duration.zero;
                widget.audioPlayer
                    .setSourceUrl(arr.values.toList()[currentMusic]);
                if (isPlaying) {
                  widget.audioPlayer
                      .play(UrlSource(arr.values.toList()[currentMusic]));
                }
              },
            );
          },
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        //Play Pause Button
        IconButton(
          icon: isPlaying
              ? Icon(
                  _icons[1],
                  color: subColor,
                )
              : Icon(_icons[0]),
          onPressed: () {
            PlayPauseButton();
          },
        ),
        //Next Button
        IconButton(
          onPressed: () {
            nextMusicButton();
          },
          icon: const Icon(Icons.skip_next_rounded),
        ),
        //Shuffle
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shuffle_rounded),
        ),
      ],
    );
  }

  void PlayPauseButton() {
    if (isPlaying) {
      widget.audioPlayer.pause();
      setState(
        () {
          isPlaying = false;
        },
      );
    } else if (!isPlaying) {
      widget.audioPlayer.play(UrlSource(arr.values.toList()[currentMusic]));
      setState(
        () {
          isPlaying = true;
        },
      );
    }
  }

  void nextMusicButton() {
    setState(
      () {
        if (currentMusic < arr.values.toList().length - 1) currentMusic++;
        _position = Duration.zero;
        widget.audioPlayer.setSourceUrl(arr.values.toList()[currentMusic]);
        if (isPlaying) {
          widget.audioPlayer.play(UrlSource(arr.values.toList()[currentMusic]));
        }
      },
    );
  }
}
