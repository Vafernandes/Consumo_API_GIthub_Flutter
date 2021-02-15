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
                alignment: Alignment.center,
                child: Text(
                  'Explore repositórios no GIthub',
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
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pesquise aqui',
                      ),
                      onChanged: (value) {
                        textoDigitado = value;
                        print(textoDigitado);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      color: Colors.green,
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
