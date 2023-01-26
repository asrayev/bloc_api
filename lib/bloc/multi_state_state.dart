part of 'multi_state_bloc.dart';

@immutable
abstract class MultiStateState {}

class MultiStateInitial extends MultiStateState {}

class GettingDataInProgress extends MultiStateState{}

// ignore: must_be_immutable
class GettingDataInSuccess extends MultiStateState{
  List cards;

  GettingDataInSuccess({required this.cards});
}

// ignore: must_be_immutable
class GettingDataInFailure extends MultiStateState{
  String errorText;
  GettingDataInFailure({required this.errorText});

}