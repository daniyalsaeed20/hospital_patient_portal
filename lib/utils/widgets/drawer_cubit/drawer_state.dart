part of 'drawer_cubit.dart';

sealed class DrawerState extends Equatable {
  const DrawerState({required this.isTapped});
  final bool isTapped;

  @override
  List<Object> get props => [isTapped];
}

final class DrawerInitial extends DrawerState {
  const DrawerInitial({required super.isTapped});
}
