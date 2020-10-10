import 'package:flutter/material.dart';
import 'package:travelfy/models/search.dart';
import 'package:provider/provider.dart';
import 'package:travelfy/models/country.dart';

class iCanTravelBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(builder: (context, search, child) {
      return FutureBuilder<List<CountryData>>(
          future: search.getSearchResult(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {


              print("_______");
              print(snapshot.data);
              print("_______");



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
            } else if (snapshot.hasError) return Text(snapshot.error);
            return Text("Await for data");
          });
    });
  }
}
