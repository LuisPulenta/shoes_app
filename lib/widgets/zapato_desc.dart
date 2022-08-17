import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;
  const ZapatoDescripcion(
      {Key? key, required this.titulo, required this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            titulo,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            descripcion,
            style: const TextStyle(
                color: Colors.black54, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }
}
