import 'package:ecommerce_udemy/core/manager/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int v) async {
    _currentIndex = v;
    emit(ChangeIndex());
  }




  
}
