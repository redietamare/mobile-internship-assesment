import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_assesment/core/error/exception.dart';
import 'package:mobile_assesment/core/error/failure.dart';
import 'package:mobile_assesment/core/network_info.dart';
import 'package:mobile_assesment/features/groceries/data/datasources/remote_contract.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';
import 'package:mobile_assesment/features/groceries/domain/repository/grocery_repository.dart';

class GroceryRepositoryImp extends GroceryRepository{
 final GroceryRemoteDataSource groceryRemoteDataSource;
 final NetworkInfo networkInfo;
 GroceryRepositoryImp({
  required this.groceryRemoteDataSource,
  required this.networkInfo
 });


  @override
  Future<Either<Failure, void>> addToCart(GroceryEntity groceryEntity) {
    
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries() async {
      try {
      if (await networkInfo.isConnected) {
        final groceries = await groceryRemoteDataSource.getAllGroceries();
        return Right(groceries);
      } else{
        return Left(ServerFailure('No internet connection'));
      }
    } on ServerException {
      return Left(ServerFailure('An error has occured'));
    } on SocketException {
      return Left(ServerFailure('No internet connection'));
    }
   
  }}