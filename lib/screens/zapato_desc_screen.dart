import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../models/zapato_model.dart';
import '../widgets/widgets.dart';

class ZapatoDescScreen extends StatelessWidget {
  const ZapatoDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(tag: 'zapato-1', child: ZapatoSize(fullScreen: true)),
              Positioned(
                left: 10,
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                    cambiarStatusDark();
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYMas(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//-------------------- _BotonesLikeCartSettings -------------------------
class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(
            icon: Icon(Icons.favorite, color: Colors.red, size: 25),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.6),
              size: 25,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.share,
              color: Colors.grey.withOpacity(0.6),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

//-------------------- _BotonSombreado ---------------------
class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          // ignore: unnecessary_const
          const BoxShadow(
            color: Colors.black54,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(5, 5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }
}

//-------------------- _ColoresYMas -------------------------
class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 90,
                  child: _BotonColor(Color(0xff364d56), 4, 'assets/negro.png'),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(Color(0xff2099f1), 3, 'assets/azul.png'),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                    Color(0xffffad29),
                    2,
                    'assets/amarillo.png',
                  ),
                ),
                _BotonColor(Color(0xffc6d642), 1, 'assets/verde.png'),
              ],
            ),
          ),
          const BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffffc675),
          ),
        ],
      ),
    );
  }
}

//-------------------- _BotonColor -------------------------

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: 400 - index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
//-------------------- _MontoBuyNow -------------------------

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const Text(
            '\$180.0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Bounce(
            delay: const Duration(milliseconds: 300),
            from: 18,
            child: const BotonNaranja(texto: 'Buy now', ancho: 120, alto: 40),
          ),
        ],
      ),
    );
  }
}
