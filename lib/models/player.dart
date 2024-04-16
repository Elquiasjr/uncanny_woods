import 'package:flutter/material.dart';
import 'package:uncanny_woods/pages/gameover_page.dart';
import 'package:uncanny_woods/pages/walk_florest.dart';


class Jogador{
  bool pose = false; // pose == false significa não estar defendendo, pose == true significa estar defendendo 
  bool vida = true;  // variavel para definir se tomou dano ou não naquele turno
  bool dano = false;
  int carga = 0; 

  Jogador(this.pose, this.vida, this.dano, this.carga);

  //FUNÇÕES DO JOGADOR

  //função para carregar ataque
  void carregar(){
    carga = carga + 1;
  }

  //função para de defender
  void defender(){
    pose = true;
  }


  //função para atacar caso tenha carga
  void atacando(){
    if(carga == 0){
     dano = false;
    }
    else{
      dano = true;
      carga = carga - 1;
    }
  }

  void turno(Jogador inimigo, Jogador jogador, BuildContext context){

    //combate inimigo
    if(inimigo.dano == true){
      if(jogador.pose == false){
        jogador.vida = false;
      }
      else{
        jogador.pose = false;
        inimigo.dano = false;
      }
    }

    //combate jogador
    if(jogador.dano == true){
      if(inimigo.pose == false){
        inimigo.vida = false;
      }
      else{
        inimigo.pose = false;
        jogador.dano = false;
      }
    }

    if(inimigo.pose == true){
      inimigo.pose = false;
    }

    if(jogador.pose == true){
      jogador.pose = false;
    }

    //ganhar
    if(jogador.vida == true){
      if(inimigo.vida == false){
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => const WalkPage(),
          )
        );
      }
    }

    //perder
    if(jogador.vida == false){
      Navigator.push(
         context, MaterialPageRoute(
         builder: (context) => const OverPage(),
         )
       );
    }
  }
}


//BENEFICIOS DE CADA MÁSCARA

class Urso extends Jogador{
  Urso(super.pose, super.vida, super.dano, super.carga);
}

class Lobo extends Jogador{
  Lobo(super.pose, super.vida, super.dano, super.carga);
}

class Raposa extends Jogador{
  Raposa(super.dano, super.pose, super.vida, super.carga);
}
