import './Ffi.dart' as Ffi;
import 'dart:typed_data' show Uint8List;
import './So.dart' show So, Uint8ListPointer, dylib;
import 'dart:ffi' show Uint8Pointer, Pointer;
import 'package:ffi/ffi.dart' show calloc;

Uint8List hash(Uint8List data) {
  final ptr = data.ptr();
  final h = So.blake3_hash(ptr, data.length);
  calloc.free(ptr);
  final hash = Uint8List.fromList(h.asTypedList(32));
  So.free_u8_32(h);
  return hash;
}

class Hasher {
  late Pointer<Ffi.Blake3Hasher> hasher;
  Hasher() {
    this.hasher = So.blake3_hasher_new();
    So.blake3_gc_bind(this, this.hasher.cast());
  }
  void update(Uint8List data) {
    final ptr = data.ptr();
    So.blake3_hasher_update(this.hasher, ptr, data.length);
    calloc.free(ptr);
  }

  Uint8List end() {
    final h = So.blake3_hasher_end(this.hasher);
    final hash = Uint8List.fromList(h.asTypedList(32));
    So.free_u8_32(h);
    return hash;
  }
}
