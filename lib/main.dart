import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lend_buddy/screens/home_screen.dart';
import 'package:lend_buddy/screens/createaccount_screen.dart';
import 'package:lend_buddy/screens/login_screen.dart';
import 'package:lend_buddy/services/isar_helper.dart';

//import side menu
import 'package:lend_buddy/widgets/navdrawer.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //TODO LA CONNEXION DOIT SET L ID USER
  final idUser = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lend Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(userId: idUser,)
      home: const MyHomePage(title: 'Lend Buddy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text('Login')),
            const SizedBox(height: 10.0),
            Text('or'.toUpperCase()),
            const SizedBox(height: 10.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountScreen()));
                },
                child: const Text('Create Account')),
          ],
        ),
      ),
    );
  }
}
