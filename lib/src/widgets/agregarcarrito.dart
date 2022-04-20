import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  const AgregarCarritoBoton({required this.monto});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '\$$monto',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          BotonNaranja(
            texto: 'Add to cart',
            ancho: 150,
            alto: 50,
          ),
          SizedBox(
            width: 20,
          ),
        ]),
      ),
    );
  }
}
