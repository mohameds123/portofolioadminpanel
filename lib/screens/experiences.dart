import 'package:flutter/material.dart';

import '../core/service/subabase_servise.dart';
import '../core/utils/colors_manager.dart';

class AddExperienceScreen extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Experience'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                await SupabaseService().insertData('experiences', {
                  'date': dateController.text,
                  'description': descriptionController.text,
                });
                Navigator.pop(context);
              },
              child: Text("Add Experience"),
            ),
          ],
        ),
      ),
    );
  }
}
