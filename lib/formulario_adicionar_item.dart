import 'package:flutter/material.dart';

class FormularioAdicionarItem extends StatelessWidget {
  final TextEditingController nomeProdutoController;
  final TextEditingController quantidadeController;
  final TextEditingController valorController;
  final Function(String, String, double) onSubmit;

  const FormularioAdicionarItem({
    required this.nomeProdutoController,
    required this.quantidadeController,
    required this.valorController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nomeProdutoController,
            decoration: InputDecoration(labelText: 'Nome do produto'),
          ),
          TextFormField(
            controller: quantidadeController,
            decoration: InputDecoration(labelText: 'Quantidade'),
          ),
          TextFormField(
            controller: valorController,
            decoration: InputDecoration(labelText: 'Valor estimado'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              double valor = double.tryParse(valorController.text) ?? 0.0;
              onSubmit(
                nomeProdutoController.text,
                quantidadeController.text,
                valor,
              );
            },
            child: Text('Adicionar item'),
          ),
        ],
      ),
    );
  }
}