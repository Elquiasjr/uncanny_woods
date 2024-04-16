import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncanny_woods/models/user.dart';
import 'package:uncanny_woods/repositories/user_repository.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();

  late UserRepository instance;
  late User loggedUser;

  @override
  void initState() {
    super.initState();
    instance = Provider.of<UserRepository>(context, listen: false);
    loggedUser = instance.getLoggedUser();
    _nameController.text = loggedUser.username;
    _emailController.text = loggedUser.email;
    _dateController.text = loggedUser.dateOfBirth.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'User Information',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                fontFamily: 'silkscreen'),
          ),
          backgroundColor: Colors.black54,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 219, 178, 27)),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white70),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white70),
                        fillColor: Colors.indigo,
                      ),
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
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white70),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white70),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        const pattern =
                            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                        final regex = RegExp(pattern);

                        return value!.isEmpty || !regex.hasMatch(value)
                            ? 'Enter a valid email address'
                            : null;
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
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white70),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(color: Colors.white70),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: loggedUser.dateOfBirth.toLocal(),
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
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          User updateUser = User(
                            username: _nameController.text,
                            email: _emailController.text,
                            dateOfBirth: DateTime.parse(_dateController.text),
                            senha: loggedUser.senha,
                          );
                          instance.updateUser(updateUser, loggedUser.username,
                              loggedUser.email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('User info updated')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black54),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Silkscreen',
                          color: Color.fromARGB(255, 219, 178, 27),
                        ),
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
}
