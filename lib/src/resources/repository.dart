import 'dart:async';
import 'contact_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final contactApiProvider = ContactApiProvider();

  Future<ItemModel> fetchAllContact() => contactApiProvider.fetchContactList();

}