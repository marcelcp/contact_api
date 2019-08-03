import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class ContactApiProvider {
  Client client = Client();
  final _baseUrl = "https://reqres.in/api/users?per_page=12";

  Future<ItemModel> fetchContactList() async {
    final response = await client.get("$_baseUrl");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}