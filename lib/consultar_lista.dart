import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lista_helper.dart';

class ConsultarListaPage extends StatefulWidget {
  @override
  _ConsultarListaPageState createState() => _ConsultarListaPageState();
}

class _ConsultarListaPageState extends State<ConsultarListaPage> {
  List<String> _nomesListas = [];

  @override
  void initState() {
    super.initState();
    _recuperarNomesListas();
  }

  Future<void> _recuperarNomesListas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? nomesListas = prefs.getStringList('nomes_listas');
    print('Nomes das listas recuperados: $nomesListas');
    if (nomesListas != null) {
      setState(() {
        _nomesListas = nomesListas;
      });
    }
   
    print('Número de nomes de listas recuperados: ${_nomesListas.length}'); // Adicione esta linha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Lista'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selecione a lista que deseja consultar:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _nomesListas.isEmpty
                  ? CircularProgressIndicator() // Mostra um indicador de carregamento enquanto os nomes das listas estão sendo recuperados
                  : ListView.builder(
                      itemCount: _nomesListas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_nomesListas[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetalhesListaPage(nomeLista: _nomesListas[index])),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalhesListaPage extends StatelessWidget {
  final String nomeLista;

  const DetalhesListaPage({Key? key, required this.nomeLista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Lista'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: ListaHelper.recuperarListaLocalmente(nomeLista),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os dados da lista'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Map<String, dynamic>> itensLista = snapshot.data!;
            return ListView.builder(
              itemCount: itensLista.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itensLista[index]['nome']),
                  subtitle: Text('Quantidade: ${itensLista[index]['quantidade']}'),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum item na lista'));
          }
        },
      ),
    );
  }
}
