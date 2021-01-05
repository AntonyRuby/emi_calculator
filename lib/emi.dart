import 'package:flutter/material.dart';
import 'dart:math';

class Emi extends StatefulWidget {
  @override
  _EmiState createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  List tenuretypes = ["Month(s)", "Year(s)"];
  String tenuretype = "Year(s)";
  String result = "";

  final TextEditingController principalamount = TextEditingController();
  final TextEditingController interestrate = TextEditingController();
  final TextEditingController tenure = TextEditingController();

  bool switchvalue = true;
  double A = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Center(child: Text("EMI Calculator")),
          elevation: 0,
        ),
        body: Center(
          child: Container(
              child: Column(
            children: <Widget>[
              Spacer(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                  child: TextField(
                    controller: principalamount,
                    decoration: InputDecoration(labelText: "Principal Amount"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: TextField(
                    controller: interestrate,
                    decoration: InputDecoration(labelText: "Interest Rate"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 4,
                          child: TextField(
                            controller: tenure,
                            decoration: InputDecoration(labelText: "Tenure"),
                            keyboardType: TextInputType.number,
                          )),
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                tenuretype,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Switch(
                                  value: switchvalue,
                                  onChanged: (bool value) {
                                    if (value) {
                                      tenuretype = tenuretypes[1];
                                    } else {
                                      tenuretype = tenuretypes[0];
                                    }
                                    setState(() {
                                      switchvalue = value;
                                    });
                                  })
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Spacer(),
              Flexible(
                child: InkWell(
                  onTap: () {
                    int P = int.parse(principalamount.text);
                    double R = double.parse(interestrate.text) / 12 / 100;
                    int N = tenuretype == "Year(s)"
                        ? int.parse(tenure.text) * 12
                        : int.parse(tenure.text);

                    A = (P * R * pow((1 + R), N) / (pow((1 + R), N) - 1));

                    result = A.toStringAsFixed(2);

                    setState(() {});
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Spacer(),
              emiresult(result),
              Spacer()
            ],
          )),
        ));
  }

  Widget emiresult(emiResult) {
    bool canShow = false;
    String result = emiResult;

    if (result.length > 0) {
      canShow = true;
    }
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: canShow
            ? Column(children: [
                Text("Your EMI",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      )),
                )
              ])
            : Container());
  }
}
