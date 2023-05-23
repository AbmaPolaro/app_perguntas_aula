import 'package:flutter/material.dart';
import './questao.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

// Incluir o setState para que a interface gráfica seja avisada quando houver uma mudança:
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  //Função que retorna outra função:
  //void Function() funcaoQueRetorna(){
  //return(){
  // print('Pergunta respondida!');
  //};
  // Nesse caso posso também chamar esta função (funcaoQueRetorna()) no onPressed

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Questao(
              perguntas[_perguntaSelecionada],
              texto: perguntas[_perguntaSelecionada],
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 1'),
            ),

            //No onPressed também posso passar:
            //onPressed: () {
            //print('Resposta 2 foi selecionada!');
            //}
            //ou
            //Usar a função arrow:
            //onPressed: () => print('Resposta 1'),

            //OBS: não invoque a função a não ser que a função retorne uma função.

            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
