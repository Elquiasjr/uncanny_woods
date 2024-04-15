import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/configs/app_settings.dart';
import 'package:uncanny_woods/models/player.dart';
import "dart:math";

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  late Map<String,int> sec = context.watch<AppSetings>().locale;
  late int? real = sec['Mask'];
  int typeIni = (Random().nextInt(3)+1);
  late Jogador inimigo = inicializadorE(typeIni);
  late Jogador jogador = inicializadorJ(real);
  
  
  Jogador inicializadorJ(int? a){
    if(real == 1){
      return Raposa(false, false, true, 0);
    }
    if(real == 2){
      return Lobo(false, false, true, 1);
    }
    else{
      return Urso(false, false, true, 0);
    }
  }

  Jogador inicializadorE(int a){
    if(typeIni == 1){
      return Raposa(false, false, true, 0);
    }
    if(typeIni == 2){
      return Lobo(false, false, true, 1);
    }
    else{
      return Urso(false, false, true, 0);
    }
  }


  @override
  Widget build(BuildContext context) { 
    jogador = inicializadorJ(real);
    inimigo = inicializadorE(typeIni);
    print(typeIni);
    print(inimigo.carga);
    print(jogador.carga);
    print('----------------------------');
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/Tela_Combate.png'
          ),
            fit: BoxFit.cover,
        ),
      ),
      child: 
      const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}