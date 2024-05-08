import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:biydaalt/login.dart'; // Import your login screen file

class SettingsScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тохиргоо'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Гарах',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle logout
              Get.offAll(Login());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Тухай',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Navigate to about screen
              // You can implement this as needed
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(
              'Өнгө солих',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Navigate to color change screen
              // You can implement this as needed
            },
          ),
        ],
      ),
    );
  }
}
