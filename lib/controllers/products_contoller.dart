import 'package:gallery_app/models/products.dart';
import 'package:get/get.dart';
import '../services/store_service.dart';

class ProductController extends GetxController with StateMixin<dynamic> {
  static ProductController instance = Get.find();
  RxList<ImageDetails> products = RxList<ImageDetails>([]);
  final StoreService _storeService = StoreService();

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllImages());
  }

  Stream<List<ImageDetails>> getAllImages() => _storeService.getImages();
}
