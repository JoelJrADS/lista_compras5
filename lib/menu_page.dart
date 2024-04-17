import 'package:flutter/material.dart';
import 'criar_nova_lista_page.dart';
import 'consultar_lista.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de criação de lista
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CriarNovaListaPage()),
                );
              },
              child: Text('Criar uma nova lista'),
            ),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultarListaPage()),
    );
  },
              child: Text('Consultar uma lista'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica para editar uma lista
              },
              child: Text('Editar uma lista'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica para excluir uma lista
              },
              child: Text('Excluir uma lista'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica para pesquisar itens em uma lista
              },
              child: Text('Pesquisar itens em uma lista'),
            ),
          ],
        ),
      ),
    );
  }
}