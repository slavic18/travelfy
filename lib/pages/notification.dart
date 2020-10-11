import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, right: 15.0, bottom: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [

        Column(
                  children: [
            FloatingActionButton(
              elevation: 5,
              backgroundColor: Color.fromRGBO(98, 0, 238, 1),
              child: Icon(
                Icons.notification_important,
                size: 40,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          Icon(Icons.notification_important),
                          Text('Stay up to date'),
                        ],
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'By subscribing to these results you accept to receive notifications whenever we update the information for this country',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Color.fromRGBO(33, 33, 33, 1),
                              fontSize: 14,
                              fontFamily: "Roboto",
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            'SUBSCRIBE ME',
                            style: TextStyle(
                              color: Color.fromRGBO(98, 0, 238, 1),
                              fontSize: 14,
                              fontFamily: "Roboto",
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Subscribe",
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 33, 1),
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ]),
    );
  }
}
