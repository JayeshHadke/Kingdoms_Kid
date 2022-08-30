import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class MainPageTail extends StatelessWidget {
  int index;
  MainPageTail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
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
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextButton(
        onPressed: () {
          getTailMethods(context, index);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.01),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return subColor;
              }
            },
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(getTailImage(index)),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              getTailText(index),
              style: TextStyle(
                  fontFamily: 'Dosis',
                  color: mainTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * 0.022),
            ),
          ],
        ),
      ),
    );
  }
}
