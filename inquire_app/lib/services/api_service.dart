import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.142/inquiry_api';

  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'role': role,
      }),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> sendInquiry(String question) async {
    final response = await http.post(
      Uri.parse('$baseUrl/inquire.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> addInquiry(
    String keywords,
    String answer,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_inquiry.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'keywords': keywords, 'answer': answer}),
    );
    return jsonDecode(response.body);
  }
}
