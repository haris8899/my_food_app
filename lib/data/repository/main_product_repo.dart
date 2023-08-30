import 'package:get/get.dart';
import 'package:my_food_app/data/api/api_client.dart';

class MainProductRepo extends GetxService {
  final ApiClient apiClient;

  MainProductRepo({required this.apiClient});

  Future<Response> getMainProductList() async {
    print(apiClient.AppBaseUrl);
    Response res = await apiClient.getData("/api/v1/products/popular");
    print("Pre: " + res.statusCode.toString());
    return await apiClient.getData("/api/v1/products/popular");
  }
}
