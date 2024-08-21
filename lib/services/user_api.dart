import 'package:http/http.dart' as http;
import 'package:restapi/model/user.dart';
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetch users');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final results = json['results'] as List<dynamic>;

      final users = results.map((e) {
      return User.fromMap(e);
      }).toList();

      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
