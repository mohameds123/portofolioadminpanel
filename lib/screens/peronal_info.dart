import 'package:flutter/material.dart';
import 'package:portofolioadminpanel/core/utils/colors_manager.dart';

import '../core/service/subabase_servise.dart';

class AddPersonalInfoScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController resumeLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Personal Information'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(labelText: 'Job'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: resumeLinkController,
              decoration: InputDecoration(labelText: 'Resume Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SupabaseService().insertData('personal_info', {
                  'name': nameController.text,
                  'job': jobController.text,
                  'location': locationController.text,
                  'resume_link': resumeLinkController.text,
                });
                Navigator.pop(context);
              },
              child: Text("Add Information"),
            ),
          ],
        ),
      ),
    );
  }
}
