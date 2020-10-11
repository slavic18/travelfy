import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:travelfy/models/search.dart';
import 'package:travelfy/pages/searchResult.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:fdottedline/fdottedline.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Widget destinationIcon = SvgPicture.asset("images/destination.svg",
        semanticsLabel: 'destinationIcon ');

    Widget startIcon =
        SvgPicture.asset("images/start.svg", semanticsLabel: 'calendarIcon ');
    Widget closeIcon = SvgPicture.asset("images/icon-close.svg",
        semanticsLabel: 'calendarIcon ');

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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search",
                        style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: 20,
                            fontFamily: "roboto",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1)),
                    InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: closeIcon,
                      ),
                    )
                  ],
                )),

            // date row
            Row(
              children: [
                new SearchDateInput(
                    label: "From", type: SearchDateInput.TYPE_FROM),
                Spacer(flex: 1),
                new SearchDateInput(
                    label: "Until", type: SearchDateInput.TYPE_TO),
              ],
            ),

            // finish date block
            Padding(
              padding: EdgeInsets.only(top: 44, bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("Where",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontSize: 20,
                        fontFamily: "roboto",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1)),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: Text("I don't know",
                      style: TextStyle(
                          color: Color.fromRGBO(98, 29, 238, 1),
                          fontSize: 12,
                          fontFamily: "roboto",
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.1)),
                )
              ]),
            ),
            // list of countries
            Consumer<SearchModel>(builder: (context, search, child) {
              List<SearchItem> items = search.getItems();
              return Expanded(
                  child: new ListView.builder(
                      itemCount: search.getItems().length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctxt, int index) {
                        SearchItem item = items[index];
                        return new SearchInput(
                            index: index,
                            country: item.country,
                            type: item.type);
                      }));
            }),
            // end list of countries

            Column(
              children: [
                SearchFooterButtons(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchDateInput extends StatelessWidget {
  static String TYPE_FROM = 'from';
  static String TYPE_TO = 'to';

  SearchDateInput({Key key, this.label, this.type}) : super(key: key);

  final String type;
  final String label;

  @override
  Widget build(BuildContext context) {
    Widget calendarIcon = SvgPicture.asset("images/calendar.svg",
        semanticsLabel: 'calendarIcon ');

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Consumer<SearchModel>(
        builder: (context, search, child) => InkWell(
            onTap: () async {
              DateTime newDateTime = await showRoundedDatePicker(
                  context: context,
                  theme: ThemeData(primarySwatch: Colors.blue),
                  initialDate: search.getDate(type),
                  onTapDay: (DateTime dateTime, bool available) {
                    if (!available) {}
                    search.setDate(dateTime, type);

                    return available;
                  });
            },
            child: Stack(
              children: [
                Positioned(
                    top: 15,
                    left: 20,
                    child: Container(
                      height: 20,
                      color: Colors.white,
                      child: Text(label,
                          style: TextStyle(backgroundColor: Colors.white)),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 170.0,
                        minWidth: 170.0,
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
                            left: 16, right: 16, top: 15, bottom: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateTime(
                                          search.getDate(type).year,
                                          search.getDate(type).month,
                                          search.getDate(type).day) ==
                                      today
                                  ? "Today"
                                  : DateFormat('yyyy/MM/dd')
                                      .format(search.getDate(type)),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "roboto",
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                            calendarIcon
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            )));
  }
}

class SearchInput extends StatelessWidget {
  SearchInput({Key key, this.type, this.index, this.country}) : super(key: key);

  final String type;
  final int index;
  final String country;

  @override
  Widget build(BuildContext context) {
    Widget destinationIcon = SvgPicture.asset("images/destination.svg",
        semanticsLabel: 'destinationIcon ');
    Widget destinationBlackIcon = SvgPicture.asset("images/destination.svg",
        color: Colors.black, semanticsLabel: 'destinationIcon ');

    Widget startIcon =
        SvgPicture.asset("images/start.svg", semanticsLabel: 'calendarIcon ');

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
      type == "initial"
          ? Row(
              children: [
                startIcon,
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 300.0,
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
          : SizedBox.shrink(),
      type == "stop"
          ? Stack(children: [
              Positioned(
                  top: 0,
                  left: 10,
                  child: FDottedLine(
                    color: Colors.black,
                    height: 25.0,
                    strokeWidth: 1.0,
                    dottedLength: 1.0,
                    space: 4.0,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      destinationBlackIcon,
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 290.0,
                                minWidth: 250.0,
                              ),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.12)))),
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
                                                      search.setCountry(
                                                          state, index);
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
                                  ])))),
                      new DeleteSearchItemButton(index: this.index),
                    ],
                  )),
            ])
          : SizedBox.shrink(),
      type == "transit"
          ? Stack(children: [
              Positioned(
                  top: 0,
                  left: 10,
                  child: FDottedLine(
                    color: Colors.black,
                    height: 25.0,
                    strokeWidth: 1.0,
                    dottedLength: 1.0,
                    space: 4.0,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      destinationBlackIcon,
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 290.0,
                                minWidth: 250.0,
                              ),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.12)))),
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
                                                      search.setCountry(
                                                          state, index);
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
                                  ])))),
                      new DeleteSearchItemButton(index: this.index),
                    ],
                  )),
            ])
          : SizedBox.shrink(),
      type == "destination"
          ? Stack(children: [
              Positioned(
                  top: 0,
                  left: 10,
                  child: FDottedLine(
                    color: Colors.black,
                    height: 25.0,
                    strokeWidth: 1.0,
                    dottedLength: 1.0,
                    space: 4.0,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      destinationIcon,
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.0,
                                minWidth: 250.0,
                              ),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
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
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.12)))),
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
                                                      search.setCountry(
                                                          state, this.index);
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
                  )),
            ])
          : SizedBox.shrink(),
    ]);
  }
}

class DeleteSearchItemButton extends StatelessWidget {
  DeleteSearchItemButton({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Widget closeIcon = SvgPicture.asset("images/icon-close.svg",
        semanticsLabel: 'calendarIcon ');
    return Consumer<SearchModel>(
        builder: (context, search, child) => InkWell(
            onTap: () {
              search.deleteItem(index);
            },
            child: Container(
              child: closeIcon,
            )));
  }
}

class SearchFooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40, top: 20, bottom: 27, right: 17),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: Consumer<SearchModel>(builder: (context, search, child) {
                  return FlatButton(
                    onPressed: () {
                      search.addStop(new SearchItem("", "stop"));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black26,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Add Stop",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 14.0),
                    ),
                  );
                }),
              ),
              Consumer<SearchModel>(builder: (context, search, child) {
                return FlatButton(
                  onPressed: () {
                    search.addStop(new SearchItem("", "transit"));
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black26,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Add Transit",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 14.0),
                  ),
                  color: Colors.transparent,
                );
              }),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<SearchModel>(builder: (context, search, child) {
                  return FlatButton(
                    height: 40,
                    onPressed: () {
                      List<String> errors = search.getErrors();
                      if (errors.length != 0) {
                        final snackBar = SnackBar(
                          content: Text(errors[0]),
                          duration: Duration(seconds: 1),
                        );

                        // Find the Scaffold in the widget tree and use
                        // it to show a SnackBar.
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else {
                        // no errors found during validation
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => searchResult(),
                          ),
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black26,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      "LETZ GO",
                      style: TextStyle(
                          fontFamily: "roboto",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14.0),
                    ),
                    color: Color.fromRGBO(98, 0, 238, 1),
                    focusColor: Color.fromRGBO(98, 0, 238, 1),
                  );
                }),
              )
            ],
          )
        ]));
  }
}
