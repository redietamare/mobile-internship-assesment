import 'dart:convert';

import 'package:mobile_assesment/features/groceries/data/datasources/remote_contract.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_assesment/features/groceries/data/model/grocery_model.dart';
class GroceryRemoteDataSourceImp extends GroceryRemoteDataSource{
  GroceryRemoteDataSourceImp({required this.client});
  final http.Client client;

  @override
  Future<void> addToCart(GroceryModel groceryModel) {
  
    throw UnimplementedError();
  }

  @override
  Future<List<GroceryModel>> getAllGroceries() async{
    final response = await client.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'));
    print('response');
    print(response.body);
    if (response.statusCode==200){
      var jsonData = jsonDecode(response.body);
      var groceries = jsonData['data'] as List;
      final List<GroceryModel> listofGroceries = groceries.map((e) => GroceryModel.fromJson(e)).toList();
      print(listofGroceries);
      return listofGroceries;
  }else{
    throw Exception('Failed to load groceries');
  }

}
}