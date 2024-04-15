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
    loggedUser = instance.users[0];
    _nameController.text = loggedUser.username;
    _emailController.text = loggedUser.email;
    _dateController.text = loggedUser.dateOfBirth.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date of Birth',
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
                  _dateController.text = "${picked.toLocal()}".split(' ')[0];
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  User updateUser = User(
                    username: _nameController.text,
                    email: _emailController.text,
                    dateOfBirth: DateTime.parse(_dateController.text),
                    senha: loggedUser.senha,
                  );
                  instance.updateUser(
                      updateUser, loggedUser.username, loggedUser.email);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User info updated')),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
