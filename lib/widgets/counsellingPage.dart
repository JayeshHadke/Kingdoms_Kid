import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class CounsellingPage extends StatefulWidget {
  const CounsellingPage({Key? key}) : super(key: key);

  @override
  State<CounsellingPage> createState() => _CounsellingPageState();
}

class _CounsellingPageState extends State<CounsellingPage> {
  String itemChoiced = CounsellingTypes[0];
  String name = "", email = "", phoneNo = "";
  @override
  Widget build(BuildContext context) {
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
              'Counselling',
              style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.04),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.01,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: 'Dosis',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.01,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.02),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            phoneNo = value;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          label: Text(
                            "Phone No.",
                            style: TextStyle(
                                fontFamily: 'Dosis',
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.01,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: DropdownButton(
                        items: CounsellingTypes.map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontFamily: 'Dosis',
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(
                            () {
                              itemChoiced = value.toString();
                            },
                          );
                        },
                        value: itemChoiced,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (name.isEmpty || phoneNo.isEmpty || email.isEmpty) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Invalid Inputs'),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return subColor;
                                    }
                                    return Colors.white;
                                  },
                                ),
                              ),
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text(
                                'OK',
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Congratulations!!!'),
                          content: Text(
                              'Thank You $name.\nWe will get back you soon.'),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return subColor;
                                    }
                                    return Colors.white;
                                  },
                                ),
                              ),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text('Cancel',
                                  style: TextStyle(color: mainColor)),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return subColor;
                                    }
                                    return Colors.white;
                                  },
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return subColor;
                        }
                        return mainColor;
                      },
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
