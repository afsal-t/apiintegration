import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/productcontroller.dart';
import 'widgets/producttile.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final Productcontroller productcontroller = Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Obx(() {
        if (productcontroller.isloading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productcontroller.productlist.length,
            itemBuilder: (context, index) {
              return ProductTile(productcontroller.productlist[index]);
            },
          );
        }
      }),
    );
  }
}
