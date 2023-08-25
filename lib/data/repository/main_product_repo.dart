import 'package:get/get.dart';
import 'package:my_food_app/data/api/api_client.dart';

class MainProductRepo extends GetxService{
  final ApiClient apiClient;

  MainProductRepo({required this.apiClient});

  Future<Response> getMainProductList() async{
    return await apiClient.getData("end point url");
  }
}