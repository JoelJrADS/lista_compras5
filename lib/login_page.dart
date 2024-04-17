import 'package:flutter/material.dart';
import 'cadastro_page.dart'; // Importe a classe CadastroPage aqui
import 'menu_page.dart'; // Importe a classe MenuPage aqui

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Implementar a lógica de autenticação
                  bool loginSucessful = true; // Simulação de login bem-sucedido. Troque para a lógica real de autenticação.
                  if (loginSucessful) {
                    // Navegar para a tela do menu
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  } 
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroPage()),
                  );
                },
                child: Text('É a primeira vez no aplicativo? Cadastre-se.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
