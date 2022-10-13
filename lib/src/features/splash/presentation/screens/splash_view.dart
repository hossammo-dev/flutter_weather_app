import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../resources_paths.dart';




class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  void _initTimer() {
    _timer = Timer(const Duration(milliseconds: Constants.splashDuration), _goNext);
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
