import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/firebase_options.dart';
import 'package:course_app/src/features/feature_name/data/datasources/remote/books/book_data_sources_impl.dart';
import 'package:course_app/src/features/feature_name/domain/entities/books/book_entity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Crucially important
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Add Book to Firestore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  // final _bookIdController = TextEditingController();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final BookDataSourcesImpl _bookDataSource;

  @override
  void initState() {
    super.initState();
    _bookDataSource = BookDataSourcesImpl(_db);
  }

  void _addBook() async {
    if (_formKey.currentState?.validate() ?? false) {
      final book = BookEntity(
        // bookId: _bookIdController.text,
        title: _titleController.text,
        author: _authorController.text,
      );

      try {
        await _bookDataSource.addBook(book);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Book added successfully!')),
        );
        _clearFields();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add book: $e')),
        );
      }
    }
  }

  void _clearFields() {
    // _bookIdController.clear();
    _titleController.clear();
    _authorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   controller: _bookIdController,
              //   decoration: const InputDecoration(labelText: 'Book ID'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a Book ID';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an Author';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addBook,
                child: const Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}