import 'package:flutter/material.dart';

void main() => runApp(SICalculatorApp());

class SICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            accentColor: Colors.pinkAccent,
            primaryColor: Colors.pink,
            brightness: Brightness.dark),
        title: "Simple Interest Calculator",
        home: SIForm());
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
  String _resultMessage = "";
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

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
                    style: textStyle,
                    controller: principalController,
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
                    style: textStyle,
                    controller: roiController,
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
                        style: textStyle,
                        controller: termController,
                        decoration: InputDecoration(
                            labelText: "Term",
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
                      padding: EdgeInsets.only(
                          left: _minimumPadding, top: _minimumPadding),
                      child: RaisedButton(
                        textColor: Theme.of(context).accentColor,
                        color: Theme.of(context).primaryColorDark,
                        child: Text(
                          "Calculate",
                          textScaleFactor: 1.5,
                        ),
                        elevation: 6.0,
                        onPressed: () {
                          this._calculateTotalReturns();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: _minimumPadding, top: _minimumPadding),
                      child: RaisedButton(
                        textColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Reset",
                          textScaleFactor: 1.5,
                        ),
                        elevation: 6.0,
                        onPressed: () {
                          this._reset();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: Text(this._resultMessage),
                ),
              )
            ],
          ),
        ));
  }

  void _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double result = principal + (principal * roi * term);

    this.setState(() {
      _resultMessage =
          "After $term years, your investment will be worth $result ${this._selectedCurrency}";
    });
  }

  void _reset() {
    principalController.text = "";
    roiController.text = "";
    termController.text = "";
    this.setState(() {
      this._selectedCurrency = "GBP";
      this._resultMessage = "";
    });
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
