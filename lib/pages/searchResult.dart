import 'package:flutter/material.dart';
import 'package:travelfy/Widgets/custom_appBar.dart';
import 'package:travelfy/Widgets/i_can_travel_by.dart';
import 'package:travelfy/Widgets/travelInfo.dart';

class searchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 30.0),
        child: CustomAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TravelInfo(),
          iCanTravelBy(),
        ],
      ),
    );
  }
}
