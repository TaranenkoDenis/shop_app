import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseEvent {}

abstract class BaseState {}

abstract class BaseBloc<Event extends BaseEvent, State extends BaseState> {
  final _eventController = PublishSubject<Event>();
  final _stateController = BehaviorSubject<State>();
  final State initialState;

  BaseBloc({
    @required this.initialState,
  }) {
    _eventController.listen((Event event) {
      final currentState = _stateController.value ?? initialState;
      eventHandler(event, currentState).forEach((State newState) {
        _stateController.sink.add(newState);
      });
    });
  }

  Function(Event) get emitEvent => _eventController.sink.add;
  Stream<State> get state => _stateController.stream;

  Stream<State> eventHandler(Event event, State state);

  @mustCallSuper
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
