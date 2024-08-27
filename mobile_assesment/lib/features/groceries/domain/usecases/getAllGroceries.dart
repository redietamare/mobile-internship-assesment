import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/error/failure.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';
import 'package:mobile_assesment/features/groceries/domain/repository/grocery_repository.dart';

class GetAllGroceriesUsecase{
  
  GetAllGroceriesUsecase(this.groceryRepository);
  final GroceryRepository groceryRepository;
  Future<Either<Failure,List<GroceryEntity>>> getall(){
    print('GetAllGroceriesUsecase');
    return groceryRepository.getAllGroceries();
  }
}