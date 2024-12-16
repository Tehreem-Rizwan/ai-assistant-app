import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;
  static Future<void> initialize() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: "mydata");
  }

  static bool get showonBoarding =>
      _box.get("showOnBoarding", defaultValue: true);

  static set showonBoarding(bool value) => _box.put("showOnBoarding", value);
}
