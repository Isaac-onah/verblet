
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigationTabChanged extends NavigationEvent {
  final int index;
  const NavigationTabChanged(this.index);

  @override
  List<Object> get props => [index];
}

// States
@immutable
sealed class NavigationState extends Equatable {
  final int selectedIndex;
  const NavigationState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial(super.selectedIndex);
}

class NavigationUpdated extends NavigationState {
  const NavigationUpdated(super.selectedIndex);
}

// BLoC
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(0)) {
    on<NavigationTabChanged>((event, emit) {
      emit(NavigationUpdated(event.index));
    });
  }
}