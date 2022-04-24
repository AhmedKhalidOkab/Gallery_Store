/*import 'package:gallery_app/constants/firebase.dart';
import 'package:gallery_app/models/products.dart';
import 'package:get/get.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}*/
