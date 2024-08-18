import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/book_service.dart';
import '../models/book.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Book> _results = [];
  final _searchController = TextEditingController();

  void _searchBooks() async {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      final books = await Provider.of<BookService>(context, listen: false).searchBooks(query);
      setState(() {
        _results = books;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Libros'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchBooks,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final book = _results[index];
                return ListTile(
                  title: Text(book.title),
                  onTap: () {
                    // Acción para leer el libro
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
