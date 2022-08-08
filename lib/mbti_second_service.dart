import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MbtiSecondService extends ChangeNotifier {
  final MbtiCollection = FirebaseFirestore.instance.collection('users-mydata');

  Future<QuerySnapshot> read(String uid) async {
    // mbtiList 가져오기
    return MbtiCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String mydata, String uid) async {
    if (mydata == '눈치 많이 봄') {
      await MbtiCollection.add({
        'uid': uid, // 유저 식별자
        'mydata': "눈치 많이 봄", // 나의 성향
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
