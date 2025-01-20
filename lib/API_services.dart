import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tatamotors/UserModel.dart';
class FetchUser{
  var data =[];
  List<Userlist> results =[];
  String fetchurl = "https://jsonplaceholder.typicode.com/users" ;
  Future <List<Userlist>> getUserList({String? query}) async{
    var url =Uri.parse(fetchurl);
    var response =  await http.get(url);
    try {
      if (response.statusCode == 200){
        data = json.decode(response.body);
        results = data.map((e) => Userlist.fromJson(e)).toList();
        if (query != null){
          results = results.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
        }
      }else{
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;

  }
}