import 'package:flutter/material.dart';
import 'package:travelfy/models/regulations_model.dart';

import '../assets.dart';

class infoCard extends StatelessWidget {
  final List<Regulations> regulationList;

  const infoCard({Key key, this.regulationList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "France",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 169, 1, 0.3),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                          child: Text(
                            "Transit Open",
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: regulationList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Regulations regulation =
                                regulationList[index];
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
              Image.asset(Assets.crowded),
            ],
          ),
        ),
      ),
      width: double.infinity,
      height: 192.0,
    );
  }
}
