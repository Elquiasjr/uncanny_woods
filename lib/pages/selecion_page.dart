import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

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
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white24,
              ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24
              ), 
              child: Text(
                'Escolha a sua máscara:',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 148, 34),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/Urso_01.png'),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    ),
  );
}