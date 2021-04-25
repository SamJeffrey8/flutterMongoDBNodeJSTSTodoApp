import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TodoProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> todoData;
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  //Get
  Future fetchData() async {
    final restAPIUri = Uri.parse("https://flutternodejstodoapp.herokuapp.com/");
    http.Response response = await httpClient.get(restAPIUri);
    final Map parsedData = await json.decode(response.body.toString());
    todoData = parsedData['data'];
    print(todoData);
  }

  //Post
  Future postData(Map<String, String> body) async {
    final restAPIUri =
        Uri.parse("https://flutternodejstodoapp.herokuapp.com/add");
    http.Response response = await httpClient.post(restAPIUri,
        headers: customHeaders, body: jsonEncode(body));

    return response.body;
  }

  //Delete Data
  Future deleteData(String id) async {
    final restAPIUri =
        Uri.parse("https://flutternodejstodoapp.herokuapp.com/delete");
    http.Response response = await httpClient.delete(restAPIUri,
        headers: customHeaders, body: jsonEncode({"_id": id}));
    print(id);
    print(response.body);
    return response.body;
  }

  //Update Data
  Future updateData(Map<String, String> data) async {
    final restAPIUri =
        Uri.parse("https://flutternodejstodoapp.herokuapp.com/update");
    http.Response response = await httpClient.put(restAPIUri,
        headers: customHeaders, body: jsonEncode(data));

    return response.body;
  }
}
