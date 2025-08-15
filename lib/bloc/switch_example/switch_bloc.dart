import 'package:flutter_bloc/flutter_bloc.dart';
import 'switch_event.dart';
import 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderChanged);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderChanged(SliderEvent event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: event.Slider));
  }
}
