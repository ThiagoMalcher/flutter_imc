import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infoChange = "Enter your details!";

  void _resetText() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoChange = "Enter your details!";
      _formkey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.5) {
        _infoChange = "Under weight(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc < 24.9) {
        _infoChange = "Ideal weight(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc < 29.9) {
        _infoChange = "Slightly overweight(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc < 34.9) {
        _infoChange = "Obesity degree I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 35.0 && imc < 39.9) {
        _infoChange = "Obesity degree II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40.0) {
        _infoChange = "Obesity degree III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC CALCULATION'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetText,
          ),
          //Iconbutton
        ], //Widget
      ), //appBar
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8.5, 0.0, 8.5, 0.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Aline icon in center
            children: <Widget>[
              Icon(Icons.person_pin, size: 120.0, color: Colors.blue),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight(KG)",
                    labelStyle: TextStyle(color: Colors.black)),
                //InputDecoration
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please report your weight!";
                  }
                },
              ), //TextFild
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height",
                    labelStyle: TextStyle(color: Colors.black)),
                //InputDecoration
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please report your height!";
                  }
                },
              ), //TextFild
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      child: Text("Calculate"),
                      color: Colors.blue), //RaisedButton
                ), //container,
              ), //Padding
              Text(_infoChange,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 25.0)), //text
            ], //widget
          ), //collum
        ), //form
      ), //scrollview
    ); //Scaffold
  }
}
