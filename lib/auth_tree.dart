import 'package:flutter/widgets.dart';
import 'package:weatherapp/auth.dart';
import 'package:weatherapp/home_page.dart';
import 'package:weatherapp/login.dart';

class Auth_tree extends StatefulWidget {
  const Auth_tree({super.key});

  @override
  State<Auth_tree> createState() => _Auth_treeState();
}

class _Auth_treeState extends State<Auth_tree> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().getAuthStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.data != null) {
          return MyHomPage();
        }
        return const Login();
      }),
    );
  }
}
