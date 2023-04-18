import 'dart:convert';
import 'dart:io';
import 'package:tagumpai/constants/api.dart';
import 'package:tagumpai/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<dynamic> getApi() async {
    final response = await http.get(Uri.parse("$BASE_URL/"));

    Map jsonResponse = jsonDecode(response.body);
    print("Api fetched: $jsonResponse");
  }

  Future<dynamic> postApi(dynamic user) async {
    var url = Uri.parse(BASE_URL);
    var response = await http.post(
      url,
      body: user,

      // {
      //   "companyName": "Accenture",
      //   "jobTitle": "Data Engineer",
      //   "jobDesc": "The work",
      // },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
    }
  }
}
