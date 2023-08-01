import 'package:presence_auth_mobile/api/api.dart';

class LoginService {
  Future<void> signIn(String email, String password) async {
    Api(debug: true).post("/auth/signIn",
      body: {
        "email": email,
        "password": password
      },
      onSuccess: (value, statusCode) => print(statusCode)
    );
  }
}
