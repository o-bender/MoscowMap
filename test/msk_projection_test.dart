import 'package:moscow_map/msk77_projection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;

void main() async {
  testWidgets('Конвертация координат', (WidgetTester tester) async {
    // raw - значение из geolocation в формате WGS84
    // msk - ожидаемое расчётное значение в формате MSK77
    // msk_control_value - значение из таблицы
    // wgs84 - ожидаемое рачётное значение обратного преобразования в WGS84
    final List<Map<String, List<double>>> rawCoordinates = [
      {
        'raw': [37.8404948, 55.8143020],
        'msk': [21343.80093880347,  16426.144436673596],
'msk_control_value': [21456.800970703112, 16449.412538546138],
      'wgs84': [37.8404948, 55.8143020603552],
      },
      {
        'raw': [37.7395794, 55.7503528],
        'msk': [15042.585493184604, 9280.48587841579],
'msk_control_value': [15154.859429975855, 9303.078525159508],
      'wgs84': [37.7395794, 55.750352860415326],
      },
      {
        'raw': [37.7427283, 55.6372816],
        'msk': [15284.345645046204, -3306.3375037190826],
'msk_control_value': [15396.513718338476, -3285.048014946282],
      'wgs84': [37.7427283, 55.63728166052092]
      },
      {
        'raw': [37.7147287, 55.7953978],
        'msk': [13466.73691202734, 14290.019910030433],
'msk_control_value': [13578.902781981353, 14313.148459692486],
      'wgs84': [37.7147287, 55.79539786037301]
      },
    ];
    for (final coordinates in rawCoordinates) {
      final List<double> raw = coordinates['raw'];
      final List<double> msk = coordinates['msk'];
      final List<double> wgs84 = coordinates['wgs84'];

      final cp = proj4.Projection.WGS84.transform(MSK77, proj4.Point(x: raw[0], y: raw[1]));
      expect([cp.x, cp.y], msk);

      final point = MSK77.transform(proj4.Projection.WGS84, proj4.Point(x: cp.x, y: cp.y));
      expect([point.x, point.y], wgs84);
    }
  });
}
