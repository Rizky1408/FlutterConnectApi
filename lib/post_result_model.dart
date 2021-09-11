import 'dart:convert';
import 'package:http/http.dart' as http;

class PostApiResult {
  String id;
  String name;
  String job;
  String created;

  PostApiResult({this.name, this.id, this.job, this.created});

  factory PostApiResult.createdApiResult(Map<String, dynamic> json) {
    return PostApiResult(
        id: json["id"],
        name: json["name"],
        job: json["job"],
        created: json["createdAt"]);
  }

  static Future<PostApiResult> connectToApi(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var postApiUrl = await http.post(apiURL, body: {"name": name, "job": job});

    var jsonObject = json.decode(postApiUrl.body);

    return PostApiResult.createdApiResult(jsonObject);
  }
}
