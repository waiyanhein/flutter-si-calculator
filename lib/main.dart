import 'package:flutter/material.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My app bar"),
        ),
        body: FavouriteCity(),
      ),
    );
  }
}

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String _cityName = "";
  var _currencies = ["GBP", "EUP", "USD", "AUD", "SGD"];
  var _selectedCurrency = "GBP";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amberAccent,
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (String userInput) {
                  this.setState(() {
                    _cityName = userInput;
                  });
                },
              ),
              DropdownButton<String>(
                items: _currencies.map((String dropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropdownStringItem,
                    child: Text(dropdownStringItem),
                  );
                }).toList(),
                onChanged: (String selectedValue) {
                  this.setState(() {
                    this._selectedCurrency = selectedValue;
                  });
                },
                value: this._selectedCurrency,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("My favourite city is $_cityName."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
