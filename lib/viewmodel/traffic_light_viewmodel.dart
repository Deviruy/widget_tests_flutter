import 'dart:async';
import 'package:flutter/material.dart';

class TrafficLightViewmodel extends ChangeNotifier {
  Timer? _timer;
  bool _isRed = true;
  bool _isYellow = true;
  bool _isGreen = true;

  bool get isRed => _isRed;
  bool get isYellow => _isYellow;
  bool get isGreen => _isGreen;

  void turnRed() {
    _cancelTimer();

    _isGreen = false;
    _isRed = false;
    notifyListeners();

    _timer = Timer(Duration(milliseconds: 200), () {
      _isYellow = true;
      notifyListeners();

      _timer = Timer(Duration(seconds: 2), () {
        _isYellow = false;
        _isRed = true;
        notifyListeners();
      });
    });
  }

  void turnGreen() {
    _cancelTimer();

    _isGreen = true;
    _isYellow = false;
    _isRed = false;
    notifyListeners();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }
}
