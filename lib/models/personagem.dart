class Personagem {
  final int? id;
  final String nome;
  final String fotoUrl;
  final int velocidade;
  final int blindagem;
  final String armaPrimaria;
  final String armaSecundaria;
  final String gadgetPrincipal;
  final String gadgetPrimario;
  final String gadgetSecundario;
  final String papel; // Campo para ataque ou defesa

  Personagem({
    this.id,
    required this.nome,
    required this.fotoUrl,
    required this.velocidade,
    required this.blindagem,
    required this.armaPrimaria,
    required this.armaSecundaria,
    required this.gadgetPrincipal,
    required this.gadgetPrimario,
    required this.gadgetSecundario,
    required this.papel, // Adicionando o parâmetro no construtor
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      id: json['id'] as int?,
      nome: json['nome'] ?? '',
      fotoUrl: json['fotoUrl'] ?? '',
      velocidade: json['velocidade'] ?? 1,
      blindagem: json['blindagem'] ?? 1,
      armaPrimaria: json['armaPrimaria'] ?? '',
      armaSecundaria: json['armaSecundaria'] ?? '',
      gadgetPrincipal: json['gadgetPrincipal'] ?? '',
      gadgetPrimario: json['gadgetPrimario'] ?? '',
      gadgetSecundario: json['gadgetSecundario'] ?? '',
      papel: json['papel'] ?? '', // Definindo o papel a partir do JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'fotoUrl': fotoUrl,
      'velocidade': velocidade,
      'blindagem': blindagem,
      'armaPrimaria': armaPrimaria,
      'armaSecundaria': armaSecundaria,
      'gadgetPrincipal': gadgetPrincipal,
      'gadgetPrimario': gadgetPrimario,
      'gadgetSecundario': gadgetSecundario,
      'papel': papel, // Incluindo papel na conversão para JSON
    };
  }
}
