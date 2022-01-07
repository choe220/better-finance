import 'package:better_finance/theme.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: Container(
            decoration: const BoxDecoration(
                color: CustomColors.lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 10)]),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, index) => const ListTile(
            title: Text('test'),
          ),
        ),
      ],
    );
  }
}
