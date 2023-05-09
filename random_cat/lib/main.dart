import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //main() 에서 async 쓰려면 필요
  WidgetsFlutterBinding.ensureInitialized();

  //shared_preferences 인스턴스 생성
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CatService(prefs)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// 고양이 서비스
class CatService extends ChangeNotifier {
  // 고양이 사진 담을 변수
  List<String> catImages = [];

  //좋아요 사진
  List<String> favoriteImages = [];

  //SharedPreferences 인스턴스
  SharedPreferences prefs;

  CatService(this.prefs) {
    getRandomCatImages();

    // favorites로 저장된 favoriteImages를 가져오기
    // 저장된 favorites가 없을경우 null이 반환되므로 그때는 빈 배열을 할당함.
    favoriteImages = prefs.getStringList("favorites") ?? [];
  }

  // 랜덤 고양이 사진 API 호출
  void getRandomCatImages() async {
    Response result = await Dio().get(
        "https://api.thecatapi.com/v1/images/search?limit=10&mime_types=jpg");

    for (var i = 0; i < result.data.length; i++) {
      var map = result.data[i];
      catImages.add(map['url']);
    }
    notifyListeners();
  }

  //이미 좋아요 표시되어 있으면 리스트에서 제거, 좋아요 리스트에 없으면 추가
  void toggleFavoriteImage(String catImage) {
    if (favoriteImages.contains(catImage)) {
      favoriteImages.remove(catImage);
    } else {
      favoriteImages.add(catImage);
    }

    // favoriteImages를 favorites라는 이름으로 저장하기
    prefs.setStringList("favorites", favoriteImages);

    //새로고침
    notifyListeners();
  }
}

/// 홈 페이지
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CatService>(
      builder: (context, catService, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("랜덤 고양이"),
            backgroundColor: Colors.amber,
            actions: [
              // 좋아요 페이지로 이동
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                },
              )
            ],
          ),
          // 고양이 사진 목록
          body: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            crossAxisCount: 2,
            children: List.generate(
              catService.catImages.length,
              (index) {
                String catImage = catService.catImages[index];

                return GestureDetector(
                  onTap: () {
                    catService.toggleFavoriteImage(catImage);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          catImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Icon(
                          Icons.favorite,
                          color: catService.favoriteImages.contains(catImage)
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

/// 좋아요 페이지
class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CatService>(
      builder: (context, catService, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("좋아요"),
            backgroundColor: Colors.amber,
          ),
          body: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.all(8),
            crossAxisCount: 2,
            children: List.generate(
              catService.favoriteImages.length,
              (index) {
                String catImage = catService.favoriteImages[index];

                return GestureDetector(
                  onTap: () {
                    catService.toggleFavoriteImage(catImage);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          catImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Icon(
                          Icons.favorite,
                          color: catService.favoriteImages.contains(catImage)
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
