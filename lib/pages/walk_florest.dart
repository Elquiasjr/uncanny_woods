import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:uncanny_woods/models/player.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uncanny_woods/pages/inicio_page.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  
  late Map<String,int> sec;
  late Jogador jogador;
  
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            onFinished: () => 
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 500),
                  child:  const InicioPage(),
                  type: PageTransitionType.fade,
                ),
              ),
            animatedTexts: [ 
              TypewriterAnimatedText('Você adentra mais profundamente na floresta...',
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Silkscreen',
                color: Color.fromARGB(255, 219, 178, 27)),
              ),
              TypewriterAnimatedText("Profundidade atual : ",
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Silkscreen',
                color: Color.fromARGB(255, 219, 178, 27)),
              ),
              TypewriterAnimatedText('Uma figura estranha se aproxima pela escuridão',
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Silkscreen',
                color: Color.fromARGB(255, 219, 178, 27)),
              ),
            ],         
          ),
        ),
      ),
    );
}