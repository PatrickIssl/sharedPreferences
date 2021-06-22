import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  preferencias(opcao) async { // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(opcao == "salvar"){
      prefs.setInt("valor", _contador);
    }else
    if(opcao == "recuperar"){
      setState(() {
        _contador = prefs.get("valor")??0;
      });
    }else
    if(opcao == "resetar"){
      prefs.remove("valor");
    }


  }

  int _contador = 0;
  //
  // _incrementar(){
  //
  // }

  @override
  Widget build(BuildContext context) {

    preferencias("recuperar");
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                _contador.toString(),
                style: TextStyle(color: Colors.black, fontSize: 80),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(
                  "Incrementar",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onPressed: () {
                  setState(() {
                    _contador++;
                    preferencias("salvar");
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: Text(
                  "excluir",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onPressed: () {
                  setState(() {
                    _contador == 0;
                    preferencias("resetar");
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
