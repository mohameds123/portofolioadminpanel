import 'package:flutter/material.dart';

import '../core/service/subabase_servise.dart';
import '../core/utils/colors_manager.dart';

class ManageWorksScreen extends StatelessWidget {
  const ManageWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Works'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: SupabaseService().fetchData('works'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No works available');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final work = snapshot.data![index];
                  return ListTile(
                    title: Text(work['title']),
                    subtitle: Text(work['description']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        //SupabaseService().deleteData('works', work['id']);
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
