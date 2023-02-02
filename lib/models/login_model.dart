class LoginModel {
  final String _email;
  final String _password;

  get email => _email;
  get password => _password;

  LoginModel({
    required email,
    required password,
  })  : _email = email,
        _password = password;
}
