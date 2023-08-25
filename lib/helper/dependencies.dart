import 'package:get/get.dart';
import 'package:my_food_app/controllers/main_product_controller.dart';
import 'package:my_food_app/data/api/api_client.dart';
import 'package:my_food_app/data/repository/main_product_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(AppBaseUrl: "url"));
  Get.lazyPut(() => MainProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => MainProductController(mainProductRepo: Get.find()));
}