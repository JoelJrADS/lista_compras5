import 'package:flutter/material.dart';
import 'lista_helper.dart'; // Importe a classe ListaHelper aqui

class CriarNovaListaPage extends StatefulWidget {
  @override
  _CriarNovaListaPageState createState() => _CriarNovaListaPageState();
}

class _CriarNovaListaPageState extends State<CriarNovaListaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeListaController = TextEditingController();
  final _nomeProdutoController = TextEditingController();
  final _quantidadeController = TextEditingController();

  List<Map<String, dynamic>> _itensLista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Nova Lista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeListaController,
                decoration: InputDecoration(
                  labelText: 'Nome da Lista',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, informe o nome da lista';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Itens da Lista:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _itensLista.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_itensLista[index]['nome']),
                      subtitle: Text('Quantidade: ${_itensLista[index]['quantidade']}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nomeProdutoController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Produto',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _quantidadeController,
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _adicionarItem();
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _salvarLista();
                },
                child: Text('Salvar Lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _adicionarItem() {
    setState(() {
      String nomeProduto = _nomeProdutoController.text;
      String quantidade = _quantidadeController.text;

      if (nomeProduto.isNotEmpty && quantidade.isNotEmpty) {
        _itensLista.add({
          'nome': nomeProduto,
          'quantidade': quantidade,
        });

        _nomeProdutoController.clear();
        _quantidadeController.clear();

        print('Item adicionado: $_itensLista'); // Adiciona este print para verificar os itens sendo adicionados corretamente
        _nomeProdutoController.clear();
        _quantidadeController.clear();

      }
    });
  }

  void _salvarLista() async {
  if (_formKey.currentState?.validate() ?? false) {
    String nomeLista = _nomeListaController.text;
    await ListaHelper.salvarListaLocalmente(_itensLista, nomeLista);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Lista salva localmente')),
    );
    Navigator.pop(context); // Fecha a tela de criação de nova lista após salvar
  }
}

}
