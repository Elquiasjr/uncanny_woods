// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:uncanny_woods/pages/inicio_page.dart';
import 'package:uncanny_woods/pages/profiel_page.dart';
import 'selecion_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
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

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const InicioPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24
                        ), 
                        child: Text(
                          'Adentrar FLoresta'
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height:40,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: ()  {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => const SelectPage(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/mascaras_icone.png'),
                        ),
                      ),
                      

                       Container(width: 47,),



                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: Image.asset('assets/perfil_icone.png'),),
                      ),

                        Container(width: 47,),


                      GestureDetector(
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