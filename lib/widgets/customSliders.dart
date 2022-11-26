import 'package:flutter/material.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  PageController pageController = PageController(viewportFraction: 0.92);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getSliderHeadingCount(),
      itemBuilder: (context, index) {
        return _buildPageItems(index);
      },
    );
  }

  Widget _buildPageItems(int index) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(-1, 0),
              blurRadius: 4,
            ),
            // BoxShadow(
            //   color: Colors.white,
            //   offset: Offset(0, -4),
            //   blurRadius: 4,
            // ),
          ],
          color: mainColor,
          borderRadius:
          BorderRadius.circular(MediaQuery
              .of(context)
              .size
              .width * 0.08)),
      margin: EdgeInsets.only(
        bottom: MediaQuery
            .of(context)
            .size
            .width * 0.035,
        top: MediaQuery
            .of(context)
            .size
            .width * 0.01,
        right: MediaQuery
            .of(context)
            .size
            .width * 0.02,
        left: MediaQuery
            .of(context)
            .size
            .width * 0.02,
      ),
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .height * 0.01,
          bottom: MediaQuery
              .of(context)
              .size
              .height * 0.01,
          left: MediaQuery
              .of(context)
              .size
              .width * 0.05,
          right: MediaQuery
              .of(context)
              .size
              .width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.01,
          ),
          Text(
            getSliderHeading(index),
            style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height * 0.034),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  getSliderBody(index),
                  style: TextStyle(
                      fontFamily: 'Dosis',
                      color: Colors.white,
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02),
                ),
              ),
              Center(
                child: Flexible(
                  child: Image(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.2,
                    image: AssetImage(getSliderImages(index)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
