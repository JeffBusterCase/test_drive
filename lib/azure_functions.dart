import 'package:http/http.dart' as http;
import 'dart:convert';

const azFunctions = {
  "TriggerTest": "GDrN9ZvyYDRpuJPizcZXKZxm2xc0sHWL19uEapF7b7rBh8HiaME5kQ=="
};

const String host = "https://testjefferson.azurewebsites.net/api/";

Future<String> azureFunction(String name, {Map<String,String> body}) async {
  var url = host + name + "?code=" + azFunctions[name];
  var data = json.encode(body);
  var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: data);
  return response.body;
}