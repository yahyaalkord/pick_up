import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pick_up/api_controller/api_setting.dart';
import 'package:pick_up/model/all_gyms_model.dart';
import 'package:pick_up/model/all_subscription_model.dart';
import 'package:pick_up/model/all_trainer_model.dart';
import 'package:pick_up/model/exercises_model.dart';
import 'package:pick_up/model/healthy_food_model.dart';
import 'package:pick_up/model/home_model.dart';
import 'package:pick_up/model/payments_model.dart';
import 'package:pick_up/model/store_subscriptio_model.dart';
import 'package:pick_up/model/subscription_info_model.dart';
import 'package:pick_up/model/trainer_choosee_model.dart';
import 'package:pick_up/utils/api_helpers.dart';
import 'package:pick_up/utils/api_response.dart';


class ContentApiController with ApiHelpers {

  Future<List<AllGymsModel>> getAllGyms() async {
    Uri uri = Uri.parse(ApiSettings.allGyms);
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          AllGymsModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<List<AllTrainersModel>> getAllTrainer({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.allTrainer.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          AllTrainersModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<List<AllSubscriptionModel>> getAllSubscription({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.allSubscription.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          AllSubscriptionModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<SubscriptionInfoModel?> getSubscriptionInfo({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.subscriptionInfo.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'];
      return SubscriptionInfoModel.fromJson(dataJsonObject);
    }else{
      return null;
    }

  }


  Future<List<PaymentsModel>> getPayments() async {
    Uri uri = Uri.parse(ApiSettings.payments);
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          PaymentsModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

/*  Future<StoreSubscriptionModel?> storeSubscriptionSend({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.storeSubscription);
    var response = await http.post(uri,headers: headers,body: {
      'subscription_id':id.toString()
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'];
      return StoreSubscriptionModel.fromJson(dataJsonObject);
    }else{
      return null;
    }


  }*/
  Future<ApiResponse<StoreSubscriptionModel>> storeSubscriptionSend({
    required int id,
  }) async {
    Uri uri = Uri.parse(ApiSettings.storeSubscription);
    var response = await http.post(uri, headers: headers, body: {
      'subscription_id':id.toString()
    });
    if (response.statusCode == 200 ) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'];
      var newStoreSubscriptionModel = StoreSubscriptionModel.fromJson(dataJsonObject);
      return ApiResponse<StoreSubscriptionModel>(json['message'], json['status'],newStoreSubscriptionModel);
    }else if(response.statusCode == 400){
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }else{
      return ApiResponse('Something went wrong, try again', false);
    }
  }

  ///
  Future<List<HomeModel>> getHomeData() async {
    Uri uri = Uri.parse(ApiSettings.getHome);
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          HomeModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<List<HealthyFoodModel>> getHealthyFood() async {
    Uri uri = Uri.parse(ApiSettings.healthyFood);
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          HealthyFoodModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<List<ExercisesModel>> getExercises({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.exercises.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          ExercisesModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

  Future<List<TrainerChooseeModel>> getTrainerChoose() async {
    Uri uri = Uri.parse(ApiSettings.getTrainerChoosee);
    var response = await http.get(uri,headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) =>
          TrainerChooseeModel.fromJson(jsonObject)).toList();
    }else{
      return [];
    }

  }

}