import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _TITULO_APP_BAR = 'Crinado Transferencias';
const _DICA_NUMERO_CANTA = 'Numero da conta';
const _ROTULO_NUMERO_CANTA= '0000';
const _DICA_VALOR = 'Valor';
const _ROTULO_VALOR = '00.0';
const _BOTAO = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TITULO_APP_BAR),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              _controladorCampoNumeroConta,
              _DICA_NUMERO_CANTA,
              _ROTULO_NUMERO_CANTA,
            ),
            Editor(
              _controladorCampoValor,
              _DICA_VALOR,
              _ROTULO_VALOR,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_BOTAO),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(context) {
    final int numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}