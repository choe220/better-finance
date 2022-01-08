import 'dart:convert';

import 'package:http/http.dart' as http;

class Plaid {
  static void initializeLink({
    required String uid,
  }) async {
    Uri uri = Uri.parse(
        'https://us-central1-better-finance-337412.cloudfunctions.net/plaid-create-link-token');
    http.Response response = await http.post(uri, body: {'uid': uid});
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
  }
}
