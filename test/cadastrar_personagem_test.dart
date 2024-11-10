import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rainbow_six_app/screens/cadastrar_personagem.dart';

void main() {
  testWidgets('Exibe corretamente os campos na tela de cadastro de personagem', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CadastrarPersonagem()));

    expect(find.text('Cadastrar Personagem'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // Nome e URL da foto
    expect(find.byType(DropdownButton<int>), findsNWidgets(2)); // Velocidade e Blindagem
  });

  testWidgets('Salva o personagem ao preencher os campos e clicar no botão Salvar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CadastrarPersonagem()));

    await tester.enterText(find.byType(TextField).first, 'Ash');
    await tester.enterText(find.byType(TextField).last, 'https://example.com/ash.jpg');

    await tester.tap(find.text('Salvar Personagem'));
    await tester.pump();

    // Você pode adicionar validações para garantir que a navegação foi chamada ou que um personagem foi salvo
  });
}
