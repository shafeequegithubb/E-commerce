class UserModel {
  final String name;
  final String email;
  final String pass;
  final String role;  
 // add this

  UserModel(this.role, {
    required this.name,
    required this.email,
    required this.pass,

  });
}