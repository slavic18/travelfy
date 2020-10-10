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
                color: Color.fromRGBO(112, 112, 112, 1),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Image(
              image: AssetImage('images/AIRPLAIN.png'),
            ),
          ],
        ),
      ],
    );
  }
}
