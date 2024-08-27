import 'package:equatable/equatable.dart';
import 'package:mobile_assesment/features/groceries/domain/entities/option_entity.dart';




class GroceryEntity extends Equatable {
  const GroceryEntity({
    required this.id,
    required this.image,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.title,
    required this.options,
  });

  final String id;
  final String image;
  final double rating;
  final double price;
  final double discount;
  final String title;
  final String description;
  final List<OptionEntity> options;

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        description,
        price,
        rating,
        discount,
        options,
      ];
}
