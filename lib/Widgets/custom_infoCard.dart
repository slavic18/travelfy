import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelfy/models/country.dart';
import 'package:travelfy/models/regulations_model.dart';

import '../assets.dart';

class infoCard extends StatelessWidget {
  final List<Regulations> regulationList;
  final CountryData countryData;

  const infoCard({Key key, this.regulationList, this.countryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Regulations> regulations = [];
    if (countryData.covidTest == true) {
      regulations.add(Regulations(
        name: 'Sintel',
        imageUrl: Assets.allDocs,
        color: Colors.blue,
      ));
    }

    if (countryData.socialDistance == true) {
      regulations.add(Regulations(
        name: 'Sintel',
        imageUrl: Assets.allDocs,
        color: Colors.blue,
      ));
    }
    if (countryData.mask == "LIMITED") {
      regulations.add(Regulations(
        imageUrl: Assets.mask,
        color: Colors.blue,
      ));

    } if (countryData.socialDistance == true) {
      regulations.add(Regulations(
        imageUrl: Assets.crowded,
        color: Colors.blue,
      ));

    }

    return Container(
      margin: EdgeInsets.all(13.0),
      child: Material(
        type: MaterialType.card,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Last Updated",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "10/10/2020",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        countryData.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        children: [
                          countryData.transitAllowed == true
                              ? Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(219, 169, 1, 0.3),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12, 6, 12, 6),
                              child: Text(
                                "Transit Open",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : SizedBox.shrink(),
                          countryData.status == "RED"
                              ? Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 11, 11, 0.3),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(12, 6, 12, 6),
                              child: Text(
                                "Border closed",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : SizedBox.shrink(),

                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: regulations.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Regulations regulation = regulations[index];
                            return GestureDetector(
                              onTap: () => print(regulation.name),
                              child: Container(
                                width: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(regulation.imageUrl),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "I want more details",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(98, 29, 238, 1),
                    ),
                  ),
                ],
              ),
              countryData.status == "GREEN" ?
                   Image.asset("images/good.png", width: 40,) :countryData.status == "YELLOW" ? Image.asset("images/warning.png", width: 40) : Image.asset("images/dangerous.png", width: 40),
            ],
          ),
        ),
      ),
      width: double.infinity,
      height: 192.0,
    );
  }
}
