import 'package:path/path.dart' as path;
import 'dart:ffi';
import './Ffi.dart' show Ffi;
import 'dart:io' show Platform;
import 'dart:typed_data' show Uint8List;
import 'package:ffi/ffi.dart' show calloc;

final DIR = path.dirname(Platform.script.toFilePath());

late final Ffi So;

void init() {
  final so = path.join(DIR, 'ffi.so');
  final dylib = DynamicLibrary.open(so);

  final init_api = dylib.lookupFunction<IntPtr Function(Pointer<Void>),
      int Function(Pointer<Void>)>("InitDartApiDL");
  final initResult = init_api(NativeApi.initializeApiDLData);
  assert(0 == initResult);

  So = Ffi(dylib);
}

extension Uint8ListPointer on Uint8List {
  // https://github.com/dart-lang/ffi/issues/31
  // Workaround: before does not allow direct pointer exposure
  Pointer<Uint8> ptr() {
    final ptr = calloc<Uint8>(length);
    final typedList = ptr.asTypedList(length);
    typedList.setAll(0, this);
    return ptr;
  }
}
