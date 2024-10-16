import 'package:currency_convertor/currency_convertor.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConvertor(),
    );
  }
}