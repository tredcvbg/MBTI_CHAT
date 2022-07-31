import 'dart:developer';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbti_profile/Homepage.dart';
import 'package:mbti_profile/config/palette.dart';
import 'package:mbti_profile/config/font.dart';
import 'package:mbti_profile/main.dart';
import 'package:mbti_profile/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_svg/svg.dart';

class Online {
  String online;
  bool isOnline;

  Online(this.online, this.isOnline);
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int isProfileSelected = 1;
  @override
  Widget build(BuildContext context) {
    UserProvider userPvd = context.watch<UserProvider>();
    // return Consumer<ProfileService>(builder: (context, profileService, child) {
    return Consumer<UserProvider>(
      builder: (context, myMbtim, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Palette.scaffoldbackColor,
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            shape: Border(
              bottom: BorderSide(color: Palette.sizedBoxColor),
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 24),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('image/user_image.png'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 35, left: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  '24시간잘래',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Noto_Sans_KR'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 40, left: 9),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(360),
                                  image: DecorationImage(
                                    image: AssetImage('image/user_status.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12, left: 16),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Palette.prupleColorback,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'ESFP-T',
                              style: TextStyle(
                                  color: Palette.purpleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Palette.purpleColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: EdgeInsets.only(top: 24, right: 24),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProfileModify(),
                            //   ),
                            // );
                          },
                          icon: SvgPicture.asset(
                            'image/chatting.svg',
                            color: Colors.white,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.check),
                          Text('MBTI는 이래요', style: TextSelect.textNoto14R),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.only(left: 16, top: 13, bottom: 13),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Palette.explanationBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            '주목받는 것을 즐기고 사람과의 만남을 좋아해요',
                            style: TextSelect.textNoto14M,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.only(left: 16, top: 13, bottom: 13),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Palette.explanationBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            '마감일이 거의 다 되었을 때 준비하는 스타일',
                            style: TextSelect.textNoto14M,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.only(left: 16, top: 13, bottom: 13),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Palette.explanationBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            '미래의 나에게 맡기는 즉흥적인 소비러',
                            style: TextSelect.textNoto14M,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Palette.sizedBoxColor,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isProfileSelected = 1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      '자기소개',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Noto_Sans_KR',
                                        fontWeight: FontWeight.bold,
                                        color: isProfileSelected == 1
                                            ? Palette.purpleColor
                                            : Palette.notCompletion,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      height: 2,
                                      width: 51,
                                      color: isProfileSelected == 1
                                          ? Palette.purpleColor
                                          : Palette.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isProfileSelected = 2;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      '궁합점수',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Noto_Sans_KR',
                                        fontWeight: FontWeight.bold,
                                        color: isProfileSelected == 2
                                            ? Palette.purpleColor
                                            : Palette.notCompletion,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      height: 2,
                                      width: 51,
                                      color: isProfileSelected == 2
                                          ? Palette.purpleColor
                                          : Palette.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isProfileSelected = 3;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      '팩폭체크',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Noto_Sans_KR',
                                        fontWeight: FontWeight.bold,
                                        color: isProfileSelected == 3
                                            ? Palette.purpleColor
                                            : Palette.notCompletion,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      height: 2,
                                      width: 51,
                                      color: isProfileSelected == 3
                                          ? Palette.purpleColor
                                          : Palette.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isProfileSelected = 4;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      '이상형',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Noto_Sans_KR',
                                        fontWeight: FontWeight.bold,
                                        color: isProfileSelected == 4
                                            ? Palette.purpleColor
                                            : Palette.notCompletion,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      height: 2,
                                      width: 51,
                                      color: isProfileSelected == 4
                                          ? Palette.purpleColor
                                          : Palette.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  if (isProfileSelected == 1)
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                      width: double.infinity,
                      height: 308,
                      decoration: BoxDecoration(
                        color: Palette.introductionBackColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Container(
                        height: 308,
                        margin: EdgeInsets.only(
                            top: 32, bottom: 32, left: 24, right: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('안녕! 나는 ',
                                      style: TextSelect.textNoto20Bpro),
                                  Text('잠만보',
                                      style: TextSelect.textNoto20BPurple),
                                  Text('야.', style: TextSelect.textNoto20Bpro),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('우리 동네  ',
                                      style: TextSelect.textNoto20Bpro),
                                  Text('스타벅스를',
                                      style: TextSelect.textNoto20BPurple),
                                  Text('자주 가.',
                                      style: TextSelect.textNoto20Bpro),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('제일 좋아하는 음식은 ',
                                      style: TextSelect.textNoto20Bpro),
                                  Text('치킨',
                                      style: TextSelect.textNoto20BPurple),
                                  Text('이고,', style: TextSelect.textNoto20Bpro),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('제일 좋아하는 음악은',
                                  style: TextSelect.textNoto20Bpro),
                              SizedBox(height: 8),
                              Text('비도 오고 그래서야',
                                  style: TextSelect.textNoto20BPurple),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('취미는 ',
                                      style: TextSelect.textNoto20Bpro),
                                  Text('음악 감상, 등산',
                                      style: TextSelect.textNoto20BPurple),
                                  Text('야.', style: TextSelect.textNoto20Bpro),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('나랑 친해지고 싶으면',
                                  style: TextSelect.textNoto20Bpro),
                              SizedBox(height: 8),
                              Text('유머코드가 맞아야해',
                                  style: TextSelect.textNoto20BPurple),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (isProfileSelected == 2)
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Palette.introductionBackColor,
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(16.0),
                    //     ),
                    //   ),
                    //   margin: EdgeInsets.only(
                    //       top: 22, left: 24, right: 24, bottom: 32),
                    //   height: 254,
                    //   width: double.infinity,
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    Column(
                      children: [
                        SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                                centerX: 0.5,
                                centerY: 0.4,
                                startAngle: 270,
                                endAngle: 270,
                                interval: 10,
                                showLabels: false,
                                showTicks: false,
                                minimum: 0,
                                maximum: 100,
                                radiusFactor: 0.5,
                                axisLineStyle: const AxisLineStyle(
                                    cornerStyle: CornerStyle.bothCurve,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                    thickness: 0.1),
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    angle: 100,
                                    widget: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            '98점',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Palette.purpleColor,
                                              letterSpacing: -2,
                                              fontFamily: 'Noto_Sans_KR',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GaugeAnnotation(
                                    angle: 90,
                                    positionFactor: 1.5,
                                    widget: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          child: Text('둘은 천생연분',
                                              style: TextSelect.textNoto18B),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                pointers: const <GaugePointer>[
                                  RangePointer(
                                      value: 98,
                                      cornerStyle: CornerStyle.bothCurve,
                                      enableAnimation: true,
                                      animationDuration: 1000,
                                      animationType: AnimationType.ease,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      color: Palette.purpleColor,
                                      width: 0.15),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  if (isProfileSelected == 3)
                    Container(
                      padding: EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('남 눈치 많이 봄'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('게으른 완벽주의자'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('배려를 잘함'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('인간관계에 스트레스를 받음'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (isProfileSelected == 4)
                    Container(
                      padding: EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('술자리를 좋아해요'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('도전을 두려워하지 않아요'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 17, bottom: 16),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                child: Text('샤워할 때 꼭 음악을 틀어요'),
                                decoration: BoxDecoration(
                                  color: Palette.backgroundColor,
                                  border: Border.all(
                                    color: Palette.completion,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    UserProvider userPvd = context.watch<UserProvider>();
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.whiteColor,
        title: Text('내 프로필', style: TextSelect.textNoto20Bpro),
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'image/search.svg',
                  width: 18,
                  height: 18,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'image/alert.svg',
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, left: 24),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('image/user_image.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 16),
                      padding: EdgeInsets.symmetric(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        userPvd.username,
                        style: TextStyle(
                            height: 0.1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto_Sans_KR'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, left: 16),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.prupleColorback,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        userPvd.mbti,
                        style: TextStyle(
                            color: Palette.purpleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Palette.purpleColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.only(top: 24, right: 24),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileModify(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'image/edit.svg',
                      color: Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              width: double.infinity,
              height: 8,
              color: Palette.sizedBoxColor,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/location.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "내 동네 설정",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/introduction.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "자기소개",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/checkbox.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "MBTI 팩폭체크",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/heart.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "내 이상형",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  width: double.infinity,
                  height: 8,
                  color: Palette.sizedBoxColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/invitation.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "친구 초대",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/notice.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "공지사항",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/question.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "자주 묻는 질문",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyIntroduction(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 24),
                    width: double.infinity,
                    color: Palette.whiteColor,
                    height: 56,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'image/appsetting.svg',
                          color: Palette.editIcon,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "앱 설정",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: SvgPicture.asset(
                'image/home.svg',
                color: Palette.blackColor,
                width: 20,
                height: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'image/chat.svg',
                color: Palette.blackColor,
                width: 20,
                height: 20,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'image/setting.svg',
                color: Palette.blackColor,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 데이터 전달에 사용할 클래스

class ProfileModify extends StatefulWidget {
  const ProfileModify({Key? key}) : super(key: key);

  @override
  State<ProfileModify> createState() => _ProfileModifyState();
}

class _ProfileModifyState extends State<ProfileModify> {
  TextEditingController myNameController = TextEditingController();
  TextEditingController myMbtiController = TextEditingController();

  String? errorName;
  String? errorMbti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffoldbackColor,
      appBar: AppBar(
        backgroundColor: Palette.scaffoldbackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Palette.blackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Text(
              '완료',
              style: TextSelect.textNoto16Rc,
            ),
            onPressed: () {
              String myName = myNameController.text;
              String myMbti = myMbtiController.text;

              if (myName.isEmpty) {
                setState(() {
                  errorName = "내용을 입력해주세요."; // 내용이 없는 경우 에러 메세지
                });
              } else {
                setState(() {
                  errorName = null; // 내용이 있는 경우 에러 메세지 숨기기
                });
              }
              if (myMbti.isEmpty) {
                setState(() {
                  errorMbti = "내용을 입력해주세요."; // 내용이 없는 경우 에러 메세지
                });
              } else {
                setState(() {
                  errorMbti = null; // 내용이 있는 경우 에러 메세지 숨기기
                });
              }
              if (myMbti.isNotEmpty && myName.isNotEmpty) {
                UserProvider userPvd = context.read<UserProvider>();
                userPvd.editUsername(myName);
                userPvd.editMbti(myMbti);
                Navigator.pop(context);
              }
            },
          )
        ],
        centerTitle: true,
        title: Text(
          '프로필 수정',
          style: TextSelect.textNoto16Mpro,
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 32,
                  bottom: 22,
                ),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('image/user_image.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('닉네임', style: TextSelect.textNoto14M),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Palette.explanationBox,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: myNameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "닉네임을 입력하세요",
                    errorText: errorName,
                    border: InputBorder.none,
                  ),

                  //
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 28,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('MBTI', style: TextSelect.textNoto14M),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Palette.explanationBox,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: myMbtiController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "MBTI를 입력하세요",
                    errorText: errorMbti,
                    border: InputBorder.none,
                  ),

                  //
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyIntroduction extends StatefulWidget {
  const MyIntroduction({Key? key}) : super(key: key);

  @override
  State<MyIntroduction> createState() => _MyIntroductionState();
}

class _MyIntroductionState extends State<MyIntroduction> {
  TextEditingController myNickController = TextEditingController();
  TextEditingController myHauntController = TextEditingController();
  TextEditingController myFoodController = TextEditingController();
  TextEditingController myMusicController = TextEditingController();
  TextEditingController myHobbyController = TextEditingController();
  TextEditingController myConditionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.whiteColor,
        title: Text('자기소개', style: TextSelect.textNoto20Bpro),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              width: double.infinity,
              height: 308,
              decoration: BoxDecoration(
                color: Palette.introductionBackColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: 32, bottom: 32, left: 24, right: 30),
                child: Container(
                  width: 273,
                  height: 244,
                  color: Palette.introductionBackColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('안녕! 나는 ', style: TextSelect.textNoto20Bpro),
                            IntrinsicWidth(
                              child: TextField(
                                controller: myNickController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '닉네임',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text('야.', style: TextSelect.textNoto20Bpro)
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('우리 동네 ', style: TextSelect.textNoto20Bpro),
                            IntrinsicWidth(
                              child: TextField(
                                controller: myHauntController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '장소',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text(' 자주 가.', style: TextSelect.textNoto20Bpro)
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('제일 좋아하는 음식은 ',
                                style: TextSelect.textNoto20Bpro),
                            IntrinsicWidth(
                              child: TextField(
                                controller: myFoodController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '음식',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text('이고,', style: TextSelect.textNoto20Bpro)
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('제일 좋아하는 음악은', style: TextSelect.textNoto20Bpro),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            IntrinsicWidth(
                              child: TextField(
                                controller: myMusicController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '음악',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text('야.', style: TextSelect.textNoto20Bpro)
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('취미는 ', style: TextSelect.textNoto20Bpro),
                            IntrinsicWidth(
                              child: TextField(
                                controller: myHobbyController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '취미',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text('야.', style: TextSelect.textNoto20Bpro)
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('나랑 친해지고 싶으면 ', style: TextSelect.textNoto20Bpro),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            IntrinsicWidth(
                              child: TextField(
                                controller: myConditionController,
                                style: TextSelect.textNoto20BPurple,
                                autofocus: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  border: InputBorder.none,
                                  hintText: '바라는 것',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 39),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Palette.explanationBox,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '수정완료',
                  style: TextStyle(
                    color: Color(0xff505050),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSansKR',
                    letterSpacing: -2,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileService extends ChangeNotifier {
  final profileCollection = FirebaseFirestore.instance.collection('mbti-user');

  Future<QuerySnapshot> read(String uid) async {
    // 내 ProfileList 가져오기
    throw UnimplementedError(); // return 값 미구현 에러
  }

  void create(String nick, String mbti) async {
    // bucket 만들기
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
  }

  void delete(String docId) async {
    // bucket 삭제
  }
}
