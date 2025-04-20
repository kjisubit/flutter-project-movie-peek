import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_event.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial()) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(TabChanged event, Emitter<NavigationState> emit) {
    emit(NavigationChanged(event.newIndex));
  }
}
