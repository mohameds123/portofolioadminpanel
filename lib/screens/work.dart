import 'package:flutter/material.dart';

import '../core/service/subabase_servise.dart';
import '../core/utils/colors_manager.dart';

class AddWorkScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Work'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Work Title'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SupabaseService().insertData('works', {
                  'title': titleController.text,
                  'date': dateController.text,
                  'description': descriptionController.text,
                });
                Navigator.pop(context);
              },
              child: Text("Add Work"),
            ),
          ],
        ),
      ),
    );
  }
}
