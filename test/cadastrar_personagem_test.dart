import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rainbow_six_app/screens/cadastrar_personagem.dart';

void main() {
  testWidgets('Exibe corretamente os campos na tela de cadastro de personagem', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CadastrarPersonagem()));

    expect(find.text('Cadastrar Personagem'), findsOneWidget);

    // Atualize o número total de TextField esperado com base nos campos existentes
    expect(find.byType(TextField), findsNWidgets(6)); // Nome, armas e gadgets

    // Confirme que existem dois DropdownButton<int> para Velocidade e Blindagem
    expect(find.byType(DropdownButtonFormField<int>), findsNWidgets(2));
  });

  testWidgets('Salva o personagem ao preencher os campos e clicar no botão Salvar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CadastrarPersonagem()));

    // Atribuir Keys para facilitar a seleção de TextFields
    await tester.enterText(find.byKey(Key('nome')), 'Ash');
    await tester.enterText(find.byKey(Key('armaPrimaria')), 'AK-47');
    await tester.enterText(find.byKey(Key('armaSecundaria')), 'Pistol');
    await tester.enterText(find.byKey(Key('gadgetPrincipal')), 'Drone');
    await tester.enterText(find.byKey(Key('gadgetPrimario')), 'Granada');
    await tester.enterText(find.byKey(Key('gadgetSecundario')), 'C4');

    // Garanta que o botão "Salvar Personagem" esteja visível e depois clique nele
    final salvarButton = find.text('Salvar Personagem');
    await tester.ensureVisible(salvarButton);
    await tester.tap(salvarButton);

    // Aguarde o próximo frame para aplicar a ação
    await tester.pumpAndSettle();

    // Adicione validações adicionais se necessário
  });
}

