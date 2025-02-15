import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int>{
  BottomNavigationCubit():super(0);
int selectedCategory = 0 ;
  changeNavigationWidget(int index){
    emit(index);
  }
chanSelectedCategory(int selectedCategory){
selectedCategory = selectedCategory+4;
  emit(selectedCategory);
}
}
