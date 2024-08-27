import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  const OptionEntity({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final double price;

  @override
  List<Object?> get props => [id, name, price];
}