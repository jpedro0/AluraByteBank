import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: FormularioTransferencia()),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crinado Transferencias'),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumeroConta, 'Numero da conta', '0000'),
          Editor(_controladorCampoValor, 'Valor', '000.0',
              icone: Icons.monetization_on),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTransferencia(
                _controladorCampoNumeroConta.text, _controladorCampoValor.text),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(String numeroContaString, String valorString) {
    final int numeroConta = int.tryParse(numeroContaString);
    final double valor = double.tryParse(valorString);

    if (numeroConta != null && valor != null)
      final transferencia = Transferencia(valor, numeroConta);
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _dica;
  final IconData icone;

  Editor(this._controller, this._rotulo, this._dica, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferencias')),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 4)),
          ItemTransferencia(Transferencia(200.0, 3)),
          ItemTransferencia(Transferencia(300.0, 2)),
          ItemTransferencia(Transferencia(400.0, 1))
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
