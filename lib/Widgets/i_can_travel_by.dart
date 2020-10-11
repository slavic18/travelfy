import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class iCanTravelBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 15.0, 0, 0),
          child: Text(
            "I can travel by",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('images/AIRPLAIN.svg'),
            SvgPicture.asset('images/TRAIN.svg'),
            SvgPicture.asset('images/CAR.svg'),
            SvgPicture.asset('images/MOTO.svg'),
            SvgPicture.asset('images/BIKE.svg'),
          ],
        ),
      ],
    );
  }
}
