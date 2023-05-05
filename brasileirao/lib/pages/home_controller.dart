import 'package:flutter/material.dart';

import '../models/time.dart';
import '../models/titulo.dart';
import '../repositories/times_repository.dart';

class HomeController {
  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
