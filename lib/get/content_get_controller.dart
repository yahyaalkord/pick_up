import 'package:get/get.dart';
import 'package:pick_up/api_controller/content_api_controller.dart';
import 'package:pick_up/model/all_gyms_model.dart';
import 'package:pick_up/model/all_subscription_model.dart';
import 'package:pick_up/model/all_trainer_model.dart';

class ContentGetxController extends GetxController {
  static ContentGetxController get to => Get.find<ContentGetxController>();
  final ContentApiController _contentApiController = ContentApiController();
  List<AllGymsModel> allGyms = <AllGymsModel>[];
  List<AllTrainersModel> allTrainers = <AllTrainersModel>[];
  List<AllSubscriptionModel> allSubscription = <AllSubscriptionModel>[];

  bool loading = false;
  bool moreLoading = false;
  int pageNum = 1;

  @override
  void onInit() {
    read();
    super.onInit();
  }

  void read() async {
    loading = true;
    allGyms = await _contentApiController.getAllGyms();
    loading = false;
    update();
  }

  void readTrainers({required int id}) async {
    loading = true;
    allTrainers = await _contentApiController.getAllTrainer(id: id);
    loading = false;
    update();
  }

  void readSubscription({required int id}) async {
    loading = true;
    allSubscription = await _contentApiController.getAllSubscription(id: id);
    loading = false;
    update();
  }


}
