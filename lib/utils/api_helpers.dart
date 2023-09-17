import 'dart:io';

import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/utils/api_response.dart';

mixin ApiHelpers{
  ApiResponse get errorResponse => ApiResponse('Something went wrong', false);

  Map<String, String> get headers => {
    HttpHeaders.acceptHeader: 'application/json',
    if (SharedPrefController().getValueFor(key: prefKeys.loggedIn.name))
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(key: prefKeys.token.name),
  };
}