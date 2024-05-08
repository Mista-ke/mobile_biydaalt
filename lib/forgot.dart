import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  reset() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
        // Show success message or navigate to success screen if needed
      } catch (e) {
        print("Error sending reset email: $e");
        // Handle error here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Нууц үг сэргээх"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Имэйл',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Имэйл хаягаа оруулна уу';
                  }
                  // You can add more validation logic here if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: reset,
                child: Text("Илгээх"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
