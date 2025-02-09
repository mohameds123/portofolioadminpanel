import 'package:flutter/material.dart';
import '../core/service/subabase_servise.dart';

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {

  final SupabaseService _supabaseService = SupabaseService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  Future<void> _saveProject() async {
    try {
      await _supabaseService.addPortfolioItem(
        _titleController.text,
        _descriptionController.text,
        _imageUrlController.text,
      );
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add new project')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'title')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'description')),
            TextField(controller: _imageUrlController, decoration: InputDecoration(labelText: 'image url')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProject, child: Text('save project')),
          ],
        ),
      ),
    );
  }
}
