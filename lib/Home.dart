import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _txtSalvo = "Nada salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {

    String vlrDigitado = _controllerCampo.text;
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", vlrDigitado);
    
    print("operacao salvar: $vlrDigitado");

  }

  _recuperar()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _txtSalvo = prefs.getString("nome") ?? "Sem valor.";
    });

  }

  _remover()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");


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
              child: Text(_txtSalvo,
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
                      "Recuperar",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _recuperar,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Remover",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _remover,
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
