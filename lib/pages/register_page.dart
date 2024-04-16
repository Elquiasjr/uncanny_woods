import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/models/user.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late UserRepository instance;

  void register() {
    instance = Provider.of<UserRepository>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      User newUser = User(
        username: _usernameController.text,
        email: _emailController.text,
        dateOfBirth: DateTime.parse(_dateController.text),
        senha: _passwordController.text,
      );

      instance.saveUser(newUser);

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registered successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo_mascara.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'Register',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                  fontFamily: 'silkscreen'),
            ),
            backgroundColor: Colors.black54,
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 219, 178, 27),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white70),
                            fillColor: Colors.indigo),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white70),
                          fillColor: Colors.indigo,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _dateController,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date of Birth',
                          labelStyle: TextStyle(color: Colors.white70),
                          fillColor: Colors.indigo,
                        ),
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2015),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2015),
                          );
                          if (picked != null) {
                            _dateController.text =
                                "${picked.toLocal()}".split(' ')[0];
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white70),
                          fillColor: Colors.indigo,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: register,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.save),
                            Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Silkscreen',
                                    color: Colors.white70,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
