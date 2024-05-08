import 'package:biydaalt/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Get.offAll(Wrapper());
      } catch (e) {
        print("Error signing up: $e");
        // Handle signup errors here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Бүртгүүлэх"),
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
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Нууц үг',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Нууц үгээ оруулна уу';
                  }
                  // You can add more validation logic here if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: signup,
                child: Text("Бүртгүүлэх"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
