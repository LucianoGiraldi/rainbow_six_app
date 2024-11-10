import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../models/personagem.dart';
import '../services/api_service.dart';

class CadastrarPersonagem extends StatefulWidget {
  @override
  _CadastrarPersonagemState createState() => _CadastrarPersonagemState();
}

class _CadastrarPersonagemState extends State<CadastrarPersonagem> {
  final ApiService apiService = ApiService();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _armaPrimariaController = TextEditingController();
  final TextEditingController _armaSecundariaController = TextEditingController();
  final TextEditingController _gadgetPrincipalController = TextEditingController();
  final TextEditingController _gadgetPrimarioController = TextEditingController();
  final TextEditingController _gadgetSecundarioController = TextEditingController();
  
  int _velocidade = 1;
  int _blindagem = 1;
  Uint8List? _imageBytes;
  String _papel = 'Ataque';

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
      });
    }
  }

  void _salvarPersonagem() async {
    if (_imageBytes == null || _nomeController.text.isEmpty || _armaPrimariaController.text.isEmpty || _armaSecundariaController.text.isEmpty || _gadgetPrincipalController.text.isEmpty || _gadgetPrimarioController.text.isEmpty || _gadgetSecundarioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos e selecione uma imagem.')),
      );
      return;
    }

    final personagem = Personagem(
      nome: _nomeController.text,
      fotoUrl: '', // Pode ignorar o campo fotoUrl para testes
      velocidade: _velocidade,
      blindagem: _blindagem,
      armaPrimaria: _armaPrimariaController.text,
      armaSecundaria: _armaSecundariaController.text,
      gadgetPrincipal: _gadgetPrincipalController.text,
      gadgetPrimario: _gadgetPrimarioController.text,
      gadgetSecundario: _gadgetSecundarioController.text,
      papel: _papel,
    );

    await apiService.createPersonagem(personagem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Personagem'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageBytes != null
                      ? MemoryImage(_imageBytes!)
                      : null,
                  child: _imageBytes == null
                      ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                      : null,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome do Personagem',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _papel,
                items: ['Ataque', 'Defesa']
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text(val),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _papel = val!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Papel',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<int>(
                value: _velocidade,
                items: [1, 2, 3]
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text('Velocidade $val'),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _velocidade = val!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Velocidade',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<int>(
                value: _blindagem,
                items: [1, 2, 3]
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text('Blindagem $val'),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _blindagem = val!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Blindagem',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _armaPrimariaController,
                decoration: InputDecoration(
                  labelText: 'Arma Primária',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _armaSecundariaController,
                decoration: InputDecoration(
                  labelText: 'Arma Secundária',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _gadgetPrincipalController,
                decoration: InputDecoration(
                  labelText: 'Gadget Principal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _gadgetPrimarioController,
                decoration: InputDecoration(
                  labelText: 'Gadget Primário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _gadgetSecundarioController,
                decoration: InputDecoration(
                  labelText: 'Gadget Secundário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _salvarPersonagem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Salvar Personagem',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
