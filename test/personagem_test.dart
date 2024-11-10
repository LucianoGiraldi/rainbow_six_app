import 'package:flutter_test/flutter_test.dart';
import 'package:rainbow_six_app/models/personagem.dart';

void main() {
  test('Converte JSON para objeto Personagem', () {
    final personagemJson = {
      'id': 1,
      'nome': 'Ash',
      'fotoUrl': 'https://liquipedia.net/commons/images/thumb/7/7b/Ash_R6S_Half.png/294px-Ash_R6S_Half.png',
      'velocidade': 3,
      'blindagem': 1,
      'armaPrimaria': 'R4-C',
      'armaSecundaria': 'M45 MEUSOC',
      'gadgetPrimario': 'Breach Charge',
      'gadgetSecundario': 'Claymore'
    };

    final personagem = Personagem.fromJson(personagemJson);

    expect(personagem.id, 1);
    expect(personagem.nome, 'Ash');
    expect(personagem.velocidade, 3);
    expect(personagem.blindagem, 1);
    expect(personagem.armaPrimaria, 'R4-C');
  });

  test('Converte objeto Personagem para JSON', () {
    final personagem = Personagem(
      id: 1,
      nome: 'Ash',
      fotoUrl: 'https://liquipedia.net/commons/images/thumb/7/7b/Ash_R6S_Half.png/294px-Ash_R6S_Half.png',
      velocidade: 3,
      blindagem: 1,
      armaPrimaria: 'R4-C',
      armaSecundaria: 'M45 MEUSOC',
      gadgetPrincipal: 'MUNIÇÃO EXPLOSIVA',
      gadgetPrimario: 'Carga de demolição',
      papel: 'Ataque',
      gadgetSecundario: 'Claymore',
    );

    final personagemJson = personagem.toJson();

    expect(personagemJson['id'], 1);
    expect(personagemJson['nome'], 'Ash');
    expect(personagemJson['velocidade'], 3);
    expect(personagemJson['blindagem'], 1);
  });
}
