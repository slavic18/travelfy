import 'package:flutter/material.dart';
import 'package:travelfy/Widgets/custom_appBar.dart';
import 'package:travelfy/Widgets/custom_infoCard.dart';
import 'package:travelfy/Widgets/i_can_travel_by.dart';
import 'package:travelfy/Widgets/footer.dart';
import 'package:travelfy/Widgets/travelInfo.dart';
import 'package:travelfy/data/data.dart';
import 'package:travelfy/pages/countries.dart';
import 'package:provider/provider.dart';
import 'package:travelfy/models/search.dart';
import 'package:travelfy/models/country.dart';
import 'package:travelfy/pages/notification.dart';

class searchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 30.0),
          child: CustomAppBar(),
        ),
        bottomNavigationBar: Footer(),
        body: Consumer<SearchModel>(builder: (context, search, child) {
          return FutureBuilder<List<CountryData>>(
              future: search.getSearchResult(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TravelInfo(),


                      iCanTravelBy(),
                      Expanded(
                        child: new ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return infoCard(
                                countryData: snapshot.data[index],
                                regulationList: regulationGermany,
                              );

                              // SearchItem item = items[index];
                              // return new SearchInput(
                              // index: index,
                              // country: item.country,
                              // type: item.type);
                              // }));
                            }),
                      )
                    ],

                  );
                } else if (snapshot.hasError) return Text(snapshot.error);
                return Text("Await for data");
              });
        }));
  }
}
