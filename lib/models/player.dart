class Jogador{
  bool pose = false; // pose == false significa não estar defendendo, pose == true significa estar defendendo 
  bool vida = true;  // variavel para definir se tomou dano ou não naquele turno
  bool dano = false;
  int carga = 0; // variavel para definir se infringiu dano naquele turn

  Jogador(this.pose, this.vida, this.dano, this.carga);

  //FUNÇÕES DO JOGADOR

  //função para carregar ataque
  int carregar(int carga){
    return carga ++;
  }

  //função para de defender
  void defender(){
    pose = true;
  }

  //função para definir se o usuario tomara ou não dano
  void tomarDano(bool ataque){
    if (pose == false){
      vida = false;
    }
    else{
      return;
    }
  }

  //função para atacar caso tenha carga
  bool atacar(int carga){
    if(carga > 0){
     dano = true;
     return dano;
    }
    else{
      dano = false;
      return dano;
    }
  }
}


//BENEFICIOS DE CADA MÁSCARA

class Urso extends Jogador{
  Urso(super.pose, super.vida, super.dano, super.carga);

  @override
  void tomarDano(bool ataque) {
    if (pose == false){
      if(dano == false){
        vida = false;
      }
    }
    else{
      return;
    }
  }

}

class Lobo extends Jogador{
  Lobo(super.pose, super.vida, super.dano, super.carga);
}

class Raposa extends Jogador{
  Raposa(super.dano, super.pose, super.vida, super.carga);
}
