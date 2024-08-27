import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_assesment/core/network_info.dart';
import 'package:mobile_assesment/features/groceries/data/datasources/remote_contract.dart';
import 'package:mobile_assesment/features/groceries/data/datasources/remote_data_sources.dart';
import 'package:mobile_assesment/features/groceries/data/repositories/grocery_repository_imp.dart';
import 'package:mobile_assesment/features/groceries/domain/repository/grocery_repository.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/getAllGroceries.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery_bloc.dart';
final getIt = GetIt.instance;
Future<void> setup() async{
  var client = http.Client();
  var connectivity = InternetConnectionChecker();
  getIt.registerSingleton<InternetConnectionChecker>(connectivity);
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(getIt()));
  getIt.registerSingleton<http.Client>(client);
  getIt.registerSingleton<GroceryRemoteDataSource>(GroceryRemoteDataSourceImp(client: getIt()));

  getIt.registerSingleton<GroceryRepository>(GroceryRepositoryImp(groceryRemoteDataSource: getIt(),networkInfo: getIt()));
  
  getIt.registerSingleton<GetAllGroceriesUsecase>(GetAllGroceriesUsecase(getIt()));
  getIt.registerSingleton<GroceryBloc>(GroceryBloc(getAllGroceriesUsecase: getIt())); 

}
