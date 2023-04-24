import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                    width: 81,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'email'),
                  style: TextStyle(fontSize: 24),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'password'),
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
