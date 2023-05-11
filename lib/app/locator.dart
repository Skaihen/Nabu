import 'package:get_it/get_it.dart';

import '../services/tasks.services.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => TasksService());
}
