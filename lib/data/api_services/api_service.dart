import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ApiService{

  //Get Api
  static Future<http.Response> getApi(String url)async{
    final data =await http.get(Uri.parse(url),
        headers: {
          "Authorization":"Bearer ${sharedPreferences!.getString("token")}"
        }
    );
    print("GET API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("GET API RESPONSE URL: $url");
    print("GET API RESPONSE BODY: ${data.body}");
    print("GET API RESPONSE STATUS CODE: ${data.statusCode}");
    return data;
  }
}