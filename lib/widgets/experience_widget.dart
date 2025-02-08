import 'package:flutter/material.dart';
import 'package:portofolioadminpanel/core/service/subabase_servise.dart';

class ExperienceFormWidget extends StatefulWidget {
  @override
  _ExperienceFormWidgetState createState() => _ExperienceFormWidgetState();
}

class _ExperienceFormWidgetState extends State<ExperienceFormWidget> {
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  void _submitExperience() {
    final data = {
      'description': _descriptionController.text,
      'date': _dateController.text,
    };
    SupabaseService().insertData('experiences', data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(labelText: "Description"),
        ),
        TextField(
          controller: _dateController,
          decoration: InputDecoration(labelText: "Date"),
        ),
        ElevatedButton(
          onPressed: _submitExperience,
          child: Text("Add Experience"),
        ),
      ],
    );
  }
}
