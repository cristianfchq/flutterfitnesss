import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quienes Somos"),
      ),
      body: Center(
        child: Text('Estamos aprendiendo Dart y Flutter, Estudiantes ...'),
      ),
    );
  }
}