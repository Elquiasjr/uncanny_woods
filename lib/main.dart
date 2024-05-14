import 'package:flutter/material.dart';
import 'package:uncanny_woods/configs/app_settings.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uncanny_woods/services/auth_service.dart';
import 'package:uncanny_woods/widgets/auth_check.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => AppSetings()),
        ChangeNotifierProvider(create: (context) => UserRepository(
              auth: context.read<AuthService>(),
        )),
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
      home: const AuthCheck(),
    );
  }
}
