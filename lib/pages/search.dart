import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:smart_select/smart_select.dart';
import 'package:travelfy/models/search.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:fdottedline/fdottedline.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key key, this.title}) : super(key: key);

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
    Widget closeIcon = SvgPicture.asset("images/icon-close.svg",
        semanticsLabel: 'calendarIcon ');
    String value = 'flutter';

    // List<S2Choice<String>> options = [
    //   S2Choice<String>(value: 'ion', title: 'Ionic'),
    //   S2Choice<String>(value: 'flu', title: 'Flutter'),
    //   S2Choice<String>(value: 'rea', title: 'React Native'),
    // ];
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
            InkWell(
                onTap: () async {
                  DateTime newDateTime = await showRoundedDatePicker(
                    context: context,
                    theme: ThemeData(primarySwatch: Colors.blue),
                  );
                },
                child: Stack(
                  children: [
                    Positioned(
                        top: 15,
                        left: 20,
                        child: Container(
                          height: 20,
                          color: Colors.white,
                          child: Text("When?",
                              style: TextStyle(backgroundColor: Colors.white)),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Row(children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 350.0,
                            minWidth: 270.0,
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
                                      color: Color.fromRGBO(0, 0, 0, 0.12)))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 15, bottom: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
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
                )),
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
            Column(
              children: [
                // list of countries
                Row(
                  children: [
                    startIcon,
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 320.0,
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
                                                  onChanged: (_) {},
                                                  value: "Select a country",
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
                                                // SmartSelect<String>.single(
                                                //     title: '',
                                                //     value: value,
                                                //     placeholder: "Select a country",
                                                //     choiceItems: options,
                                                //     onChange: (state) =>
                                                //         search.setDestination(
                                                //             state.value))
                                              ])))
                                ]))))
                  ],
                ),
                Stack(children: [
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
                                    maxWidth: 320.0,
                                    minWidth: 250.0,
                                  ),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                      border: Border(
                                          top: BorderSide(
                                              width: 1.0,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.12)),
                                          left: BorderSide(
                                              width: 1.0,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.12)),
                                          right: BorderSide(
                                              width: 1.0,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.12)),
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.12)))),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 1,
                                          top: 0,
                                          bottom: 0),
                                      child: Row(children: [
                                        Expanded(
                                            child: Consumer<SearchModel>(
                                                builder: (context, search,
                                                    child) =>
                                                    Stack(children: [
                                                      new DropdownButton<
                                                          String>(
                                                        items: countriesOptions,
                                                        isExpanded: true,
                                                        onChanged: (_) {},
                                                        value:
                                                        "Select a country",
                                                        elevation: 16,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                0.74)),
                                                        underline: Container(
                                                          height: 2,
                                                          color: Colors.white,
                                                        ),
                                                        icon: null,
                                                      ),
                                                      // SmartSelect<String>.single(
                                                      //     title: '',
                                                      //     value: value,
                                                      //     placeholder: "Select a country",
                                                      //     choiceItems: options,
                                                      //     onChange: (state) =>
                                                      //         search.setDestination(
                                                      //             state.value))
                                                    ])))
                                      ]))))
                        ],
                      )),
                ]),
                SearchFooterButtons(),
                // end list of countries
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchDateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("123");
  }
}

class SearchInputInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("123");
  }
}

class SearchFooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40, top: 20, bottom: 27, right:17),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(right: 10, bottom: 10), child:


              FlatButton(
                onPressed: () {},
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
              ),
              ),

              FlatButton(
                onPressed: () {},
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
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  height: 40,
                  onPressed: () {},
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
                ),
              )

            ],
          )

        ]));
  }
}
