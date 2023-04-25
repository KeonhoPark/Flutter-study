// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Food Recipe",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  print("go to mypage");
                },
                icon: Icon(
                  Icons.person_outline,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "상품을 입력해주세요.",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  print("search");
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
