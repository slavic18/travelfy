import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    AssetImage logoAsset = AssetImage('images/logo.png');
    Image image = Image(image: logoAsset, width: 111, height: 36);

    Widget destinationIcon = SvgPicture.asset("images/destination.svg",
        semanticsLabel: 'destinationIcon ');
    Widget calendarIcon = SvgPicture.asset("images/calendar.svg",
        semanticsLabel: 'calendarIcon ');
    Widget startIcon =
        SvgPicture.asset("images/start.svg", semanticsLabel: 'calendarIcon ');

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 44),
              child: image,
            ),
            Expanded(
              child: Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 144),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start with your\nhealth in mind.',
                            style: TextStyle(
                                fontSize: 32,
                                letterSpacing: 2.07,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(43, 33, 62, 1)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Plan your trip.\nDo it safely',
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1.67,
                                  fontFamily: 'inter',
                                  color: Color.fromRGBO(42, 37, 52, 1)),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              height: 144,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 12),
                    child: Row(
                      children: <Widget>[
                        calendarIcon,
                        Padding(
                            padding: EdgeInsets.only(left: 12.5, right: 11),
                            child: Text(
                              "On",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            )),
                        Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "inter",
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(98, 29, 238, 1)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( bottom: 7),
                    child: Row(
                      children: <Widget>[
                        startIcon,
                        Padding(
                            padding: EdgeInsets.only(left: 12.5, right: 11),
                            child: Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            )),
                        Text(
                          "Luxembourg",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "inter",
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(98, 29, 238, 1)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only( bottom: 7),
                      child: Row(
                        children: <Widget>[
                          destinationIcon,
                          Padding(
                              padding: EdgeInsets.only(left: 12.5, right: 11),
                              child: Text(
                                "To",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                              )),
                          Container(
                            width: 260,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border(
                                top: BorderSide(width:1.0, color: Color.fromRGBO(0, 0, 0, 0.12)),
                                left: BorderSide(width:1.0, color: Color.fromRGBO(0, 0, 0, 0.12)),
                                right: BorderSide(width:1.0, color: Color.fromRGBO(0, 0, 0, 0.12)),
                                bottom: BorderSide(width:1.0, color: Color.fromRGBO(0, 0, 0, 0.12))
                              )
                            ),
                            child:Padding(
                                padding: EdgeInsets.only(left: 16, right: 16, top:15, bottom:14),
    
                                child: Text(
                                  "Destination",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "roboto",
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                )
                            )
                          )

                        ],
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
