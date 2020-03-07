import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _TITULO_APP_BAR = 'Transferencias';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _listaTransferencia = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_TITULO_APP_BAR)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => FormularioTransferencia(),
            ),
          ).then((item) => _atualiza(item));
        },
      ),
      body: ListView.builder(
        itemCount: widget._listaTransferencia.length,
        itemBuilder: (context, index) {
          final transferencia = widget._listaTransferencia[index];
          return ItemTransferencia(transferencia);
        },
      ),
    );
  }

  void _atualiza(Transferencia item) {
    if (item != null)
      setState(() {
        widget._listaTransferencia.add(item);
      });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
