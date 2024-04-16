import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/configs/app_settings.dart';
import 'package:uncanny_woods/pages/home_page.dart';


class OverPage extends StatefulWidget {
  const OverPage({super.key});


  @override
  State<OverPage> createState() => _OverPageState();
}

class _OverPageState extends State<OverPage> {

  late Map<String,int> sec;
  late int deepnes = sec['Deep'] ?? 0;
  late int bestScore = sec['Score'] ?? 0;


  setNewHighScore(){
    context.read<AppSetings>().setScore(deepnes);
  }
   readNumberFormat(){
    sec = context.watch<AppSetings>().locale;
  }

  
  @override
  Widget build(BuildContext context) {
    readNumberFormat();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            onFinished: () {
              if(bestScore < deepnes){
                setNewHighScore();
              }
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 500),
                  child:  const HomePage(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            animatedTexts: [ 
              TypewriterAnimatedText('Sua máscara foi quebrada e a imensidão da floresta te inunda ...',
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Silkscreen',
                color: Color.fromARGB(255, 219, 178, 27)),
              ),
              TypewriterAnimatedText("Profundidade alcançada : $deepnes",
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Silkscreen',
                color: Color.fromARGB(255, 219, 178, 27)),
              ),
              TypewriterAnimatedText('profundidade máxima já alcançada : $bestScore',
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
}