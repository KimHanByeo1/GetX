import 'dart:convert';
import 'package:getx/main/Model/product_model.dart';
import 'package:http/http.dart' as http;

class Services {
  // 서버를 매번 열고 닫기를 하지 않기 위해 static 변수로 선언
  static var client = http.Client();

  // Future List는 널 값을 리턴할 수 없기 때문에 널러블 형태로 지정해줌 >> ? <<
  // static Future<List<Product>?> fetchProduct() async {
  //   // String Type의 URL주소를 파싱하여 response 변수에 저장
  //   // async 방식이기 때문에 await 키워드를 사용한다.
  //   var response = await client.get(Uri.parse(
  //       'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

  //   // 200: 성공적으로 데이터가 들어왔다는 뜻
  //   if (response.statusCode == 200) {
  //     var jsonData = response.body;
  //     return productFromJson(jsonData);
  //   } else {
  //     return null;
  //   }
  // }

  // Future List는 널 값을 리턴할 수 없기 때문에 널러블 형태로 지정해줌 >> ? <<
  static Future<List<Product>?> fetchProduct() async {
    // String Type의 URL주소를 파싱하여 response 변수에 저장
    // async 방식이기 때문에 await 키워드를 사용한다.
    var response = await http.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    // 200: 성공적으로 데이터가 들어왔다는 뜻
    if (response.statusCode == 200) {
      List dateConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      return dateConvertedJSON.map((e) => Product.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
