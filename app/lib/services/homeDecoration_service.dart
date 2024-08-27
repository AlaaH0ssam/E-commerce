import 'package:dio/dio.dart';
import '../models/furniture.dart';

class HomeDecorationService {
  Dio dio = Dio();

  Future<List<Furniture>> getFurnitureData({required String path}) async {
    try {
      Response response = await dio.get(path);
      List<dynamic> products = response.data['products'];
      List<Furniture> furnitureList = [];

      for (var product in products) {
        furnitureList.add(Furniture.fromJson(product));
      }

      return furnitureList;
    } catch (e) {
      // Handle the error appropriately
      print('Error fetching furniture data: $e');
      throw Exception('Failed to load furniture data');
    }
  }
}

