import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Home() ,
  ));
}

class Home extends StatefulWidget
{
  @override
  _HomeState createState()=> _HomeState();
}

class _HomeState extends State<Home>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo do imc') ,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>
        [
          IconButton(icon: Icon(Icons.refresh), onPressed: (){})
        ],//Widget
      ),//appBar
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8.5, 0.0, 8.5, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //Aline icon in center
          children: <Widget>
          [
            Icon(Icons.person_pin, size:120.0, color: Colors.blue),
            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText:"Peso (KG)",
                  labelStyle: TextStyle(color: Colors.black)
              ),//InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),//TextFild
            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura",
                  labelStyle: TextStyle(color: Colors.black)
              ),//InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 25.0),
            ),//TextFild
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                    onPressed: (){},
                    child: Text("Calcular"),
                    color: Colors.blue
                ),//RaisedButton
              ),//container,
            ),//Padding
            Text("Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 25.0)
            ),//text
          ],//widget
        ),//collum
      ),//scrollview
    );//Scaffold
  }
}