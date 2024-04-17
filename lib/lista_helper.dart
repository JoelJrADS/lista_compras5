import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class ListaHelper {
  static Future<void> salvarListaLocalmente(List<Map<String, dynamic>> lista, String nomeLista) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> nomesListas = prefs.getStringList('nomes_listas') ?? [];
    nomesListas.add(nomeLista); // Adiciona o nome da lista à lista de nomes
    await prefs.setStringList('nomes_listas', nomesListas); // Salva a lista de nomes
    await prefs.setString('lista_compras_$nomeLista', jsonEncode(lista)); // Salva a lista de itens com o nome da lista como chave
    print('Lista salva localmente: $lista');
  }

  static Future<List<Map<String, dynamic>>> recuperarListaLocalmente(String nomeLista) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('lista_compras_$nomeLista');
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<Map<String, dynamic>>;
    } else {
      return []; // Retorna uma lista vazia se não houver dados salvos
    }
  }
}



