import 'package:flutter/material.dart';

class ListaComprasExibir extends StatelessWidget {
  final List<Map<String, dynamic>> itensCompra;

  const ListaComprasExibir({required this.itensCompra});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itensCompra.length,
      itemBuilder: (context, index) {
        final item = itensCompra[index];
        return ListTile(
          title: Text(item['nomeProduto']),
          subtitle: Text('Quantidade: ${item['quantidade']}'),
          trailing: Text('R\$ ${item['valor']}'),
        );
      },
    );
  }
}