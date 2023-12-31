part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable{
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class CurrentWeather extends WeatherEvent{
  final Position position;

  const CurrentWeather({required this.position});
   @override
  List<Object> get props => [position];
}
