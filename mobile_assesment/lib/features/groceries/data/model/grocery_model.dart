import 'package:mobile_assesment/features/groceries/data/model/option_model.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/grocery_entity.dart';

import 'package:equatable/equatable.dart';


class GroceryModel extends GroceryEntity {
  const GroceryModel({
    required String id,
    required String image,
    required double rating,
    required double discount,
    required double price,
    required String title,
    required String description,
    required List<OptionModel> options,
  }) : super(
          id: id,
          image: image,
          rating: rating,
          discount: discount,
          price: price,
          title: title,
          description: description,
          options: options,
        );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'],
      image: json['imageUrl'],
      rating: json['rating'].toDouble(), 
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(), 
      title: json['title'],
      description: json['description'],
      options: (json['options'] as List<dynamic>)
          .map((optionJson) => OptionModel.fromJson(optionJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': image,
      'rating': rating,
      'price': price,
      'discount': discount,
      'title': title,
      'description': description,
      'options': options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }
    factory GroceryModel.fromEntity(GroceryEntity entity) {
    return GroceryModel(
      id: entity.id,
      image: entity.image,
      rating: entity.rating,
      price: entity.price,
      discount: entity.discount,
      title: entity.title,
      description: entity.description,
      options: entity.options
          .map((option) => OptionModel.fromEntity(option))
          .toList(),
    );
  }
}
