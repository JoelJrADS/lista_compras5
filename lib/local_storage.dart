import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> salvarListaLocalmente(List<Map<String, dynamic>> lista) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('lista_compras', jsonEncode(lista));
}

Future<List<Map<String, dynamic>>> recuperarListaLocalmente() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('lista_compras');
  if (jsonString != null) {
    return jsonDecode(jsonString) as List<Map<String, dynamic>>;
  } else {
    return []; // Retorna uma lista vazia se não houver dados salvos
  }
}
