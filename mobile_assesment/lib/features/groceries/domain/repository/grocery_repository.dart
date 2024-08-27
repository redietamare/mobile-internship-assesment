import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/getAllGroceries.dart';


import '../../../../core/error/failure.dart';

abstract class GroceryRepository{
  Future<Either<Failure,void>> addToCart(GroceryEntity groceryEntity);
 Future<Either<Failure,List<GroceryEntity>>> getAllGroceries();

}