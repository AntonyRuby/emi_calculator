import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  var formkey = GlobalKey<FormState>();
  var ctype = ["Rupees", "Dollar", "Euro"];
  var cvalue = "Rupees";

  String result = " ";
  String finalresult = "";
  TextEditingController principal = TextEditingController();
  TextEditingController interest = TextEditingController();
  TextEditingController term = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text("Simple Interest")),
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
                        borderRadius: BorderRadius.circular(5.0))),
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
                        borderRadius: BorderRadius.circular(5.0))),
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
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Spacer(),
            Expanded(
                child: DropdownButton<String>(
              items: ctype.map((String cTypeData) {
                return DropdownMenuItem<String>(
                    value: cTypeData, child: Text(cTypeData));
              }).toList(),
              onChanged: (String value) {
                setState(() {
                  this.cvalue = value;
                });
              },
              value: cvalue,
            )),
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
                    width: 5,
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
                result,
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
    double Principal = double.parse(principal.text);
    double Term = double.parse(term.text);
    double Interest = double.parse(interest.text);

    double FinalAmount = Principal + (Principal * Term * Interest) / 100;

    String r =
        "After $Term years, Your Investment will be worth $FinalAmount $cvalue";

    return r;
  }
}
