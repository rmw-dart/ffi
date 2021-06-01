import './Ffi.dart' as Ffi;
import 'dart:typed_data' show Uint8List;
import './So.dart' show So, Uint8ListPointer;
import 'dart:ffi' show Uint8Pointer, Pointer;
import 'package:ffi/ffi.dart' show calloc;

/*
   Uint8List hash(Uint8List data) {
   final ptr = data.ptr();
   final h = So.blake3_hash(ptr, data.length);
   calloc.free(ptr);
   final hash = Uint8List.fromList(h.asTypedList(32));
   So.blake3_hash_free(h);
   return hash;
   }

   class Hasher {
   late Pointer<Ffi.Blake3Hasher> hasher;
   Hasher() {
   this.hasher = So.blake3_hasher_new();
   }
   void update(Uint8List data) {
   final ptr = data.ptr();
   So.blake3_hasher_update(this.hasher, ptr, data.length);
   calloc.free(ptr);
   }

   Uint8List end() {
   final h = So.blake3_hasher_end(this.hasher);
   final hash = Uint8List.fromList(h.asTypedList(32));
   So.blake3_hash_free(h);
   return hash;
   }
   }
   */

Uint8List rand_u8_32() {
  final ptr = So.rand_u8_32();
  final r = Uint8List.fromList(ptr.asTypedList(32));
  So.free_u8_32(ptr);
  return r;
}

class Ed25519 {
  late Pointer<Ffi.Ed25519Keypair> keypair;
  Ed25519(Uint8List seed) {
    final ptr = seed.ptr();
    this.keypair = So.ed25519_from_seed(ptr);
    calloc.free(ptr);
  }
  Uint8List sign(Uint8List msg) {
    final ptr = msg.ptr();
    final sptr = So.ed25519_sign(this.keypair, ptr, msg.length);
    calloc.free(ptr);
    final r = Uint8List.fromList(sptr.asTypedList(64));
    So.free_u8(sptr, 64);
    return r;
  }
}
