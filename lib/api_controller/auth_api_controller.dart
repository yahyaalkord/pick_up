import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pick_up/api_controller/api_setting.dart';
import 'package:pick_up/model/user.dart';
import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/utils/api_response.dart';

class AuthApiController {
  Future<ApiResponse> login(
      {required String email,
        required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url,
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var baseApiResponse = User.fromJson(json['data']);
      await SharedPrefController().save(user: baseApiResponse);
      return ApiResponse(json['message'], json['status']);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    } else {
      return ApiResponse('Something went wrong, try again', false);
    }
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader:
      SharedPrefController().getValueFor<String>(key: prefKeys.token.name)!,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      SharedPrefController().clear();
      return true;
    }else{
      return false;
    }

  }

  Future<ApiResponse> register({
    required String name,
    required String email,
    required String phone,
    required String date,
    required String password,
    required String confirmPassword,
  }) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'phone': phone,
      'date': date,
      'name': name,
      // 'lang_id': langId,
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return ApiResponse(json['message'], true);
      }else{
        return ApiResponse(json['message'], false);

      }
    }else{
      return ApiResponse('Something went wrong, try again', false);

    }
  }


  Future<ApiResponse> checkCode(
      {required String email, required String code}) async {
    var url = Uri.parse(ApiSettings.verifyCode);
    var response = await http.post(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    }, body: {
      'email': email,
      'code': code,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    } else {
      return ApiResponse('Something went wrong, try again', false);
    }
  }



}
