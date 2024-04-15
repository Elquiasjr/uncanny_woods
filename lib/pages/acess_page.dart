import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/pages/home_page.dart';
import 'package:uncanny_woods/pages/register_page.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';

class AcessPage extends StatefulWidget {
  const AcessPage({super.key});

  @override
  AcessPageState createState() => AcessPageState();
}

class AcessPageState extends State<AcessPage> {
  late UserRepository instance;

  Widget buildDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Profiles registered'),
      children: [
        for (var user in instance.users)
          SimpleDialogOption(
            child: Row(
              children: [
                const Icon(Icons.account_circle, size: 36.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user.username),
                ),
              ],
            ),
            onPressed: () {
              instance.setLoggedUser(user);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        SimpleDialogOption(
          child: const Row(
            children: [
              Icon(Icons.add_circle, size: 36.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Add new profile'),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    instance = context.watch<UserRepository>();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fundo_mascara.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Login Page',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                  fontFamily: 'silkscreen'),
            ),
          ),
          backgroundColor: Colors.black54,
          iconTheme: const IconThemeData(color: Colors.black54),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return buildDialog(context);
                        },
                      );
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
