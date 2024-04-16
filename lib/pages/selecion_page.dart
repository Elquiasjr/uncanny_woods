import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/configs/app_settings.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
 
  late Map<String,int> sec;

  int selected = 1;
  int mask = 1;
  late int? real;
  String mascara = "assets/Raposa_01.png";
  String titulo = "Máscara da Raposa";
  String def = "Uma máscara de uma raposa selvagem, ao coloca-lá você nota que a sua visão se aprofunda pela escuridão.";
  
  readNumberFormat(){
    sec = context.watch<AppSetings>().locale;
  }

  selectMask(){
    return GestureDetector(
      onTap: (){
        context.read<AppSetings>().setMask(selected);
        //print(sec['Mask']);  //verificação de qual valor está sendo cetado
      },
      child: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white24,),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Selecionar',style: TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Color.fromARGB(255, 219, 178, 27))) 
            ),
          )
        ),
      ),
    );
  }
  
  void _alt(){
    setState(() {
      if (selected == 3){
        selected = 1;
        mascara = "assets/Raposa_01.png";
        titulo = "Máscara da Raposa";
        def = "Uma máscara de uma raposa selvagem, ao coloca-lá você nota que a sua visão se aprofunda pela escuridão.";
      }
      else{ 
      if  (selected == 2){
        selected = 3;
        mascara = "assets/Urso_01.png";
        titulo = "Máscara do Urso";
        def = "Uma máscara de um urso pardo, ao coloca-lá você nota que a sua resiliencia aumenta superando a de qualquer criatura.";
      }
      if  (selected == 1){
        selected = 2;
        mascara = "assets/Lobo_01.png";
        titulo = "Máscara do Lobo";
        def = "Uma máscara de um lobo cinzento, ao coloca-lá você nota que a sua velocidade se afia superando a de qualquer criatura.";
      }}
    });
  }
  void _dec(){
    setState(() {
      if (selected == 1){
        mascara = "assets/Urso_01.png";
        selected = 3;
        titulo = "Máscara do Urso";
        def = "Uma máscara de um urso pardo, ao coloca-lá você nota que a sua resiliencia aumenta superando a de qualquer criatura.";
      }
      else{ 
        if  (selected == 2){
          selected = 1;
          mascara = "assets/Raposa_01.png";
          titulo = "Máscara da Raposa";
          def = "Uma máscara de uma raposa selvagem, ao coloca-lá você nota que a sua visão se aprofunda pela escuridão.";
        }
        if  (selected == 3){
          selected = 2;
          mascara = "assets/Lobo_01.png";
          titulo = "Máscara do Lobo";
          def = "Uma máscara de um lobo cinzento, ao coloca-lá você nota que a sua velocidade se afia superando a de qualquer criatura.";
        }
      }
    });
  }

  //_SelectPage({super.key});
  //const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
   readNumberFormat();
   return Container(
     decoration: const BoxDecoration(
       image: DecorationImage(
         image: AssetImage(
           'assets/fundo_mascara.png'
         ),
           fit: BoxFit.cover,
       ),
     ),
     child: Scaffold(
       appBar: AppBar(
         iconTheme:const IconThemeData(color: Color.fromARGB(255, 219, 178, 27)),
         backgroundColor: Colors.black54,
         title: const Text('Máscaras', style: TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Colors.white70,)),
       ),
       backgroundColor: Colors.transparent,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         //crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Container(
             decoration: const BoxDecoration(
               color: Colors.transparent,
               ),
             child: const Padding(
               padding: EdgeInsets.symmetric(
                 vertical: 8,
                 horizontal: 20,
               ), 
               child: Text(
                 'Escolha a sua máscara:',
                 style: TextStyle(
                   fontSize: 22,
                   fontFamily: 'Silkscreen',
                   color: Color.fromARGB(255, 219, 178, 27),
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(0.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   SizedBox(
                     width: 300,
                     height: 280,
                     child: Image.asset(mascara),
                   ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                         onTap: ()  {
                           _dec();
                         },
                         child: const SizedBox(
                           child: Icon(Icons.arrow_left, size: 80,),
                         ),

                         ),
                         Center(
                           child:ClipRRect (
                             borderRadius: const BorderRadius.all(Radius.circular(22)),
                             child: Container(
                               decoration: const BoxDecoration(
                               color: Colors.black54,
                               ),
                               child: Padding(
                                 // ignore: prefer_const_constructors
                                 padding: EdgeInsets.symmetric(
                                   vertical: 12,
                                   horizontal: 20,
                                 ), 
                                 child: Text(
                                   titulo, 
                                   style: const TextStyle(
                                     fontSize: 16,
                                     fontFamily: 'Silkscreen',
                                     color: Colors.white,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),

                        GestureDetector(
                           onTap: ()  {
                             _alt();
                           },
                           child: const SizedBox(
                             child: Icon(Icons.arrow_right, size: 80,),
                           ),
                         )
                      ],
                    ),
                      Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: ClipRRect(
                         borderRadius: const BorderRadius.all(Radius.circular(10)),
                         child: Container(
                           decoration: const BoxDecoration(
                           color: Colors.black54,
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(15.0),
                             child: Text(
                               def, 
                               style: const TextStyle(
                                 fontSize: 14,
                                 fontFamily: 'Silkscreen',
                                 color: Colors.white70,
                               ),
                             ),
                           ),
                         ),
                       ),
                      ),
                   selectMask()
                 ],
               ),
           ),
         ],
       ),
     ),
   );
  } 
} 