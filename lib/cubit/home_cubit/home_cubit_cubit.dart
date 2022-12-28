import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  setToFinal() {
    emit(HomeFinal());
  }
}
