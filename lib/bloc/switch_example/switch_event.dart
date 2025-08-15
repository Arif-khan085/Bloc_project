


abstract class SwitchEvents{
  SwitchEvents();
  @override
  List<Object>get props=>[];
}

class EnableOrDisableNotification extends SwitchEvents{}

class SliderEvent extends SwitchEvents{
  final double Slider;
  SliderEvent(this.Slider);
}

