import 'package:get/get.dart';
import '../service/api_services.dart';

class Productcontroller extends GetxController {
  var isloading = true.obs;
  var productlist = [].obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      isloading(true);
      var products = await HttpServices.fetchProducts();
      if (products != null) {
        productlist.value = products;
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isloading(false);
    }
  }
}
