import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../resources_paths.dart';
import '../../domain/entities/weather_entity.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_states.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<void> _getWeatherByLocation() =>
      BlocProvider.of<WeatherCubit>(context).getWeatherByCurrentLocation();

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
              BlocConsumer<WeatherCubit, WeatherStates>(
                  listener: (context, state) {},
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
              _buildForecast(context),
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
              const SizedBox(
                height: 220,
                width: double.infinity,
                child: Card(
                  color: ColorsManager.transparent,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildForecast(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: Theme.of(context).textTheme.labelMedium),
              Text('Next7Days',
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
                itemCount: 13,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _forecastItemsList(context, index)),
          ),
        ],
      );

  Widget _forecastItemsList(BuildContext context, int index) => Padding(
        padding: (index == 12)
            ? EdgeInsets.zero
            : const EdgeInsets.only(right: PaddingValues.p16),
        child: Column(
          children: [
            Text('0${index}PM', style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: SizeValues.s8),
            const Icon(Icons.sunny, color: Colors.amber, size: SizeValues.s32),
            const SizedBox(height: SizeValues.s8),
            Text('24°', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      );
}
