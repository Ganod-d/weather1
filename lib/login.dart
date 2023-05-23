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
      backgroundColor: Color.fromRGBO(65, 174, 255, 1),
      body: Center(
          child: Container(
          
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color.fromARGB(255, 255, 253, 253)),
        child: TextButton(
          onPressed: signIn,
          // child: const Padding(
          //   padding: EdgeInsets.only(left: 10, right: 10),
          //   child: Image.asset(),
          //   // child: Text(

          //   //   "Sign In with Google",
          //   //   style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),

          //   //  )

          // ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Padding(
                
                padding: EdgeInsets.only(left: 10, right: 10),
                
                child: Image.asset('assets/img/google.png'),
              ),
              const Text(
                'Sign In With Google',
                style: TextStyle(
                  fontSize: 17,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
