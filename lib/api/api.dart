import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final _headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  final baseUrl = "localhost:8000";
  bool debug;

  Api({
    this.debug = false
  });

  Future<http.Response> get(String url, {
    Map<String, dynamic>? params
  }) async {
    // final completeUrl = _createUrl(url);
    try {
      if (debug) print("Sending get request to $url");
      final response = await http.get(
        Uri.http(baseUrl, url, params),
        headers: _headers
      );
      if (debug) print("Get request to $url is over");
      return response;
    } catch (e) {
      //TODO implement error
      throw e;
    }
  }

  Future<http.Response> post(String url, {
    Object? body,
    void Function(dynamic response, int statusCode)? onSuccess
  }) async {
    try {
      if (debug) print("Sending post request to $url");
      http.Response response = await http.post(
        Uri.http(baseUrl, url),
        body: jsonEncode(body),
        headers: _headers
      );
      if (debug) print("Post request to $url is over");

      Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      if (onSuccess != null) onSuccess(decodedResponse, response.statusCode);
      return response;
    } catch (e) {
      //TODO implement error
      throw e;
    }
  }
}