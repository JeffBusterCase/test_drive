import 'package:http/http.dart' as http;

const azFunctions = {
  "TriggerTest": "GDrN9ZvyYDRpuJPizcZXKZxm2xc0sHWL19uEapF7b7rBh8HiaME5kQ=="
};

const String host = "https://testjefferson.azurewebsites.net/api/";

dynamic azureFunction(String name) async {
  var url = host + name + "?code=" + azFunctions[name];
  var response = await http.get(url);
  return response.body;
}