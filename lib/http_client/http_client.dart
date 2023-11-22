import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  /// Function to make get request
  /// [url] is the url to make get request
  /// [headers] is the headers to be passed in the request
  Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
    );
    print(response.body);
    return response;
  }

  /// Function to make post request
  /// [url] is the url to make post request
  /// [headers] is the headers to be passed in the request
  /// [body] is the body to be passed in the request
  Future<http.Response> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var postHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };
    var postBody = jsonEncode(body);
    var response = await http.post(
      Uri.parse(url),
      headers: postHeaders,
      body: postBody,
    );
    return response;
  }

  /// Function to make put request
  /// [url] is the url to make post request
  /// [headers] is the headers to be passed in the request
  /// [body] is the body to be passed in the request
  Future<http.Response> put({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var postHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };
    var postBody = jsonEncode(body);
    var response = await http.put(
      Uri.parse(url),
      headers: postHeaders,
      body: postBody,
    );
    return response;
  }
}
