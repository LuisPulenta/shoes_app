import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatefulWidget {
  final String titulo;
  final String descripcion;

  const ZapatoDescripcion({required this.titulo, required this.descripcion});
  @override
  State<ZapatoDescripcion> createState() => _ZapatoDescripcionState();
}

class _ZapatoDescripcionState extends State<ZapatoDescripcion> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              widget.titulo,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.descripcion,
              style: TextStyle(color: Colors.black54, height: 1.6),
            ),
          ],
        ));
  }
}
