
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uncanny_woods/pages/backpack_page.dart';
import 'package:uncanny_woods/pages/user_info_page.dart';
import 'package:uncanny_woods/pages/walk_florest.dart';
import 'selecion_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  
  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Menu1.png'),
         
          fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
           Center(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  GestureDetector(
                    onTap: () =>
                      Navigator.push(
                        context,
                         PageTransition(
                          child:  const WalkPage(),
                          type: PageTransitionType.fade,
                          ),
                      ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                            '* Adentrar Floresta *',
                            style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Silkscreen',
                                  color: Color.fromARGB(255, 219, 178, 27),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height:40,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: ()  {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) =>const SelectPage(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/mascaras_icone.png'),
                        ),
                      ),


                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => const UserInfoPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                          child: SizedBox(
                            width: 75,
                            height: 75,
                            child: Image.asset('assets/perfil_icone.png'),),
                        ),
                      ),


                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) =>  BackpackPage(),
                            ),
                          );
                        },
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
          ),
        ),
      )
    )
  );
}
