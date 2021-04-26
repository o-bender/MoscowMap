import 'package:flutter_map/plugin_api.dart' as flutter_map;
import 'package:proj4dart/proj4dart.dart';

// Альтернативный вариант
// final MSK77 = Projection.add('MSK77', '+proj=tmerc +ellps=bessel +towgs84=367.93,88.45,553.73,-0.8777,1.3231,2.6248,8.96 +units=m +lon_0=37.5 +lat_0=55.66666666667 +k_0=1 +x_0=0 +y_0=0');

// Параметры координатной сетки доступны на странице
// https://apieatlas.mos.ru/arcgis/rest/services/egko_122018/MapServer
final MSK77 = Projection.add('MSK77', 'PROJCS["Moscow_bessel",GEOGCS["GCS_Bessel_Moscow",DATUM["D_Bessel_Moscow",SPHEROID["Bessel_Moscow",6377397.0,299.15]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",0.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",37.5],PARAMETER["Scale_Factor",1.0],PARAMETER["Latitude_Of_Origin",55.66666666666666],UNIT["Meter",1.0]]');
final resolutions = <double>[
  132.2919312505292,
  66.1459656252646,
  26.458386250105836,
  13.229193125052918,
  7.9375158750317505,
  3.9687579375158752,
  2.6458386250105836,
  1.9843789687579376,
  1.3229193125052918,
  0.9260435187537043,
  0.5291677250021167,
  0.26458386250105836,
  0.13229193125052918,
  0.06614596562526459,
];
final bounds = flutter_map.Bounds<double>(
  flutter_map.CustomPoint(-87315.9951, -71154.38040000011),
  flutter_map.CustomPoint(101596.8827, 77218.6169000007),
);

final maxZoom = (resolutions.length - 1).toDouble();

final MSK77crc = flutter_map.Proj4Crs.fromFactory(
  code: 'MSK77',
  proj4Projection: MSK77,
  resolutions: resolutions,
  bounds: bounds,
  origins: [flutter_map.CustomPoint(-5622500.0, 3830200.0)],
  scales: null,
  transformation: null,
);