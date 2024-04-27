import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logging/logging.dart';
import 'package:news_app/app_bindings.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  enableLogger();
  runApp(const MainApp());
}

void enableLogger() {
  final log = Logger('logger');

  Logger.root.level =
      kDebugMode ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    developer.log(record.message,
        error: record.error,
        level: record.level.value,
        name: '${record.level.name.padRight(7, ' ')} ${record.loggerName}',
        sequenceNumber: record.sequenceNumber,
        stackTrace: record.stackTrace,
        time: record.time,
        zone: record.zone);
  });

  if (kDebugMode) {
    log.finest('Logging logger ${Level.FINEST.value} "Finest"');
    log.finer('Logging logger ${Level.FINER.value} "Finer"');
    log.fine('Logging logger ${Level.FINE.value} "Fine"');
    log.config('Logging logger ${Level.CONFIG.value} "Config"');
    log.info('Logging logger ${Level.INFO.value} "Info"');
    log.warning('Logging logger ${Level.WARNING.value} "Warning"');
    log.severe('Logging logger ${Level.SEVERE.value} "Severe"');
    log.shout('Logging logger ${Level.SHOUT.value} "Shout"');
    log.log(const Level('CUSTOM', 1600), 'Logging logger 1600 "custom"');
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: NAppTheme.light,
      initialBinding: AppBindings(),
      // home: const LoginPage(),
    );
  }
}
