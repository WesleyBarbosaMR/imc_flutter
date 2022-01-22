import 'package:flutter/material.dart';
import 'package:imc_flutter/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC Calculator",
      home: HomePage(),
    );
  }
}
