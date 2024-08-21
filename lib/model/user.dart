import 'package:restapi/model/user_dob.dart';
import 'package:restapi/model/user_location.dart';
import 'package:restapi/model/user_name.dart';
import 'user_picture.dart';
class User {
  final String cell;
  final String email;
  final String gender;
  final String nat;
  final String phone;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.cell,
    required this.email,
    required this.gender,
    required this.nat,
    required this.phone,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture
  });

  factory User.fromMap(Map<String, dynamic> e){

    final picture = UserPicture.fromMap(e['picture'],);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDob.fromMap(e['dob']);
    final name = UserName.fromMap(e['name']);

    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture
    );

  }
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}
