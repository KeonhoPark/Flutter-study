import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miso_starbucks/miso/miso.dart';

class MisoFirstPage extends StatelessWidget {
  const MisoFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: misoPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    "대한민국 1등 홈서비스\n" "미소를 만나보세요!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () => print("예약하기 버튼 클릭 됨"),
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(64),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 23),
                          child: Icon(
                            Icons.add,
                            color: misoPrimaryColor,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 23),
                          child: Text(
                            "예약하기",
                            style: TextStyle(
                              color: misoPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () => print("서비스 상세정보 클릭 됨"),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "서비스 상세정보",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
