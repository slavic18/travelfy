import 'package:flutter/material.dart';

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
            Image(
              image: AssetImage('images/AIRPLAIN.png'),
            ),
            Image(
              image: AssetImage('images/TRAIN.png'),
            ),
            Image(
              image: AssetImage('images/CAR.png'),
            ),
            Image(
              image: AssetImage('images/MOTO.png'),
            ),
            Image(
              image: AssetImage('images/BIKE.png'),
            ),
          ],
        ),
      ],
    );
  }
}
