import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:my_restaurant/models/food_item.dart';
import 'package:my_restaurant/models/response_result.dart';

class Api {
  Api._privateConstructor();

  static final Api _instance = Api._privateConstructor();

  factory Api() {
    return _instance;
  }

  Future<List<FoodItem>> fetchFoods() async {
    ResponseResult result =
        await _makeRequest('http://165.227.94.69:8000/api/foods/');

    List dataList = result.data;

    return dataList.map((item) => FoodItem.fromJson(item)).toList();
  }

  Future<ResponseResult> _makeRequest(url) async {
    final response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> jsonBody = json.decode(response.body);

        List<dynamic> dataList = jsonBody['data_list'];

        // print(dataList);

        return ResponseResult(success: true, data: dataList);
      default:
        print('Error! http status ${response.statusCode}');

        return ResponseResult(success: false, data: response.body);
    }
  }
}
