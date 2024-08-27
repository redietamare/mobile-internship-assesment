  import 'package:equatable/equatable.dart';
  import 'package:mobile_assesment/features/groceries/domain/entities/option_entity.dart';


  class OptionModel extends OptionEntity {
    const OptionModel({
      required String id,
      required String name,
      required double price,
    }) : super(id: id, name: name, price: price);

    factory OptionModel.fromJson(Map<String, dynamic> json) {
      return OptionModel(
        id: json['id'],
        name: json['name'],
        price: json['price'].toDouble(), 
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'name': name,
        'price': price,
      };
    }
      factory OptionModel.fromEntity(OptionEntity entity) {
      return OptionModel(
        id: entity.id,
        name: entity.name,
        price: entity.price,
      );
    }
  }
