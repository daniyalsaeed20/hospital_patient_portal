import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerInitial(isTapped: false));

  toggleDrawer() {
    return emit(DrawerInitial(isTapped: !state.isTapped));
  }
}
