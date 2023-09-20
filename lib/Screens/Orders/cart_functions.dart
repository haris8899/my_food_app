import 'package:cloud_firestore/cloud_firestore.dart';

class CartFunctions {
  List<Map<String, dynamic>> cart = [];
  static void addToCart(String id, int Quantity) async {
    int count = 0;
    var UserRef =
        await FirebaseFirestore.instance.collection("ShoppingCart").doc(id);
    UserRef.get().then((snapshot) => {
          if (snapshot.exists)
            {
              print("Exists"),
              count = snapshot.get("count"),
              count+=Quantity,
              UserRef.set({"count": count})
            }
            else{
              UserRef.set({"count":Quantity})
            }
        });
  }

  static Future<void> removeFromCart(String id) async {
    await FirebaseFirestore.instance.collection("ShoppingCart").doc(id).delete();
  }
}
