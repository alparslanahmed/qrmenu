import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstore/localstore.dart';
import 'dart:html' as html;

final db = Localstore.instance;

class ApiClient {
  final String baseUrl = dotenv.env['API_URL']! + "/api/customer/" + html.window.location.href.split('/').last;

  Future<http.Response> post(String endpoint, dynamic body) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
  }

  Future<http.Response> put(String endpoint, dynamic body) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
  }

  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    return await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response> getImage(String endpoint) async {
    final url = Uri.parse(dotenv.env['API_URL']! + endpoint);
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
