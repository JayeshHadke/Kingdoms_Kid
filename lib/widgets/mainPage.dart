import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/widgets/customSliders.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'mainPageTail.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
              "AG KidZ",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.green,
                  fontFamily: 'Dosis'),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.5,
                        alignment: Alignment.topRight,
                        fit: BoxFit.scaleDown,
                        image: AssetImage(
                          'assets/images/background.png',
                        ),
                      ),
                    ),
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
                                    left: MediaQuery.of(context).size.width *
                                        0.08),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          'assets/images/Kingdom Kids.gif'),
                                      backgroundColor: Colors.black12,
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(
                                      "Welcome Children",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Dosis',
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06),
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          'And Sunday School Teachers',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Dosis',
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.55,
                              //   child: const Image(
                              //     image:
                              //         AssetImage('assets/images/background.png'),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.0.h,
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
