import 'package:flutter/material.dart';

import 'boton_naranja.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            '\$$monto',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const BotonNaranja(texto: 'Add to cart'),
        ],
      ),
    );
  }
}
