import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:kingdoms_kids/widgets/pdfViewerPage.dart';

class CurriculumPage extends StatefulWidget {
  const CurriculumPage({Key? key}) : super(key: key);

  @override
  State<CurriculumPage> createState() => _CurriculumPageState();
}

class _CurriculumPageState extends State<CurriculumPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.delayed(Duration.zero);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            title: Text(
              'Resources',
              style: TextStyle(
                  fontFamily: 'Dosis',
                  fontSize: MediaQuery.of(context).size.height * 0.035),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                get3yearsCurriculumCount() >0 ? Container(
                 child: Column(
                   children: [
                     SizedBox(
                       height: MediaQuery.of(context).size.height * 0.02,
                   ),
                     //3 Years
                     Container(
                       decoration: BoxDecoration(
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
                           BoxShadow(
                             color: Colors.black26,
                             blurRadius: 1,
                             offset: Offset(0, -1),
                           ),
                           BoxShadow(
                             color: Colors.white,
                             blurRadius: 2,
                             offset: Offset(0, -1),
                           ),
                         ],
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(
                             MediaQuery.of(context).size.height * 0.003),
                       ),
                       height: MediaQuery.of(context).size.height * 0.48,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: MediaQuery.of(context).size.height * 0.01,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               SizedBox(
                                 width: MediaQuery.of(context).size.width * 0.05,
                               ),
                               Text(
                                 "3 Year's Curriculum",
                                 style: TextStyle(
                                     color: mainTextColor,
                                     fontFamily: 'Dosis',
                                     fontSize:
                                     MediaQuery.of(context).size.height * 0.03,
                                     fontWeight: FontWeight.w600),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: MediaQuery.of(context).size.height * 0.01,
                           ),
                           Container(
                             decoration: BoxDecoration(
                               boxShadow: const [
                                 BoxShadow(
                                   color: Colors.black26,
                                   blurRadius: 1,
                                   offset: Offset(0, -1),
                                 ),
                                 BoxShadow(
                                   color: Colors.white,
                                   blurRadius: 2,
                                   offset: Offset(0, -1),
                                 ),
                               ],
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(
                                   MediaQuery.of(context).size.height * 0.003),
                             ),
                             // if get3yearsCurriculumCount() == 0 then make height 0

                             height: get3yearsCurriculumCount() == 0
                                 ? 0
                                 : MediaQuery.of(context).size.height * 0.4,
                             // height: MediaQuery.of(context).size.height * 0.4,
                             child: ListView.builder(
                               scrollDirection: Axis.vertical,
                               itemCount: get3yearsCurriculumCount(),
                               itemBuilder: (context, index) {
                                 return Container(
                                   padding: EdgeInsets.symmetric(
                                       horizontal:
                                       MediaQuery.of(context).size.width * 0.03),
                                   width: MediaQuery.of(context).size.width * 0.5,
                                   height: MediaQuery.of(context).size.height * 0.08,
                                   margin: EdgeInsets.symmetric(
                                     vertical:
                                     MediaQuery.of(context).size.height * 0.008,
                                     horizontal:
                                     MediaQuery.of(context).size.width * 0.03,
                                   ),
                                   decoration: BoxDecoration(
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
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(
                                         MediaQuery.of(context).size.height * 0.003),
                                   ),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         get3yearsCurriculumName(index),
                                         style: TextStyle(
                                             fontFamily: 'Dosis',
                                             fontSize:
                                             MediaQuery.of(context).size.height *
                                                 0.025),
                                       ),
                                       IconButton(
                                         onPressed: () {
                                           Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                               builder: (context) {
                                                 return PDFViewerPage(
                                                     map: arr3YearsCurriculum,
                                                     index: index);
                                               },
                                             ),
                                           );
                                         },
                                         icon: Icon(
                                           Icons.open_in_browser_rounded,
                                           size: MediaQuery.of(context).size.height *
                                               0.03,
                                         ),
                                       ),
                                     ],
                                   ),
                                 );
                               },
                             ),
                           ),
                         ],
                       ),
                     ),],
                 ),
               ):Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                //Outdoor
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        offset: Offset(0, -1),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2,
                        offset: Offset(0, -1),
                      ),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.003),
                  ),
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Text(
                            // "Outdoor Curriculum",
                            "Teachers Guide and Seasonal Curriculum",
                            style: TextStyle(
                                color: mainTextColor,
                                fontFamily: 'Dosis',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 1,
                              offset: Offset(0, -1),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2,
                              offset: Offset(0, -1),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.003),
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: getOutdoorCurriculumCount(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.08,
                              margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.008,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              decoration: BoxDecoration(
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.003),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getOutdoorCurriculumName(index),
                                    style: TextStyle(
                                        fontFamily: 'Dosis',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.025),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PDFViewerPage(
                                              map: arrOutdoorCurriculum,
                                              index: index,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.open_in_browser_rounded,
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                getSeasonalCurriculumCount() > 0
                    ?
                Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  //Seasonal
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(0, -1),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          offset: Offset(0, -1),
                        ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.003),
                    ),
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(
                              // "Seasonal Curriculum",
                              "Students Workbook",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontFamily: 'Dosis',
                                  fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1,
                                offset: Offset(0, -1),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 2,
                                offset: Offset(0, -1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.003),
                          ),
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: getSeasonalCurriculumCount(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height * 0.08,
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                  MediaQuery.of(context).size.height * 0.008,
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                                ),
                                decoration: BoxDecoration(
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height * 0.003),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getSeasonalCurriculumName(index),
                                      style: TextStyle(
                                          fontFamily: 'Dosis',
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return PDFViewerPage(
                                                map: arrSeasonalCurriculum,
                                                index: index,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.open_in_browser_rounded,
                                        size: MediaQuery.of(context).size.height *
                                            0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],): Container(),

                getVBSCurriculumCount() > 0
                    ? Column(children: [ SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                  //VBS
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(0, -1),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          offset: Offset(0, -1),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.003),
                    ),
                    height: MediaQuery.of(context).size.height * 0.48,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(
                              "Vacation Bible School (VBS)",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontFamily: 'Dosis',
                                  fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1,
                                offset: Offset(0, -1),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 2,
                                offset: Offset(0, -1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.003),
                          ),
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: getVBSCurriculumCount(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height * 0.08,
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                  MediaQuery.of(context).size.height * 0.008,
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                                ),
                                decoration: BoxDecoration(
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height * 0.003),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getVBSCurriculumName(index),
                                      style: TextStyle(
                                          fontFamily: 'Dosis',
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return PDFViewerPage(
                                                map: arrVBSCurriculum,
                                                index: index,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.open_in_browser_rounded,
                                        size: MediaQuery.of(context).size.height *
                                            0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),],): Container(),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
