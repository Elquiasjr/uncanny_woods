import 'package:flutter/material.dart';
import 'package:uncanny_woods/configs/app_settings.dart';
import 'package:uncanny_woods/pages/acess_page.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSetings()), 
        ChangeNotifierProvider(create: (context) => UserRepository()),
      ],
      child: const MeuAplicativo(),
    ),
  );
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncanny_Woods',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const AcessPage(),
    );
  }
}
