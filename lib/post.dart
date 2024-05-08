import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ажлын зараа оруулна уу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ажлын нэр',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Ажлын нэрээ оруулна уу',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Дэлгэрэгүй',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _detailsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Дэлгэрэнгүй мэдээлэл оруулна уу',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ажлын хөлс',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ажлын хөлсын мэдээлэл оруул',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your logic to post the job here
                String title = _titleController.text;
                String details = _detailsController.text;
                String salary = _salaryController.text;

                // Pass job details back to the home screen
                Navigator.pop(context, {
                  'title': title,
                  'details': details,
                  'salary': salary,
                });
              },
              child: Text('Нийтлэх'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _titleController.dispose();
    _detailsController.dispose();
    _salaryController.dispose();
    super.dispose();
  }
}
