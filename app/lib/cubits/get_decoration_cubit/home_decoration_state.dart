import 'package:meta/meta.dart';
import '../../models/furniture.dart';

@immutable
abstract class HomeDecorationState {}

class HomeDecorationInitial extends HomeDecorationState {}

class HomeDecorationLoading extends HomeDecorationState {}

class HomeDecorationSuccess extends HomeDecorationState {
  final List<Furniture> furnitureList;

  HomeDecorationSuccess({required this.furnitureList});
}

class HomeDecorationFailure extends HomeDecorationState {
  final String error;

  HomeDecorationFailure({required this.error});
}
