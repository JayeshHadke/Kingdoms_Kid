import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kingdoms_kids/widgets/customSliders.dart';

import 'mainPageTail.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(),
            centerTitle: true,
            title: Text(
              "Kingdom's Kids",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  color: Colors.black,
                  fontFamily: 'Dosis'),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: const AssetImage(
                                    'assets/images/poster.png'),
                                backgroundColor: Colors.black12,
                                radius:
                                    MediaQuery.of(context).size.width * 0.08,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                'Praise',
                                style: TextStyle(
                                    fontFamily: 'Dosis',
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08),
                              ),
                              Text(
                                'The God...',
                                style: TextStyle(
                                    fontFamily: 'Dosis',
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.09),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: const Image(
                            image: AssetImage('assets/images/background.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.maxFinite,
                    child: const CustomSlider(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainPageTail(index: 0),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 2),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 4),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 6),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MainPageTail(index: 1),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 3),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 5),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MainPageTail(index: 7),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainPageTail(index: 8),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
