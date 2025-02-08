import 'package:flutter/material.dart';

import '../core/service/subabase_servise.dart';

class ContactFormWidget extends StatefulWidget {
  @override
  _ContactFormWidgetState createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submitContact() {
    final data = {
      'email': _emailController.text,
      'phone': _phoneController.text,
    };
    SupabaseService().insertData('contacts', data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: "Email"),
        ),
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(labelText: "Phone"),
        ),
        ElevatedButton(
          onPressed: _submitContact,
          child: Text("Add Contact Info"),
        ),
      ],
    );
  }
}
