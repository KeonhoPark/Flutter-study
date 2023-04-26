// import 'dart:html';

import 'package:flutter/cupertino.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> menu = ['구매내역', '저장한 레시피'];

    final List<String> bannerImages = [
      "https://i.ibb.co/Q97cmkg/sale-event-banner1.jpg",
      "https://i.ibb.co/GV78j68/sale-event-banner2.jpg",
      "https://i.ibb.co/R3P3RHw/sale-event-banner3.jpg",
      "https://i.ibb.co/LRb1VYs/sale-event-banner4.jpg"
    ];

    List<Map<String, dynamic>> foodData = [
      {"category": "수제버거", "imgUrl": "https://i.ibb.co/VtK43vv/burger.jpg"},
      {
        "category": "건강식",
        "imgUrl": "https://i.ibb.co/2KbN5pV/soup.jpg",
      },
      {
        "category": "한식",
        "imgUrl": "https://i.ibb.co/KXJD0rN/korean-meals.jpg",
      },
      {
        "category": "디저트",
        "imgUrl": "https://i.ibb.co/9Yn3t0w/tiramisu.jpg",
      },
      {
        "category": "피자",
        "imgUrl": "https://i.ibb.co/P9nKtt2/pizza.jpg",
      },
      {
        "category": "볶음밥",
        "imgUrl": "https://i.ibb.co/3svVzM1/shakshuka.jpg",
      },
    ];

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
          body: Column(
            children: [
              Padding(
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
              Expanded(
                  child: ListView.builder(
                      itemCount: foodData.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = foodData[index];
                        String category = data["category"];
                        dynamic imgUrl = data["imgUrl"];

                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network(
                                imgUrl,
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 120,
                                color: Colors.black.withOpacity(0.5),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }))
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 36,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                                width: 40,
                              ),
                            ),
                          ),
                          Text(
                            "닉네임",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "hello@world.com",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                AspectRatio(
                    aspectRatio: 12 / 4,
                    child: PageView.builder(
                      itemCount: bannerImages.length,
                      itemBuilder: (context, index) {
                        String bannerImage = bannerImages[index];
                        return Image.network(bannerImage);
                      },
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    String m = menu[index];
                    print(m);
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            m,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              print(m);
                            },
                            icon: Icon(
                              CupertinoIcons.arrow_right,
                              color: Colors.black,
                            ))
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
