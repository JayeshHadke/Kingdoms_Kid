import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
            centerTitle: true,
            backgroundColor: mainColor,
            title: Text(
              'Store',
              style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
          ),
          body: ListView.builder(
            itemCount: arrStore.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.01,
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
                  // color: Colors.white,
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.01),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                  leading: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.network(
                      arrStore[index].imgPath,
                    ),
                  ),
                  title: Text(
                    arrStore[index].name,
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return subColor;
                              }
                              return Colors.white;
                            },
                          ),
                        ),
                        onPressed: () {
                          FlutterClipboard.copy(arrStore[index].phoneNo).then(
                            (value) {
                              Fluttertoast.showToast(
                                  msg: "Phone No. Copied!", // message
                                  toastLength: Toast.LENGTH_SHORT, // length
                                  gravity: ToastGravity.BOTTOM, // location
                                  timeInSecForIosWeb: 1 // duration
                                  );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.add_ic_call_rounded,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return subColor;
                              }
                              return Colors.white;
                            },
                          ),
                        ),
                        onPressed: () {
                          FlutterClipboard.copy(arrStore[index].address).then(
                            (value) {
                              Fluttertoast.showToast(
                                  msg: "Address Copied!", // message
                                  toastLength: Toast.LENGTH_SHORT, // length
                                  gravity: ToastGravity.BOTTOM, // location
                                  timeInSecForIosWeb: 1 // duration
                                  );
                            },
                          );
                        },
                        child: Icon(
                          Icons.map_rounded,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
