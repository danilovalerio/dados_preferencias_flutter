import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();

  _salvar(){

  }

  _recuperar(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Text("Nada salvo.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration:
                InputDecoration(labelText: "Digite algo"),
                style: TextStyle(fontSize: 20),
                controller: _controllerCampo,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    onPressed: _salvar,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _recuperar,
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
