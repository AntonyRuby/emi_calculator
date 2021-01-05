import 'package:emi_calculator/emi.dart';
import 'package:emi_calculator/retirement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'simple_interest.dart';
import 'compound_interest.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Financial Calculator",
      theme: ThemeData(
          primaryColor: Colors.green, accentColor: Colors.greenAccent),
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Center(child: Text("Financial Calculator")),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              margin: EdgeInsets.all(10),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                  // childAspectRatio: 2 / 2
                ),
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Emi()));
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            "EMI",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimpleInterest()));
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            "Simple Interest",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompoundInterest()));
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            "Compound Interest",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Retirement()));
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            "Retirement Calculator",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )),
                ],
              )),
        ));
  }
}
