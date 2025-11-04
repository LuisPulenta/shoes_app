import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/zapato_model.dart';
import '../screens/zapato_desc_screen.dart';

class ZapatoSize extends StatelessWidget {
  final bool fullScreen;
  const ZapatoSize({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        !fullScreen
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ZapatoDescScreen(),
                ),
              )
            : null;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
          ),
          child: Column(
            children: [
              //Zapato con su sombra]
              _ZapatoConSombra(),
              //Talles del zapato
              !fullScreen ? const _ZapatoTallas() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------ _ZapatoConSombra --------------------
class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

//------------------ _ZapatoSombra -----------------------
class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 240,
        height: 100,
        decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

//------------------ _ZapatoTallas -----------------------
class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

//------------------ _TallaZapatoCaja -----------------------
class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: numero != zapatoModel.talla
              ? Colors.white
              : const Color(0xfff1a23a),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == zapatoModel.talla)
              const BoxShadow(
                color: Color(0xfff1a23a),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: numero != zapatoModel.talla
                ? const Color(0xfff1a23a)
                : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
