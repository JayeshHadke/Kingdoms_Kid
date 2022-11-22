import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/dimensions.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class BookSlotPage extends StatefulWidget {
  const BookSlotPage({Key? key}) : super(key: key);

  @override
  State<BookSlotPage> createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.9),
            children: List.generate(
              bookSlotList.length,
              (index) => Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 8, right: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: subColor.withAlpha(150),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Wrap(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: double.maxFinite,
                        ),
                        Image(
                          height: MediaQuery.of(context).size.height * 0.2,
                          image: AssetImage(slotImages[index]),
                        ),
                        Text(
                          bookSlotList[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Dosis',
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
