import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = "https://flutter-auth-app.onrender.com/api/auth";

Future<Map<String, dynamic>> signup(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/signup'),
    headers: {"Content-Type": "application/json"},
    body: json.encode({"email": email, "password": password}),
  );
  return json.decode(response.body);
}

Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    headers: {"Content-Type": "application/json"},
    body: json.encode({"email": email, "password": password}),
  );
  return json.decode(response.body);
}
