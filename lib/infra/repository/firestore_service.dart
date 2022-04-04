import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

// Add
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    print('[addData] $path: $data');
    await reference.add(data);
  }

  // Update
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('[updateData] $path: $data');
    await reference.update(data);
  }

// Set
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('[setData] $path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

// Delete
  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }

// Get Stream collection
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

// Get stream document
  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  // Get document
  Future<DocumentSnapshot<Map<String, dynamic>>> documentSnapshot({
    required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final doc = await reference.get();
    return doc;
  }
}
