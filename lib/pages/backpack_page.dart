import 'package:flutter/material.dart';

class BackpackPage extends StatelessWidget {
  const BackpackPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/fundo_mascara.png'
        ),
          fit: BoxFit.cover,
      ),
    ),
    child: const Scaffold(
      backgroundColor: Colors.transparent,
    ),
  );
}