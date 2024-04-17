// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Importa a classe LoginPage do arquivo login_page.dart

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => LoginApp(),
  ));
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Usa a classe LoginPage como página inicial
    );
  }
}
