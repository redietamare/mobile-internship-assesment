import 'package:equatable/equatable.dart';
import 'package:mobile_assesment/features/groceries/data/model/grocery_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';

class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];

}

class loading extends GroceryState {
  loading();

}

class loaded extends GroceryState {
  final List<GroceryModel> groceries;
  loaded(this.groceries);
}

class failed extends GroceryState {
  final String message;
  failed(this.message);


}

