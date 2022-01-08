import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => FirebaseAuth.instance.signOut(),
        child: const Text('Sign Out'),
      ),
    );
  }
}
