import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService({this.userPhoneNumber});
  final userPhoneNumber;
  final instance = FirebaseFirestore.instance;
  Future<void> addDocumentToCollection({
    required String path,
    required dynamic data,
  }) async {
    final CollectionReference reference = instance.collection(path);
    print('Setting Document $path:$data');
    await reference.add(data).catchError((e) => print('Error is $e'));
  }

  Future<void> updateDocument({
    required String path,
    required dynamic data,
  }) async {
    final DocumentReference reference = instance.doc(path);

    print('Setting Document $path:$data');
    await reference.set(data, SetOptions(merge: true));
  }

  Future<void> deleteDocument({required String path}) async {
    print('Document deleted at path $path');
    await instance.doc(path).delete();
  }

  Stream<List<T>> collectionStream<T>(
      {required
          String path,
      required
          T builder(Map<String, dynamic>? data, String documentId, String path),
      Query queryBuilder(Query query)?}) {
    Query query = instance.collection(path);
    if (queryBuilder != null) query = queryBuilder(query);
    Query query2 = instance.collection(path);
    query2.where('state', isEqualTo: 'inactive');
    // query2.snapshots().pipe((streamConsumer.)
    return query.snapshots().map((snapshot) {
      final result = snapshot.docs
          .map((document) => builder(document.data(), document.id, path))
          .toList();
      return result;
    });
  }

  Stream<List<T>> collectionGroupStream<T>(
      {required
          String path,
      required
          T builder(Map<String, dynamic>? data, String documentId,
              String documentPath),
      Query queryBuilder(Query query)?}) {
    Query query = instance.collectionGroup(path);
    if (queryBuilder != null) query = queryBuilder(query);
    Query query2 = instance.collection(path);
    query2.where('state', isEqualTo: 'inactive');
    // query2.snapshots().pipe((streamConsumer.)
    // print('query = ${query.}');
    return query.snapshots().map((snapshot) {
      print('snapshot = ${snapshot.docs.map((x) => print(x))}');
      final result = snapshot.docs
          .map((document) =>
              builder(document.data(), document.id, document.reference.path))
          .toList();
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
  }) {
    final DocumentReference reference = instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    print('fetching doc');
    print(path);
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
}
