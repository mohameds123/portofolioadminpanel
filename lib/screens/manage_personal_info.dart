import 'package:flutter/material.dart';
import 'package:portofolioadminpanel/core/service/subabase_servise.dart';
import 'package:portofolioadminpanel/core/utils/colors_manager.dart';

class ManagePersonalInfoScreen extends StatelessWidget {
  const ManagePersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Personal Information'),
        backgroundColor: ColorsManagers.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: SupabaseService().fetchData('personal_info'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No personal information found');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final info = snapshot.data![index];
                  return ListTile(
                    title: Text(info['name']),
                    subtitle: Text(info['job']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        //SupabaseService().deleteData('personal_info', info['id']);
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
