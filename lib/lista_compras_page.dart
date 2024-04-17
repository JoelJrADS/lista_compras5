import 'package:flutter/material.dart';
import 'formulario_adicionar_item.dart';
import 'lista_compras_exibir.dart';

class ListaComprasPage extends StatefulWidget {
  @override
  _ListaComprasPageState createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  final _nomeProdutoController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _valorController = TextEditingController();
  double _valorTotal = 0.0;

  List<Map<String, dynamic>> _itensCompra = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confeccione uma lista de compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crie sua lista de compras',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FormularioAdicionarItem(
              nomeProdutoController: _nomeProdutoController,
              quantidadeController: _quantidadeController,
              valorController: _valorController,
              onSubmit: _adicionarItem,
            ),
            SizedBox(height: 20),
            ListaComprasExibir(itensCompra: _itensCompra),
            SizedBox(height: 20),
            Text(
              'Valor estimado da lista: R\$ $_valorTotal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _salvarLista,
                  child: Text('Salvar lista'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Adicionar lógica para editar a lista
                  },
                  child: Text('Editar lista'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarItem(String nomeProduto, String quantidade, double valor) {
    setState(() {
      _itensCompra.add({
        'nomeProduto': nomeProduto,
        'quantidade': quantidade,
        'valor': valor,
      });
      _valorTotal += valor;
    });
    _nomeProdutoController.clear();
    _quantidadeController.clear();
    _valorController.clear();
  }

  void _salvarLista() {
    // Adicionar lógica para salvar a lista
    // Após salvar a lista, exibir o valor estimado da lista
    _atualizarValorEstimadoLista();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Valor estimado da lista'),
          content: Text('R\$ $_valorTotal'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _atualizarValorEstimadoLista() {
    double total = 0.0;
    for (var item in _itensCompra) {
      total += item['valor'];
    }
    setState(() {
      _valorTotal = total;
    });
  }
}
