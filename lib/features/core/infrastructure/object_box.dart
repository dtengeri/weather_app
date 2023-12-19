import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: join(docsDir.path, "weahter-app-objectbox"),
    );
    return ObjectBox._create(store);
  }
}
