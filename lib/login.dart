import 'package:biydaalt/forgot.dart';
import 'package:biydaalt/signup.dart';
import 'package:biydaalt/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // If the sign-in is successful, navigate to HomeScreen using Get.offAll
      Get.offAll(HomeScreen());
    } catch (e) {
      // Handle sign-in errors if any
      print("Error signing in: $e");
      // You can show an error message to the user if sign-in fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Нэвтрэхэд алдаа гарлаа. Нэвтрэх нэр эсвэл нууц үг буруу байна.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Нэвтрэх"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Имэйл',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Нууц үг',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => signIn(context),
              child: Text("Нэвтрэх"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.to(Signup()),
              child: Text("Бүртгүүлэх"),
            ),
            TextButton(
              onPressed: () => Get.to(Forgot()),
              child: Text("Нууц үг мартсан"),
            ),
          ],
        ),
      ),
    );
  }
}
