import 'package:flutter/material.dart';
import 'screens/home.dart'; // Certifique-se de que o caminho está correto

void main() {
  runApp(RainbowSixApp());
}

class RainbowSixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow Six Siege App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(), // Definindo a HomePage como a tela inicial
    );
  }
}
