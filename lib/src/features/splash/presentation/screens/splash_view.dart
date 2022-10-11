import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/src/core/utils/assets_manager.dart';

import '../../../../config/routes/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  void _initTimer() {
    _timer = Timer(const Duration(milliseconds: 2000), _goNext);
  }

  void _goNext() =>
      Navigator.of(context).pushReplacementNamed(RoutesManager.mainRoute);

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsManager.logo),
      ),
    );
  }
}
