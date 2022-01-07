import 'package:flutter/material.dart';

import 'package:better_finance/theme.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:better_finance/navigation.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ScaffoldSnackbar {
  ScaffoldSnackbar(this._context);
  final BuildContext _context;

  factory ScaffoldSnackbar.of(BuildContext context) {
    return ScaffoldSnackbar(context);
  }

  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  @override
  void initState() {
    _auth.userChanges().listen(
          (event) => setState(() => user = event),
        );

    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Navigation(),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.lightGreen,
        body: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: Image(image: AssetImage('/assets/images/logo.png')),
            // ),
            SignInButton(
              Buttons.Google,
              onPressed: _signInWithGoogle,
            ),
            user != null
                ? ElevatedButton(
                    onPressed: () => _auth.signOut(),
                    child: Text('Sign Out'),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
