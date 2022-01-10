import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plaid_flutter/plaid_flutter.dart';

class PlaidInitialization extends StatefulWidget {
  PlaidInitialization({Key? key}) : super(key: key);

  @override
  _PlaidInitializationState createState() => _PlaidInitializationState();
}

class _PlaidInitializationState extends State<PlaidInitialization> {
  late LinkTokenConfiguration _linkTokenConfiguration;
  String _accessToken = '';

  Future<String> _createLinkToken({
    required String uid,
  }) async {
    Uri uri = Uri.parse(
        'https://us-central1-better-finance-337412.cloudfunctions.net/plaid-create-link-token');
    http.Response response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'uid': uid}));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // await initializeLink(linkToken: decodedResponse['link_token']);
    return decodedResponse['link_token'];
  }

  @override
  void initState() {
    super.initState();

    PlaidLink.onSuccess(_onSuccessCallback);
    PlaidLink.onEvent(_onEventCallback);
    PlaidLink.onExit(_onExitCallback);
  }

  Future<Map<String, dynamic>> _exchangePublicToken(String publicToken) async {
    Uri uri = Uri.parse(
        'https://us-central1-better-finance-337412.cloudfunctions.net/plaid-exchange-public-token');
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {'token': publicToken},
      ),
    );
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }

  void _onSuccessCallback(
      String publicToken, LinkSuccessMetadata metadata) async {
    print('onSuccess: $publicToken, metadata: ${metadata.description()}');
    Map<String, dynamic> accessToken = await _exchangePublicToken(publicToken);
    print(accessToken);
    setState(() {
      _accessToken = accessToken['access_token'];
    });
  }

  void _onEventCallback(String event, LinkEventMetadata metadata) {
    print('onEvent: $event, metadata: ${metadata.description()}');
  }

  void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
    print('onExit metadata: ${metadata.description()}');

    if (error != null) {
      print('onExit error: ${error.description()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _createLinkToken(uid: FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.orange,
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text('An error occurred');
        }
        String linkToken = snapshot.data as String;
        _linkTokenConfiguration = LinkTokenConfiguration(token: linkToken);
        return Column(
          children: [
            ElevatedButton(
              child: const Text('Initialize Link'),
              onPressed: () async =>
                  PlaidLink.open(configuration: _linkTokenConfiguration),
            ),
            Text(_accessToken),
          ],
        );
      },
    );
  }
}

class Plaid {
  late Map<String, dynamic> access;

  Future<String> createLinkToken({
    required String uid,
  }) async {
    Uri uri = Uri.parse(
        'https://us-central1-better-finance-337412.cloudfunctions.net/plaid-create-link-token');
    http.Response response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'uid': uid}));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    await initializeLink(linkToken: decodedResponse['link_token']);
    return decodedResponse['link_token'];
  }

  Future<Map<String, dynamic>> _onSuccessCallback(
      String publicToken, LinkSuccessMetadata metadata) async {
    print('onSuccess: $publicToken, metadata: ${metadata.description()}');
    Uri uri = Uri.parse('');
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {'token': publicToken},
      ),
    );
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }

  Future<void> initializeLink({required String linkToken}) async {
    LinkConfiguration configuration = LinkTokenConfiguration(
      token: linkToken,
    );

    PlaidLink.onSuccess(_onSuccessCallback);

    await PlaidLink.open(configuration: configuration);
  }
}
