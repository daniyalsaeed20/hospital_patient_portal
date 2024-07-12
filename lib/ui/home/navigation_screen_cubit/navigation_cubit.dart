// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial(index: 0));

  toggleIndex({required int index}) {
    return emit(NavigationInitial(index: index));
  }
}
