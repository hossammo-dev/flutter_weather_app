import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../resources_paths.dart';
import '../../../../../forecast/domain/entities/forecast_entity.dart';
import '../../../../../forecast/presentation/cubit/forecast_cubit.dart';
import '../../../../../forecast/presentation/cubit/forecast_states.dart';
import '../../domain/entities/weather_entity.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_states.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<void> _getWeatherByLocation() async {
    await BlocProvider.of<WeatherCubit>(context).getWeatherByCurrentLocation();
    // ignore: use_build_context_synchronously
    BlocProvider.of<ForecastCubit>(context).getForecastByCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    _getWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingValues.p12),
          child: Column(
            children: [
              BlocBuilder<WeatherCubit, WeatherStates>(
                  builder: (context, state) {
                if (state is WeatherGetWeatherLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is WeatherGetWeatherSuccessState) {
                  return Expanded(
                      child: _buildWeatherCard(
                          context, state.weather, Constants.bgImage));
                } else if (state is WeatherGetWeatherErrorState) {
                  return Center(
                    child: Text(
                      "Error",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
              const SizedBox(height: SizeValues.s20),
              BlocBuilder<ForecastCubit, ForecastStates>(
                builder: (context, state) {
                  if (state is ForecastGetForecastLoadingState) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is ForecastGetForecastSuccessState) {
                    return _buildForecast(context, state.forecast);
                  } else if (state is ForecastGetForecastErrorState) {
                    return Center(
                      child: Text(
                        "Error",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard(
          BuildContext context, Weather weather, String bgImage) =>
      Card(
        child: Container(
          padding: const EdgeInsets.all(PaddingValues.p16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //city name
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: ColorsManager.whiteColor),
                      const SizedBox(width: SizeValues.s4),
                      Text(weather.city,
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  //time
                  Text('Today ${DateFormat("h:mm a").format(weather.time)}',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              const SizedBox(height: SizeValues.s40),

              //body
              Text("${weather.temp}°",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: SizeValues.s20),
              Text(weather.condition,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: SizeValues.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: ColorsManager.whiteColor,
                          size: SizeValues.s16),
                      const SizedBox(width: SizeValues.s4),
                      Text("${weather.pressure}hpa",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: ColorsManager.whiteColor,
                          size: SizeValues.s16),
                      const SizedBox(width: SizeValues.s4),
                      Text("${weather.humidity}%",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: ColorsManager.whiteColor,
                          size: SizeValues.s16),
                      const SizedBox(width: SizeValues.s4),
                      Text("${weather.windSpeed}km/h",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SizeValues.s20),
              SizedBox(
                // height: 220,
                height: context.height * 0.22,
                width: double.infinity,
                child: Card(
                  color: ColorsManager.lightBlueGreyColor.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingValues.p16),
                    child: Text("Temperature",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildForecast(BuildContext context, List<Forecast> forecast) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: Theme.of(context).textTheme.labelMedium),
              Text('Next 7 Days',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
            ],
          ),
          const SizedBox(height: SizeValues.s20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: forecast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _forecastItemsList(
                    context, index, forecast[index], forecast.length)),
          ),
        ],
      );

  Widget _forecastItemsList(
          BuildContext context, int index, Forecast forecast, int length) =>
      Padding(
        padding: (index == length)
            ? EdgeInsets.zero
            : const EdgeInsets.only(right: PaddingValues.p16),
        child: Column(
          children: [
            Text(
                DateFormat("ha").format(
                    DateTime.fromMillisecondsSinceEpoch(forecast.time * 1000)),
                style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: SizeValues.s8),
            const Icon(Icons.sunny, color: Colors.amber, size: SizeValues.s32),
            const SizedBox(height: SizeValues.s8),
            Text('${forecast.temp}°',
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      );
}
