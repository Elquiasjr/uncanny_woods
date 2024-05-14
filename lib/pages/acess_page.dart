import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/pages/register_page.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';
import 'package:uncanny_woods/services/auth_service.dart';

class AcessPage extends StatefulWidget {
  const AcessPage({super.key});

  @override
  AcessPageState createState() => AcessPageState();
}

class AcessPageState extends State<AcessPage> {
  late UserRepository instance;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    try {
      await context
          .read<AuthService>()
          .login(_emailController.text, _passwordController.text);
    } on AuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
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
          toolbarHeight: 100,
          title: const Center(
            child: Text(
              'Uncanny Woods',
              style: TextStyle(
                  color: Color.fromARGB(255, 219, 178, 27),
                  fontSize: 30.0,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10.0), // Add this
                      ),
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: const Text(
                        'Bem-vindo!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontFamily: 'silkscreen',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20.0,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20.0,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20.0,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  login();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black54),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20.0,
                                      fontFamily: 'silkscreen'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black54),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20.0,
                                      fontFamily: 'silkscreen'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
