import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> signIn() async {
    try {
      var res = await Auth().signInWithgoogle();

      print(res);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.red),
          child: TextButton(
              onPressed: signIn,
              child: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }
}
