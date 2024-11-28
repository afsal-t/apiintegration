import 'package:apiintegration/api%20integration/api%20integration%20using%20http/model/productModel.dart';
import 'package:http/http.dart'as http;


class HttpServices{
  static Future<List<Welcome>>fetchProducts()async{
   var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));



    if(response.statusCode==200){
      var data=response.body;
      return welcomeFromJson(data);
    }
    else{
      throw Exception;
    }
  }

}



























