import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lend_buddy/collections/user.dart';
import 'package:lend_buddy/main.dart';
import 'package:lend_buddy/screens/home_screen.dart';
import 'package:lend_buddy/screens/login_screen.dart';
import 'package:lend_buddy/services/isar_helper.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  final db = IsarHelper();

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  int _idUser = 0;

  String? _email = '';
  String? _password = '';
  String? _password2 = '';
  bool _isSecret = true;
  bool _isSecret2 = true;
  String? _name = '';
  String? _surname = '';

  _saveUser() async {
    User user = User()
      ..mail = _email
      ..pass = _password
      ..name = _name
      ..surname = _surname;
    int tmpId = await widget.db.saveUser(user);
    setState(() {
      _idUser = tmpId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final password = _password;
    final password2 = _password2;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Lend Buddy'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Create Account'),
              const SizedBox(height: 10.0),
              const Text('Create your account Lend Buddy'),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => _email = value),
                    validator: (value) =>
                        value!.isEmpty || !emailRegex.hasMatch(value)
                            ? 'Please enter a valid email'
                            : null,
                    decoration: InputDecoration(
                        hintText: 'Ex: michel.renard@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => _password = value),
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter a password. 6 caracters min required.'
                        : null,
                    obscureText: _isSecret,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => setState(() => _isSecret = !_isSecret),
                          child: Icon(
                            !_isSecret
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => _password2 = value),
                    validator: (value) =>
                        value == _password ? 'Incorrect password.' : null,
                    obscureText: _isSecret2,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => setState(() => _isSecret2 = !_isSecret2),
                          child: Icon(
                            !_isSecret2
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => _name = value),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => _surname = value),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a surname' : null,
                    decoration: InputDecoration(
                        hintText: 'Surname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                      onPressed: !emailRegex.hasMatch(_email!) ||
                              password != null && password.length < 6 ||
                              _password != _password2
                          ? null
                          : () async {
                              await _saveUser();
                              if (_idUser > 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(
                                              userId: _idUser,
                                            )));
                              }
                            },
                      child: const Text('Create Account')),
                ],
              )),
              const SizedBox(height: 100.0),
              const Text("Have account ?"),
              const SizedBox(height: 5.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    ));
  }
}
