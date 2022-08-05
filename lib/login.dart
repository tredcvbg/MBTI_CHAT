import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';
import 'home_page.dart';
import 'singup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailSinginController = TextEditingController();
  TextEditingController passwordSinginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: 640,
              margin: EdgeInsets.fromLTRB(40, 144, 40, 82),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "환영합니다!",
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 58, bottom: 20),
                    child: TextField(
                      controller: emailSinginController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E8EC)),
                        ),
                        labelText: "이메일을 입력해주세요",
                        labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                        ),
                      ),
                      onSubmitted: (Text) {
                        print("아이디 입력");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: TextField(
                      controller: passwordSinginController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E8EC)),
                        ),
                        labelText: "비밀번호를 입력해주세요",
                        labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                        ),
                      ),
                      onSubmitted: (Text) {
                        print("비밀번호 입력");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff7F84FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          // 로그인
                          authService.signIn(
                            email: emailSinginController.text,
                            password: passwordSinginController.text,
                            onSuccess: () {
                              // 로그인 성공
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("로그인 성공"),
                              ));

                              // HomePage로 이동
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            onError: (err) {
                              // 에러 발생
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(err),
                              ));
                            },
                          );
                        },
                        child: Text(
                          "접속할래요",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(width: 1, color: Color(0xffE5E8EC)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        //회원가입 페이지로 연결
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpFirstPage()),
                        );
                      },
                      child: Text(
                        "처음왔어요",
                        style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
