import 'package:flutter/material.dart';

class AreaPesquisa extends StatefulWidget {
  final Function(String) buscaUSerByName;

  const AreaPesquisa({Key key, this.buscaUSerByName}) : super(key: key);
  @override
  _AreaPesquisaState createState() => _AreaPesquisaState();
}

class _AreaPesquisaState extends State<AreaPesquisa> {
  var textoDigitado = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Explore usuários do Github',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pesquise aqui',
                        ),
                        onChanged: (value) {
                          textoDigitado = value;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: Colors.blue,
                      icon: Icon(
                        Icons.search,
                        size: 35,
                      ),
                      onPressed: () {
                        widget.buscaUSerByName(textoDigitado);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
