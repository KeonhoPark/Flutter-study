import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BucketService extends ChangeNotifier {
  final bucketCollection = FirebaseFirestore.instance.collection('bucket');

  void create(String job, String uid) async {
    await bucketCollection.add({
      'uid': uid,
      'job': job,
      'isDone': false,
    });
    notifyListeners();
  }

  Future<QuerySnapshot> read(String uid) async {
    // 내 버킷리스트 가져오기
    return bucketCollection.where('uid', isEqualTo: uid).get();
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
    await bucketCollection.doc(docId).update({'isDone': isDone});
    notifyListeners();
  }

  void delete(String docId) async {
    // bucket 삭제
    await bucketCollection.doc(docId).delete();
    notifyListeners();
  }
}
