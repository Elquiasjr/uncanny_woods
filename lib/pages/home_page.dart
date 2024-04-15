// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:uncanny_woods/pages/inicio_page.dart';
import 'package:uncanny_woods/pages/user_info_page.dart';
import 'selecion_page.dart';

import 'package:google_fonts/google_fonts.dart';

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
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InicioPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(57, 253, 253, 253),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: Text(
                            'Adentrar Floresta',
                            style: GoogleFonts.silkscreen(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SelectPage(),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 90,
                              height: 90,
                              child: Image.asset('assets/mascaras_icone.png'),
                            ),
                          ),

                          //  Container(width: 47,),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserInfoPage(),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 75,
                              height: 75,
                              child: Image.asset('assets/perfil_icone.png'),
                            ),
                          ),

                          // Container(width: 47,),

                          GestureDetector(
                            child: SizedBox(
                              width: 90,
                              height: 90,
                              child: Image.asset('assets/bolsa_icone.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      );
}
