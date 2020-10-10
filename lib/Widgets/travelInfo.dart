import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.0,
      color: Color.fromRGBO(98, 29, 238, 0.08),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 17.0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset("images/calendar.svg"),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "On",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "10 Oct",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("images/start.svg"),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "From",
                            style: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Luxembourg",
                            style: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        Text(
                          "Passing by",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "France",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset("images/destination.svg"),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "To",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Germany",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
