import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/fundo_mascara.png'
        ),
          fit: BoxFit.cover,
      ),
    ),
    child:  Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Color.fromARGB(255, 219, 178, 27)),
        backgroundColor: Colors.black54,
        title: const Text('Profile', style: TextStyle(fontSize: 20,fontFamily: 'Silkscreen',color: Colors.white70,)),
      ),
      backgroundColor: Colors.transparent,
    ),
  );
}