import 'package:flutter/material.dart';

void main() => runApp(SICalculatorApp());

class SICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Simple Interest Calculator", home: SIForm());
  }
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  double _minimumPadding = 15.0;
  var _currencies = ["GBP", "EUP", "USD", "AUD", "SGD"];
  String _selectedCurrency = "GBP";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SI Calculator"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: getImageAsset(),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(this._minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Enter the principal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(this._minimumPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Rate of interest",
                        hintText: "Enter the rate of interest",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Tern",
                            hintText: "Enter the term",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: DropdownButton<String>(
                        value: _selectedCurrency,
                        items: _currencies.map((String dropdownItem) {
                          return DropdownMenuItem<String>(
                            value: dropdownItem,
                            child: Text(dropdownItem),
                          );
                        }).toList(),
                        onChanged: (String newSelectedValue) {
                          this.setState(() {
                            this._selectedCurrency = newSelectedValue;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: _minimumPadding, top: _minimumPadding),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.pinkAccent,
                        child: Text("Calculate"),
                        elevation: 6.0,
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: _minimumPadding, top: _minimumPadding),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.amberAccent,
                        child: Text("Reset"),
                        elevation: 6.0,
                        onPressed: () {

                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage('images/calculator.png');
  Image image = Image(
    image: assetImage,
    width: 150.0,
  );

  return Container(
    child: image,
  );
}
