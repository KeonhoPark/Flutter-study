import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miso_starbucks/miso/miso.dart';

class MisoThirdPage extends StatelessWidget {
  const MisoThirdPage({Key? key}) : super(key: key);

  final String bgImgUrl =
      'https://i.ibb.co/rxzkRTD/146201680-e1b73b36-aa1e-4c2e-8a3a-974c2e06fa9d.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: misoPrimaryColor,
        body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Image.network(bgImgUrl),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 64),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 28,
                              height: 1.5,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(text: "친구 추천할 때마다\n"),
                              TextSpan(
                                  text: '10000원 ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(text: "할인 쿠폰 지급!"),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 64),
                        child: GestureDetector(
                          onTap: () => print("자세히 보기 클릭 됨"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "자세히 보기",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 42,
                    child: GestureDetector(
                      onTap: () => print("친구 추천하기 클릭 됨"),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(64),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(0, 5),
                                spreadRadius: 1,
                                blurRadius: 12,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.redeem,
                                color: misoPrimaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "친구 추천하기",
                                style: TextStyle(
                                  color: misoPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
