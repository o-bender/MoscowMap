import 'package:flutter/material.dart';
import 'package:moscow_map/map.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moscow Map',
      home: MoscowMapView(),
    );
  }
}
