import 'package:movie_app/data/shared_preferences.dart';

abstract class UserRepository {
  Future<bool> checkUser();
}

class UserRepo extends UserRepository {
  @override
  Future<bool> checkUser() async {
    bool checkUser = await MySharedPreferences().getUser();
    print('checkUser: $checkUser');
    return checkUser;
  }
}
