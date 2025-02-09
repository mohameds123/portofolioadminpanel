import 'package:flutter/material.dart';
import 'package:portofolioadminpanel/core/utils/colors_manager.dart';

import '../core/service/subabase_servise.dart';

class ManageExperiencesScreen extends StatelessWidget {
  const ManageExperiencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Experiences'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: SupabaseService().fetchData('experiences'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No experiences found');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final experience = snapshot.data![index];
                  return ListTile(
                    title: Text(experience['date']),
                    subtitle: Text(experience['description']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        //SupabaseService().deleteData('experiences', experience['id']);
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
