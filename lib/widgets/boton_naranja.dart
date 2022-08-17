import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  const BotonNaranja(
      {Key? key,
      required this.texto,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
