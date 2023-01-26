part of 'switch_bloc.dart';

abstract class SwitchState extends Equatable {
  const SwitchState();
  
  @override
  List<Object> get props => [];
}

class SwitchInitial extends SwitchState {}
