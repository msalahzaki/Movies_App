import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int>{
  BottomNavigationCubit():super(0);

  changeNavigationWidget(int index){
    emit(index);
  }

}
