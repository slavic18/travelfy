import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelfy/models/search.dart';
import 'package:travelfy/models/country.dart';
import 'package:travelfy/pages/notification.dart';

class TravelInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(
        builder: (context, search, child) => Container(
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
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('yyyy/MM/dd')
                              .format(search.getDate("from")),
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 14,
                              fontFamily: "Inter",
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
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    search.getFrom(),
                                    style: TextStyle(
                                        color: Color.fromRGBO(112, 112, 112, 1),
                                        fontSize: 14,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
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
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          search.getDestination(),
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: ListView.builder(
                            itemCount: search.getStops().length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(children: [
                                Text(
                                  "Passing by",
                                  style: TextStyle(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      fontSize: 12,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  search.getStops()[index],
                                  style: TextStyle(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      fontSize: 12,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.bold),
                                )
                              ]);
                            })),
                  ],
                ),
              ),
            ));
  }
}
