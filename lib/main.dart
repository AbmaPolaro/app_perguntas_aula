import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

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
  }

  //Função que retorna outra função:
  //void Function() funcaoQueRetorna(){
  //return(){
  // print('Pergunta respondida!');
  //};
  // Nesse caso posso também chamar esta função (funcaoQueRetorna()) no onPressed

  @override
  Widget build(BuildContext context) {
    //final List<Map<String, Object>> perguntas = [], como trabalhamos com inferência não precisa especificar
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];

    List<Widget> respostas = [];
    for (String textoResp
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Perguntas"),
            centerTitle: true,
          ),
          body: Column(children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString(),
                ['resposta'].toString()),
            ...respostas
          ]),
        ));
  }
}
