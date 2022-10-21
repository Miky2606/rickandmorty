import 'package:flutter/material.dart';

LinearGradient normal = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color.fromARGB(242, 117, 212, 8),
      Color.fromARGB(104, 14, 161, 9),
    ],
    stops: [
      0.0,
      0.9
    ]);

LinearGradient deadGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      const Color.fromARGB(255, 247, 22, 6).withOpacity(0.8),
      const Color.fromARGB(71, 219, 9, 9),
    ],
    stops: const [
      0.1,
      1
    ]);
