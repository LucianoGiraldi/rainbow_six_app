import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/personagem.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<List<Personagem>> getPersonagens() async {
    final response = await http.get(Uri.parse('$baseUrl/personagens'));
    if (response.statusCode == 200) {
      List<dynamic> personagensJson = json.decode(response.body);
      return personagensJson.map((json) => Personagem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load personagens');
    }
  }

  Future<void> createPersonagem(Personagem personagem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/personagens'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(personagem.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create personagem');
    }
  }

  Future<void> deletePersonagem(int id) async {
  final response = await http.delete(Uri.parse('$baseUrl/personagens/$id'));
  if (response.statusCode != 200) {
    throw Exception('Falha ao excluir o personagem');
  }
}

  Future<void> updatePersonagem(Personagem personagem) async {
  final response = await http.put(
    Uri.parse('$baseUrl/personagens/${personagem.id}'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(personagem.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Falha ao atualizar o personagem');
  }
}



}
