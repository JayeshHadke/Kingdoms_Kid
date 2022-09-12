import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
              'About Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.035),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.14,
                backgroundImage: const AssetImage('assets/images/poster.png'),
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'ASSEMBLES OF GOD',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Dosis'),
              ),
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  "All India Assembly of God Children Ministry Department exists to guide  kids into Spirit-empowered, whole-life transformation through regional leaders entrusted to help parents and leaders model and mentor God's message to children.",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Dosis'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
