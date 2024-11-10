import 'dart:io';
import 'package:flutter/material.dart';
import '../models/personagem.dart';
import '../services/api_service.dart';

class HistoricoPersonagens extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens Cadastrados'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Personagem>>(
        future: apiService.getPersonagens(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar personagens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum personagem cadastrado'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final personagem = snapshot.data![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: personagem.fotoUrl.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: FileImage(File(personagem.fotoUrl)),
                            radius: 30,
                          )
                        : CircleAvatar(
                            child: Icon(Icons.person, size: 30),
                          ),
                    title: Text(
                      personagem.nome,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Velocidade: ${personagem.velocidade}'),
                        Text('Blindagem: ${personagem.blindagem}'),
                        Text('Gadget Principal: ${personagem.gadgetPrincipal}'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
