import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/widgets/mainPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      Image.asset('assets/images/landing_poster.png'),
                      Text(
                        'WELCOME',
                        style: TextStyle(
                            fontFamily: 'Dosis',
                            fontSize: MediaQuery.of(context).size.width * 0.15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.03,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return subColor;
                                } else {
                                  return mainColor;
                                }
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MainPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "GET STARTED",
                            style: TextStyle(
                              fontFamily: 'Dosis',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Image.asset('assets/images/landing_poster.png'),
                      ),
                      Text(
                        'WELCOME',
                        style: TextStyle(
                            fontFamily: 'Dosis',
                            fontWeight: FontWeight.normal,
                            fontSize: MediaQuery.of(context).size.width * 0.07),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.03,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return subColor;
                                } else {
                                  return mainColor;
                                }
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MainPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "GET STARTED",
                            style: TextStyle(
                              fontFamily: 'Dosis',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
