import 'package:flutter_bloc/flutter_bloc.dart';

enum FoodCategory { Pizza, Burger, Sausage, Samosa }

class FoodCubit extends Cubit<FoodCategory>{
  FoodCubit():super(FoodCategory.Burger);
   // Method to select a category
  void selectCategory(FoodCategory category) {
    emit(category);}
  
}