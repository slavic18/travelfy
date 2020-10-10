import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelfy/pages/search.dart';
import 'package:travelfy/pages/searchResult.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    AssetImage logoAsset = AssetImage('images/logo.png');
    Image image = Image(image: logoAsset, width: 111, height: 36);

    Widget destinationIcon = SvgPicture.asset("images/destination.svg",
        semanticsLabel: 'destinationIcon ');
    Widget calendarIcon = SvgPicture.asset("images/calendar.svg",
        semanticsLabel: 'calendarIcon ');
    Widget startIcon =
        SvgPicture.asset("images/start.svg", semanticsLabel: 'calendarIcon ');

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 44, left: 24),
            child: image,
          ),
          Expanded(
            child: Container(
              child: Padding(
                  padding: EdgeInsets.only(top: 144, left: 24, right: 24),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start with your\nhealth in mind.',
                          style: TextStyle(
                              fontSize: 32,
                              letterSpacing: 2.07,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(43, 33, 62, 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Plan your trip.\nDo it safely',
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.67,
                                fontFamily: 'inter',
                                color: Color.fromRGBO(42, 37, 52, 1)),
                          ),
                        ),
                        //REMOVE LATER_______________________
                        InkWell(
                          child: Text("test"),
                          onTap: () => {
                            // routing to search page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => searchResult(),
                              ),
                            ),
                          },
                        ),
                        //REMOVE LATER_____________________________
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            height: 144,
            color: Color.fromRGBO(98, 29, 238, 0.08),
            child: InkWell(
              onTap: () => {
                // routing to search page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                ),
              },
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 12),
                      child: Row(
                        children: <Widget>[
                          calendarIcon,
                          Padding(
                              padding: EdgeInsets.only(left: 12.5, right: 11),
                              child: Text(
                                "On",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                              )),
                          Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "inter",
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(98, 29, 238, 1)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Row(
                        children: <Widget>[
                          startIcon,
                          Padding(
                              padding: EdgeInsets.only(left: 12.5, right: 11),
                              child: Text(
                                "From",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                              )),
                          Text(
                            "Luxembourg",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "inter",
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(98, 29, 238, 1)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Row(
                          children: <Widget>[
                            destinationIcon,
                            Padding(
                                padding: EdgeInsets.only(left: 12.5, right: 11),
                                child: Text(
                                  "To",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(112, 112, 112, 1)),
                                )),
                            Container(
                                width: 260,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border(
                                        top: BorderSide(
                                            width: 1.0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.12)),
                                        left: BorderSide(
                                            width: 1.0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.12)),
                                        right: BorderSide(
                                            width: 1.0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.12)),
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.12)))),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 15,
                                        bottom: 14),
                                    child: Text(
                                      "Destination",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "roboto",
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    )))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
