part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {}

final class WeatherSucces extends WeatherState {
  final Weather weather;

   WeatherSucces(this.weather);
   @override
  List<Object> get props => [weather];
  
}