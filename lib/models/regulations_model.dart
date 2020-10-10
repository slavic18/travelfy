import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Regulations {
  final String name;
  final String imageUrl;
  final Color color;

  const Regulations({
    @required this.name,
    @required this.imageUrl,
    this.color,
  });
}
