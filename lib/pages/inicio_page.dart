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
 
  late Map<String,int> sec;
  late int? real = sec['Mask'];
  late int deepnes = sec['Deep'] ?? 0;
  late int prox = deepnes + 1;
  String resultado = 'você e a figura estranha se encaram';
  int logica = (Random().nextInt(2)+1);
  int typeIni = (Random().nextInt(3)+1);
  late Jogador inimigo = inicializadorE(typeIni);
  late Jogador jogador = inicializadorJ(real);

  readNumberFormat(){
    sec = context.watch<AppSetings>().locale;
  }

  aprofundar(){
    context.read<AppSetings>().setDeep(prox);
  }

  //State Machine para definir comportamento do inimigo a cada turno
  inimigoIA(int logica, Jogador inimigo){
    
    // if para escolher 1/3 entre todas as opções de ação do inimigo
    if(inimigo.carga != 0){
      logica = (Random().nextInt(3)+1);
      if(logica == 1){
        inimigo.atacando();
      }
      if(logica == 2){
        inimigo.carregar();
      }
      else{
        inimigo.defender();
      }
    }

    // else pra caso o inimigo não tenha carga nenhuma e tenha que escolher 50/50 entre carregar ou proteguer
    else{
      logica = (Random().nextInt(2)+1);
      if(logica == 1){
        inimigo.carregar();
      }
      else{
        inimigo.defender();
      }
    }
  }


  void texto(Jogador a, Jogador b){
      if(a.carga == 0){
        resultado = 'Sem pedras para atacar';
      }
      if(a.dano == true){
        if(b.pose == true){
          resultado = 'Sua pedra some na escuridão \n A figura estranha se mantem na sua frente';
        }
      }
      if(a.pose == true){
        if(b.dano == true){
          resultado = ' Seu instinto de se proteguer bloqueia um ataque preciso. \n sua máscara é preservada por mais um turno.';
        }
        resultado = 'você se protegue mas nada acontece...';
      }
      else{
        resultado = 'O silêncio de ambos aumenta a tensão...';
      }
  }
  
  Jogador inicializadorJ(int? a){
    if(real == 1){
      return Raposa(false, true, false, 0);
    }
    if(real == 2){
      return Lobo(false, true, false, 1);
    }
    else{
      return Urso(false, true, false, 0);
    }
  }

  Jogador inicializadorE(int a){
    if(typeIni == 1){
      return Raposa(false, true, false, 0);
    }
    if(typeIni == 2){
      return Lobo(false, true, false, 1);
    }
    else{
      return Urso(false, true, false, 0);
    }
  }


  @override
  Widget build(BuildContext context) { 
    readNumberFormat();
    jogador = inicializadorJ(real);
    inimigo = inicializadorE(typeIni);
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
        Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
         centerTitle: true,
         backgroundColor: Colors.black54,
         toolbarHeight: 80,
         title: Text('Profundidade : $deepnes', style: const TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Color.fromARGB(255, 219, 178, 27),)),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Center(
               child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 250),
                child: Text(resultado,
                textAlign: TextAlign.center, 
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Silkscreen',
                  color: Colors.white70,
                  )
                ),
               ),
              ),
        
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
        
               children: [
                 GestureDetector(
                    onTap: (){
                      if(jogador.carga == 0){
                      }
                      else{
                        jogador.atacando();
                        inimigoIA(logica, inimigo);
                        if(jogador.dano == true){
                          if(inimigo.pose == false){
                            if(inimigo.dano == false){
                              aprofundar();
                           }
                          }
                         }
                        jogador.turno( inimigo, jogador, context);
                      }
                    },
                    child: SizedBox(
                      height: 190,
                      child: Image.asset('assets/atacar.png'),
                    ),
                  ),
        
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: GestureDetector(
                    onTap: (){
                        jogador.carregar();      
                        inimigoIA(logica, inimigo);
                        jogador.turno(inimigo, jogador, context);
                        texto(jogador, inimigo);
                    },
                    child: SizedBox(
                      height: 190,
                      child: Image.asset('assets/carregar.png'),
                    ),
                  ),
                ),
                 GestureDetector(
                    onTap: (){
                      jogador.defender();
                      inimigoIA(logica, inimigo);
                      jogador.turno(inimigo, jogador, context);
                    },
                    child: SizedBox(
                      height: 190,
                      child: Image.asset('assets/defender.png'),
                    ),
                  ),
               ],
            )
          ],
        )
      ),
    );
  }
}