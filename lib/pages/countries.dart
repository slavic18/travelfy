import 'package:flutter/material.dart';
import 'package:travelfy/Widgets/custom_appBar.dart';
import 'package:travelfy/Widgets/custom_infoCard.dart';
import 'package:travelfy/Widgets/i_can_travel_by.dart';
import 'package:travelfy/Widgets/travelInfo.dart';
import 'package:travelfy/data/data.dart';
import 'package:provider/provider.dart';
import 'package:travelfy/models/search.dart';
import 'package:travelfy/models/country.dart';
import 'package:travelfy/Widgets/footer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBarWithoutEdit(),
        ),
        bottomNavigationBar: Footer(),
        body: Consumer<SearchModel>(builder: (context, search, child) {
          return FutureBuilder<List<CountryData>>(
              future: search.getSearchResultByOrigin(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchInput(type: "initial", country: search.getFrom(), index: 0,),
                      Expanded(
                        child: new ListView.builder(
                            itemCount: snapshot.data.length,

                            itemBuilder: (BuildContext ctxt, int index) {
                              return infoCard(
                                countryData: snapshot.data[index],
                                regulationList: regulationGermany,
                              );


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


class SearchInput extends StatelessWidget {
  SearchInput({Key key, this.type, this.index, this.country}) : super(key: key);

  final String type;
  final int index;
  final String country;

  @override
  Widget build(BuildContext context) {

    List countriesOptions = [
      'Select a country',
      'Luxembourg',
      'Germany',
      'France',
      'Belgium',
      'Italy'
    ].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();

    String selectedCountry = country == "" ? "Select a country" : country;
    return Column(children: [
      Row(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, right: 10, top:20, bottom: 20),
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 320.0,
                    minWidth: 250.0,
                  ),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border(
                          top: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(0, 0, 0, 0.12)),
                          left: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(0, 0, 0, 0.12)),
                          right: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(0, 0, 0, 0.12)),
                          bottom: BorderSide(
                              width: 1.0,
                              color: Color.fromRGBO(0, 0, 0, 0.12)))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 1, top: 0, bottom: 0),
                      child: Row(children: [
                        Expanded(
                            child: Consumer<SearchModel>(
                                builder: (context, search, child) =>
                                    Stack(children: [
                                      new DropdownButton<String>(
                                        items: countriesOptions,
                                        isExpanded: true,
                                        onChanged: (state) {
                                          search.setCountry(state, index);
                                        },
                                        value: selectedCountry,
                                        elevation: 16,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.74)),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        icon: null,
                                      ),
                                    ])))
                      ]))))
        ],
      )
    ]);
  }
}

