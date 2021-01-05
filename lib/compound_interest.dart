import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class CompoundInterest extends StatefulWidget {
  @override
  _CompoundInterestState createState() => _CompoundInterestState();
}

class _CompoundInterestState extends State<CompoundInterest> {
  var formkey = GlobalKey<FormState>();

  String result = " ";
  String finalresult = "";
  TextEditingController principal = TextEditingController();
  TextEditingController interest = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController compounds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text("Compound Interest")),
        elevation: 0,
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: TextFormField(
                controller: principal,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter Principal Amount";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Principal Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                controller: interest,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter Rate of Interest";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Rate of Interest",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                controller: compounds,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter Compounds Per Year";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Compounds Per Year",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                controller: term,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter Term in Year";
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Term in Year",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (formkey.currentState.validate()) {
                          result = calculate();
                        }
                      });
                    },
                    child: Text("Calculate"),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: RaisedButton(
                    onPressed: () {
                      principal.text = "";
                      term.text = "";
                      interest.text = "";
                      result = "";
                    },
                    child: Text("Reset"),
                  ))
                ],
              ),
            ),
            Spacer(),
            Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                "Your Compound Interest  " + result,
                style: TextStyle(fontSize: 20),
              ),
            )),
            Spacer()
          ],
        ),
      ),
    );
  }

  String calculate() {
    // A=p(1+(r/n))^(nt)
    double Principal = double.parse(principal.text);
    double Term = double.parse(term.text);
    double Interest = double.parse(interest.text);
    double CompoundsPerYear = double.parse(compounds.text);

    // double FinalAmount = Principal * math.pow(1 + Interest, Term);

    double FinalAmount =
        Principal * math.pow((1 + (Interest / 100)), (CompoundsPerYear * Term));

    result = FinalAmount.toStringAsFixed(2);

    return result;
  }
}
