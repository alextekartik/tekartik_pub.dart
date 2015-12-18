@TestOn("vm")
library tekartik_pub.test.pub_test;

import 'dart:mirrors';
import 'package:path/path.dart';
import 'package:dev_test/test.dart';
import 'package:tekartik_pub/pub.dart';

class _TestUtils {
  static final String scriptPath =
      (reflectClass(_TestUtils).owner as LibraryMirror).uri.toFilePath();
}

String get testScriptPath => _TestUtils.scriptPath;
String get packageRoot => dirname(dirname(testScriptPath));

void main() => defineTests();

void defineTests() {
  //useVMConfiguration();
  group('pub', () {
    group('pub_package', () {
      test('equals', () {
        PubPackage pkg1 = new PubPackage(packageRoot);
        expect(pkg1, pkg1);
        PubPackage pkg2 = new PubPackage(packageRoot);
        expect(pkg1.hashCode, pkg2.hashCode);
        expect(pkg1, pkg2);
      });
    });
  });
}
