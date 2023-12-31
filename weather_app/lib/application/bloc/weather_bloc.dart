import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
     emit(WeatherLoading());

     try{
      WeatherFactory wf = new WeatherFactory("YOUR_API_KEY", language: Language.GERMAN);

      // weather by position
      //debugPrint(weather);
      //emit(WeatherBlocSuccees(weather));
     }catch(e){
      emit(WeatherFailure());
     }
    });
  }
}
