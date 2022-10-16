import 'package:flutter/material.dart';

import '../../../../../../resources_paths.dart';


class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingValues.p12),
          child: Column(
            children: [
              Expanded(child: _buildWeatherCard(context, Constants.bgImage)),
              const SizedBox(height: SizeValues.s20),
              _buildForecast(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context, String bgImage) => Card(
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
                      Text("New York",
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  //time
                  Row(
                    children: [
                      Text("Today",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(width: SizeValues.s1),
                      Text("12:48 PM",
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SizeValues.s40),

              //body
              Text("22°", style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: SizeValues.s20),
              Text("Mostly Clear",
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
                      Text("720hpa",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: ColorsManager.whiteColor,
                          size: SizeValues.s16),
                      const SizedBox(width: SizeValues.s4),
                      Text("32%",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.ac_unit,
                          color: ColorsManager.whiteColor,
                          size: SizeValues.s16),
                      const SizedBox(width: SizeValues.s4),
                      Text("120km/h",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SizeValues.s20),
              const SizedBox(
                height: 220,
                width: double.infinity,
                child: Card(),
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
          Text('Next7Days', style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
            itemBuilder: (context, index) => _forecastItemsList(context ,index)),
      ),
    ],
  );

  Widget _forecastItemsList(BuildContext context, int index) => Padding(
    padding: (index == 12) ? EdgeInsets.zero : const EdgeInsets.only(right: PaddingValues.p16),
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
