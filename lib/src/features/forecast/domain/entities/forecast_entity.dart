import 'package:equatable/equatable.dart';

class Forecast extends Equatable{
  final int temp;
  final int time;
  final String iconCode;

  const Forecast(this.temp, this.time, this.iconCode);

  @override
  List<Object?> get props => [temp, time, iconCode];

}