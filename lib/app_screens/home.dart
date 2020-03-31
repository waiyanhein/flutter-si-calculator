import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.deepPurple,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Flight 1",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Flight 2",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Flight 3",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Flight 4",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlightImageAsset(),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: BookFlightButton(),
                )
              ],
            )
          ],
        ));
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flight.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}

class BookFlightButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: RaisedButton(
        color: Colors.pinkAccent,
        child: Text("Book Flight", style: TextStyle(fontSize: 15.0),),
        elevation: 6.0,
        onPressed: () {
          bookFlight(context);
        },
      ),
    );
  }

  void bookFlight(BuildContext context) {

    var alertDialog = AlertDialog(
      title: Text("Flight booked successfully"),
      content: Text("Have a pleasant flight."),
    );
    
    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }
}
