import 'package:flutter/material.dart';

class RecomendacaoMapa extends StatelessWidget {
  final List<Map<String, String>> recomendacoes = [
    {'mapa': 'Banco', 'personagem': 'Valkyrie (Defesa)'},
    {'mapa': 'Consulado', 'personagem': 'Thermite (Ataque)'},
    {'mapa': 'Casa de Campo', 'personagem': 'Mute (Defesa)'},
    {'mapa': 'Fronteira', 'personagem': 'Ash (Ataque)'},
    {'mapa': 'Litoral', 'personagem': 'Jackal (Ataque)'},
    {'mapa': 'Café Dostoyevsky', 'personagem': 'Bandit (Defesa)'},
    {'mapa': 'Parque Temático', 'personagem': 'Ying (Ataque)'},
    {'mapa': 'Chalé', 'personagem': 'Jäger (Defesa)'},
    {'mapa': 'Fortaleza', 'personagem': 'Maverick (Ataque)'},
    {'mapa': 'Aeroporto', 'personagem': 'Echo (Defesa)'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendações por Mapa'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recomendacoes.length,
        itemBuilder: (context, index) {
          final recomendacao = recomendacoes[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              leading: Icon(Icons.map, color: Colors.black, size: 40),
              title: Text(
                recomendacao['mapa']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Personagem Recomendado: ${recomendacao['personagem']}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
