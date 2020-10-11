import 'package:flutter/material.dart';
import 'package:travelfy/pages/countries.dart';
import 'package:travelfy/pages/search.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
          height: 65,
          color: Color.fromRGBO(98, 0, 238, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => countries(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 5),
                          child: Icon(
                            Icons.add_location_rounded,
                            color: Colors.white,
                            size: 24.0,
                          )),
                      Text(
                        "Countries",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "roboto"),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 5),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 24.0,
                          )),
                      Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "roboto"),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => countries(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 5),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 24.0,
                          )),
                      Text(
                        "Notifications",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "roboto"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
