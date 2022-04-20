import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    //cambiarStatusDark();

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
              top: 80,
              left: 20,
              child: FloatingActionButton(
                child: Icon(
                  Icons.chevron_left,
                  size: 60,
                  color: Colors.white,
                ),
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _MontoBuyNow(),
                _ColoresYmas(),
                _BotonesLikeCartSettings(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 35,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 35,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]),
      child: this.icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
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
                  child: _BotonColor(
                    color: Color(0xffc6d642),
                    index: 4,
                    urlImagen: 'assets/verde.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                    color: Color(0xffffad29),
                    index: 3,
                    urlImagen: 'assets/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                    color: Color(0xff2099f1),
                    index: 2,
                    urlImagen: 'assets/azul.png',
                  ),
                ),
                _BotonColor(
                  color: Color(0xff364d56),
                  index: 1,
                  urlImagen: 'assets/negro.png',
                ),
              ],
            ),
          ),
          //Spacer(),
          const BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(
      {required this.color, required this.index, required this.urlImagen});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
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

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                texto: 'Buy now',
                ancho: 120,
                alto: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
