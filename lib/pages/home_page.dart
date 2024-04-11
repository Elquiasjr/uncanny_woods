import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  alert(String msg){
    // ignore: avoid_print
    print('clicado');
  }
  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/Menu1.png'
        ),
          fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => alert('c'),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/mascaras_icone.png'),
                        ),
                      ),
                      Container(width: 47,),

                      GestureDetector(
                        onTap: () => alert('a'),
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: Image.asset('assets/perfil_icone.png'),),
                      ),

                      Container(width: 47,),

                      GestureDetector(
                        onTap: () => alert('b'),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/bolsa_icone.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ); 
    
  
}