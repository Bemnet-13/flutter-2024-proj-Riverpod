import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String loginEndpoint;

  AuthRepository({required this.loginEndpoint});

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }
}
