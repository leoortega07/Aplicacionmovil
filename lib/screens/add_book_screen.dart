import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../services/book_service.dart';
import '../models/book.dart';

class AddBookScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Libro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Contenido',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final id = Uuid().v4();
                final book = Book(
                  id: id,
                  title: _titleController.text.trim(),
                  content: _contentController.text.trim(),
                );
                await Provider.of<BookService>(context, listen: false).addBook(book);
                Navigator.pop(context);
              },
              child: Text('Agregar Libro'),
            ),
          ],
        ),
      ),
    );
  }
}
