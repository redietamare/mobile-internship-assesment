import 'package:mobile_assesment/features/groceries/data/model/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/getAllGroceries.dart';

abstract class GroceryRemoteDataSource {

Future<List<GroceryModel>> getAllGroceries();
Future<void> addToCart(GroceryModel groceryModel); 
}