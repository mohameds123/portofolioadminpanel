import 'package:flutter/material.dart';
import 'package:portofolioadminpanel/screens/peronal_info.dart';
import 'package:portofolioadminpanel/screens/work.dart';

import '../core/utils/colors_manager.dart';
import 'experiences.dart';
import 'manage_ex.dart';
import 'manage_personal_info.dart';
import 'manage_work.dart';


class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel',  style: TextStyle(
          color: ColorsManagers.darkBlue,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
        ),),
        backgroundColor: Colors.white
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header of the Drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsManagers.darkBlue,
              ),
              child: Text(
                'Admin Panel',
                style: TextStyle(
                  color: ColorsManagers.darkBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            // Personal Info Menu Item
            ListTile(
              title: Text('Add Personal Info',),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPersonalInfoScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Manage Personal Info'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManagePersonalInfoScreen()),
                );
              },
            ),
            // Experience Menu Items
            ListTile(
              title: Text('Add Experience'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExperienceScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Manage Experiences'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageExperiencesScreen()),
                );
              },
            ),
            // Work Menu Items
            ListTile(
              title: Text('Add Work'),
              onTap: () {
                Navigator.push(

                  context,
                  MaterialPageRoute(builder: (context) => AddWorkScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Manage Works'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageWorksScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Admin Panel!',  style: TextStyle(
          color: ColorsManagers.darkBlue,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
        ),),
      ),
    );
  }
}
