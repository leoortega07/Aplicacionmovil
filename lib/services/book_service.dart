import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book.dart';

class BookService {
  final CollectionReference bookCollection = FirebaseFirestore.instance.collection('books');

  Future<void> addBook(Book book) async {
    return await bookCollection.doc(book.id).set(book.toJson());
  }

  Future<List<Book>> searchBooks(String query) async {
    QuerySnapshot snapshot = await bookCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .get();
    return snapshot.docs.map((doc) => Book.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<List<Book>> getFavoriteBooks() async {
    QuerySnapshot snapshot = await bookCollection
        .where('isFavorite', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => Book.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}

