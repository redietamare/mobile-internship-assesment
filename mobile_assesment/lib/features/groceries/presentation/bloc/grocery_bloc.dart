
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assesment/features/groceries/data/model/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/getAllGroceries.dart';
import 'package:mobile_assesment/features/groceries/domain/usecases/getAllGroceries.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocery_state.dart';
import 'package:mobile_assesment/features/groceries/presentation/bloc/grocey_event.dart';

class GroceryBloc extends Bloc<GroceryEvent,GroceryState>{
  final GetAllGroceriesUsecase getAllGroceriesUsecase;
  GroceryBloc(
    {
      required this.getAllGroceriesUsecase
    }
  ):super(loading()){
    on<GetAllGroceriesEvent>(_getAllGroceries);
  }
  Future<void> _getAllGroceries(GetAllGroceriesEvent event, Emitter<GroceryState> emit) async {
    emit(loading());
    print('GetAllGroceriesEvent');
    var result = await getAllGroceriesUsecase.getall();
    print('result');
    print(result);
    result.fold(
      (failure)=>emit(failed(failure.message)),
      (groceries)=>emit(loaded(groceries.map((e)=>GroceryModel.fromEntity(e)).toList()))    
    );
  }
}

