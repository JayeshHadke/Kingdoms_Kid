import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';

class BookSlotPage extends StatefulWidget {
  const BookSlotPage({Key? key}) : super(key: key);

  @override
  State<BookSlotPage> createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: mainColor,
          title: Text(
            'Book Slot',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.035),
          ),
        ),
        body: Center(
          child: Text(
            'No Events',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03),
          ),
        ),
      ),
    );
  }
}
