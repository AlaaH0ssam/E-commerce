import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';
import '../../services/homeDecoration_service.dart';
import '../../models/furniture.dart';
import 'home_decoration_state.dart';

class HomeDecorationCubit extends Cubit<HomeDecorationState> {
  final HomeDecorationService _service;

  HomeDecorationCubit(this._service) : super(HomeDecorationInitial());

  Future<void> fetchFurnitureData(String path) async {
    emit(HomeDecorationLoading());
    try {
      // Validate or preprocess the path if necessary
      if (path.isEmpty) {
        throw ArgumentError('The path cannot be empty');
      }

      List<Furniture> furnitureList =
          await _service.getFurnitureData(path: path);
      emit(HomeDecorationSuccess(furnitureList: furnitureList));
    } catch (e) {
      // Log the error for debugging purposes
      print('Error fetching furniture data: $e');

      // Provide user-friendly error messages if necessary
      emit(HomeDecorationFailure(
          error: 'Failed to load furniture data. Please try again later.'));
    }
  }
}
