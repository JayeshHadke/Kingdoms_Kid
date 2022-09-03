import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:kingdoms_kids/widgets/musicPlayer.dart';

class ChoiceLanguageForSongs extends StatefulWidget {
  const ChoiceLanguageForSongs({Key? key}) : super(key: key);
  @override
  State<ChoiceLanguageForSongs> createState() => _ChoiceLanguageForSongs();
}

class _ChoiceLanguageForSongs extends State<ChoiceLanguageForSongs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: subColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.maxFinite,
          ),
          Text(
            'Choose Language!',
            style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  //English
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(0);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[0],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[0],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Telugu
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(2);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[2],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[2],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Kannada
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(4);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[4],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[4],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  //Tamil
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(1);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[1],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[1],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Hindi
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(3);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[3],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[3],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  //Marathi
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white24;
                        },
                      ),
                    ),
                    onPressed: () {
                      callNextPage(5);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          LanguageImage[5],
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          LanguageTypes[5],
                          style: TextStyle(
                              fontFamily: 'Dosis',
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  callNextPage(int index) {
    selectedLanguage = index;
    Navigator.popAndPushNamed(
      context,
      'videoPlayer',
      arguments: passedArguments(index: index),
    );
  }
}
