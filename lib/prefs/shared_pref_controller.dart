
import 'package:pick_up/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKeys{
  loggedIn,
  name,
  email,
  date,
  phone,
  token,
  userComplete
}
class SharedPrefController {
  SharedPrefController._();

  static final SharedPrefController _instance = SharedPrefController._();


  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> save({ required User user, bool withToken = true}) async{
    if(withToken) {
      await _sharedPreferences.setString(prefKeys.token.name, 'Bearer '+user.token!);
    }
    await _sharedPreferences.setString(prefKeys.name.name, user.name!);
    await _sharedPreferences.setString(prefKeys.email.name, user.email!);
    await _sharedPreferences.setString(prefKeys.date.name, user.date!);
    await _sharedPreferences.setString(prefKeys.phone.name, user.phone!);
    await _sharedPreferences.setBool(prefKeys.userComplete.name, user.userComplete??false);
    await _sharedPreferences.setBool(prefKeys.loggedIn.name, true);


  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  Future<bool> clear()async{
    return await _sharedPreferences.clear();
  }
}