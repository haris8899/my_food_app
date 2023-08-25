import 'package:get/get.dart';
import 'package:my_food_app/data/repository/main_product_repo.dart';
import 'package:my_food_app/models/main_products_model.dart';

class MainProductController extends GetxController{
  final MainProductRepo mainProductRepo;
  MainProductController({required this.mainProductRepo});
  List<dynamic> _mainProductList = [];
  List<dynamic> get mainproduct => _mainProductList;
  Future<void> getMainProductList() async{
    Response response = await mainProductRepo.getMainProductList();
    if(response.statusCode == 200){
      print("Got Products");
      _mainProductList = [];
      _mainProductList.addAll(Product.fromJson(response.body).products);
      update();
    }else{

    }
  }
}
