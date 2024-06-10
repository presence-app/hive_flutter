part of hive_flutter;

/// Flutter extensions for Hive.
extension HiveX on HiveInterface {
  /// Initializes Hive with the path from [getApplicationDocumentsDirectory].
  ///
  /// You can provide a appDocumentsDirPath to set appDir directly
  ///
  /// You can provide a [subDirPath] where the boxes should be stored.
  Future initFlutter({String? appDocumentsDirPath, String? subDirPath}) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      Directory appDir = appDocumentsDirPath != null
          ? Directory(appDocumentsDirPath)
          : await getApplicationDocumentsDirectory();
      var path = appDir.path;
      if (subDirPath != null) {
        path = path_helper.join(path, subDirPath);
      }
      init(path);
    }
  }
}
