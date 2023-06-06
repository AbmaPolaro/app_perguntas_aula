import 'dart:ffi';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.nota, this.reiniciarQuestionario, {super.key});

  final int nota;
  final void Function() reiniciarQuestionario;

  String get fraseResultado {
    if (nota < 8) {
      return 'Parabéns!';
    } else if (nota < 12) {
      return 'Voçê é bom!';
    } else if (nota < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível hard!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
