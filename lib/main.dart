import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/screens/models/zapato_model.dart';
import 'package:shoes_app/screens/zapato_screen.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ZapatoModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ZapatoScreen());
  }
}
