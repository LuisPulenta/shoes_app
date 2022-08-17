import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  const CustomAppBar({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                texto,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const Icon(
                Icons.search,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
