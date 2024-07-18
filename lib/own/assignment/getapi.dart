import 'dart:convert';

import 'package:dio/dio.dart';

Future<dynamic>getuserapi()async{
  var dio = Dio();
var response = await dio.request(
  'https://jsonplaceholder.typicode.com/users',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
print(response);
}
else {
  print(response.statusMessage);

}
}