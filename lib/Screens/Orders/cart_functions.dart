import 'package:cloud_firestore/cloud_firestore.dart';

class CartFunctions {
  List<Map<String, dynamic>> cart = [];
  static void addToCart(String id, int Quantity) async {
    await FirebaseFirestore.instance
        .collection("ShoppingCart")
        .add({"id": id, "count": Quantity});
  }

  Future<void> getCartFirebase() async {
    await FirebaseFirestore.instance
        .collection("ShoppingCart")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              cart.add(element.data());
            }));
  }
}
