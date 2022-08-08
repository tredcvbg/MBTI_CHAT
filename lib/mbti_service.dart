import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MbtiService extends ChangeNotifier {
  final MbtiCollection = FirebaseFirestore.instance.collection('users-mbti');

  Future<QuerySnapshot> read(String uid) async {
    // mbtiList 가져오기
    return MbtiCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String mbti, String uid) async {
    if (mbti == 'ESTJ-T') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESTJ-T", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ESTJ-A') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESTJ-A", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ESTP-T') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESTP-T", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ESTP-A') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESTP-A", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ISTJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ISTJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ISTP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ISTP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ISFJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ISFJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ISFP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ISFP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ESFP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESFP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ESFJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ESFJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'INFJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "INFJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'INFP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "INFP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ENFP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ENFP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ENFJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ENFJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'INTJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "INTJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'INTP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "INTP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ENTP') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ENTP", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    } else if (mbti == 'ENTJ') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mbti': "ENTJ", // mbti
        'isDone': false, // 고유 식별자
      });
      notifyListeners(); // 화면 갱신
      // user 정보 만들기
    }
  }

  void update(String docId, bool isDone) async {
    // user 정보 업데이트
  }

  void delete(String docId) async {
    await MbtiCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
    // user 정보 삭제
  }
}
