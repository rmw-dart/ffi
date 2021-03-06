// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

class Ffi {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  Ffi(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  Ffi.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Uint8> blake3_hash(
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _blake3_hash(
      data,
      len,
    );
  }

  late final _blake3_hash_ptr =
      _lookup<ffi.NativeFunction<_c_blake3_hash>>('blake3_hash');
  late final _dart_blake3_hash _blake3_hash =
      _blake3_hash_ptr.asFunction<_dart_blake3_hash>();

  ffi.Pointer<Blake3Hasher> blake3_hasher_new() {
    return _blake3_hasher_new();
  }

  late final _blake3_hasher_new_ptr =
      _lookup<ffi.NativeFunction<_c_blake3_hasher_new>>('blake3_hasher_new');
  late final _dart_blake3_hasher_new _blake3_hasher_new =
      _blake3_hasher_new_ptr.asFunction<_dart_blake3_hasher_new>();

  void blake3_hasher_update(
    ffi.Pointer<Blake3Hasher> hasher,
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _blake3_hasher_update(
      hasher,
      data,
      len,
    );
  }

  late final _blake3_hasher_update_ptr =
      _lookup<ffi.NativeFunction<_c_blake3_hasher_update>>(
          'blake3_hasher_update');
  late final _dart_blake3_hasher_update _blake3_hasher_update =
      _blake3_hasher_update_ptr.asFunction<_dart_blake3_hasher_update>();

  ffi.Pointer<ffi.Uint8> blake3_hasher_end(
    ffi.Pointer<Blake3Hasher> hasher,
  ) {
    return _blake3_hasher_end(
      hasher,
    );
  }

  late final _blake3_hasher_end_ptr =
      _lookup<ffi.NativeFunction<_c_blake3_hasher_end>>('blake3_hasher_end');
  late final _dart_blake3_hasher_end _blake3_hasher_end =
      _blake3_hasher_end_ptr.asFunction<_dart_blake3_hasher_end>();

  void blake3_gc_bind(
    Object handle,
    ffi.Pointer<ffi.Void> pointer,
  ) {
    return _blake3_gc_bind(
      handle,
      pointer,
    );
  }

  late final _blake3_gc_bind_ptr =
      _lookup<ffi.NativeFunction<_c_blake3_gc_bind>>('blake3_gc_bind');
  late final _dart_blake3_gc_bind _blake3_gc_bind =
      _blake3_gc_bind_ptr.asFunction<_dart_blake3_gc_bind>();

  ffi.Pointer<ffi.Uint8> rand_u8_32() {
    return _rand_u8_32();
  }

  late final _rand_u8_32_ptr =
      _lookup<ffi.NativeFunction<_c_rand_u8_32>>('rand_u8_32');
  late final _dart_rand_u8_32 _rand_u8_32 =
      _rand_u8_32_ptr.asFunction<_dart_rand_u8_32>();

  ffi.Pointer<Ed25519Keypair> ed25519_from_seed(
    ffi.Pointer<ffi.Uint8> data,
  ) {
    return _ed25519_from_seed(
      data,
    );
  }

  late final _ed25519_from_seed_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_from_seed>>('ed25519_from_seed');
  late final _dart_ed25519_from_seed _ed25519_from_seed =
      _ed25519_from_seed_ptr.asFunction<_dart_ed25519_from_seed>();

  bool ed25519_verify(
    ffi.Pointer<Ed25519Keypair> keypair,
    ffi.Pointer<ffi.Uint8> sign,
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _ed25519_verify(
          keypair,
          sign,
          data,
          len,
        ) !=
        0;
  }

  late final _ed25519_verify_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_verify>>('ed25519_verify');
  late final _dart_ed25519_verify _ed25519_verify =
      _ed25519_verify_ptr.asFunction<_dart_ed25519_verify>();

  ffi.Pointer<ffi.Uint8> ed25519_sk(
    ffi.Pointer<Ed25519Keypair> keypair,
  ) {
    return _ed25519_sk(
      keypair,
    );
  }

  late final _ed25519_sk_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_sk>>('ed25519_sk');
  late final _dart_ed25519_sk _ed25519_sk =
      _ed25519_sk_ptr.asFunction<_dart_ed25519_sk>();

  ffi.Pointer<ffi.Uint8> ed25519_pk_x25519_pk(
    ffi.Pointer<ffi.Uint8> pk,
  ) {
    return _ed25519_pk_x25519_pk(
      pk,
    );
  }

  late final _ed25519_pk_x25519_pk_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_pk_x25519_pk>>(
          'ed25519_pk_x25519_pk');
  late final _dart_ed25519_pk_x25519_pk _ed25519_pk_x25519_pk =
      _ed25519_pk_x25519_pk_ptr.asFunction<_dart_ed25519_pk_x25519_pk>();

  ffi.Pointer<ffi.Uint8> ed25519_x25519_pk(
    ffi.Pointer<Ed25519Keypair> keypair,
  ) {
    return _ed25519_x25519_pk(
      keypair,
    );
  }

  late final _ed25519_x25519_pk_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_x25519_pk>>('ed25519_x25519_pk');
  late final _dart_ed25519_x25519_pk _ed25519_x25519_pk =
      _ed25519_x25519_pk_ptr.asFunction<_dart_ed25519_x25519_pk>();

  ffi.Pointer<ffi.Uint8> ed25519_pk(
    ffi.Pointer<Ed25519Keypair> keypair,
  ) {
    return _ed25519_pk(
      keypair,
    );
  }

  late final _ed25519_pk_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_pk>>('ed25519_pk');
  late final _dart_ed25519_pk _ed25519_pk =
      _ed25519_pk_ptr.asFunction<_dart_ed25519_pk>();

  bool ed25519_pk_verify(
    ffi.Pointer<ffi.Uint8> pk,
    ffi.Pointer<ffi.Uint8> sign,
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _ed25519_pk_verify(
          pk,
          sign,
          data,
          len,
        ) !=
        0;
  }

  late final _ed25519_pk_verify_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_pk_verify>>('ed25519_pk_verify');
  late final _dart_ed25519_pk_verify _ed25519_pk_verify =
      _ed25519_pk_verify_ptr.asFunction<_dart_ed25519_pk_verify>();

  ffi.Pointer<ffi.Uint8> ed25519_sign(
    ffi.Pointer<Ed25519Keypair> keypair,
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _ed25519_sign(
      keypair,
      data,
      len,
    );
  }

  late final _ed25519_sign_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_sign>>('ed25519_sign');
  late final _dart_ed25519_sign _ed25519_sign =
      _ed25519_sign_ptr.asFunction<_dart_ed25519_sign>();

  void ed25519_free(
    ffi.Pointer<Ed25519Keypair> keypair,
  ) {
    return _ed25519_free(
      keypair,
    );
  }

  late final _ed25519_free_ptr =
      _lookup<ffi.NativeFunction<_c_ed25519_free>>('ed25519_free');
  late final _dart_ed25519_free _ed25519_free =
      _ed25519_free_ptr.asFunction<_dart_ed25519_free>();

  ffi.Pointer<X25519Secret> x25519_sk_from_bytes(
    ffi.Pointer<ffi.Uint8> seed,
  ) {
    return _x25519_sk_from_bytes(
      seed,
    );
  }

  late final _x25519_sk_from_bytes_ptr =
      _lookup<ffi.NativeFunction<_c_x25519_sk_from_bytes>>(
          'x25519_sk_from_bytes');
  late final _dart_x25519_sk_from_bytes _x25519_sk_from_bytes =
      _x25519_sk_from_bytes_ptr.asFunction<_dart_x25519_sk_from_bytes>();

  ffi.Pointer<ffi.Uint8> x25519_sk_diffie_hellman(
    ffi.Pointer<X25519Secret> secret,
    ffi.Pointer<ffi.Uint8> pk,
  ) {
    return _x25519_sk_diffie_hellman(
      secret,
      pk,
    );
  }

  late final _x25519_sk_diffie_hellman_ptr =
      _lookup<ffi.NativeFunction<_c_x25519_sk_diffie_hellman>>(
          'x25519_sk_diffie_hellman');
  late final _dart_x25519_sk_diffie_hellman _x25519_sk_diffie_hellman =
      _x25519_sk_diffie_hellman_ptr
          .asFunction<_dart_x25519_sk_diffie_hellman>();

  void free_u8(
    ffi.Pointer<ffi.Uint8> data,
    int len,
  ) {
    return _free_u8(
      data,
      len,
    );
  }

  late final _free_u8_ptr = _lookup<ffi.NativeFunction<_c_free_u8>>('free_u8');
  late final _dart_free_u8 _free_u8 = _free_u8_ptr.asFunction<_dart_free_u8>();

  void free_u8_32(
    ffi.Pointer<ffi.Uint8> data,
  ) {
    return _free_u8_32(
      data,
    );
  }

  late final _free_u8_32_ptr =
      _lookup<ffi.NativeFunction<_c_free_u8_32>>('free_u8_32');
  late final _dart_free_u8_32 _free_u8_32 =
      _free_u8_32_ptr.asFunction<_dart_free_u8_32>();
}

class __mbstate_t extends ffi.Union {
  @ffi.Array.multi([128])
  external ffi.Array<ffi.Int8> __mbstate8;

  @ffi.Int64()
  external int _mbstateL;
}

class __darwin_pthread_handler_rec extends ffi.Struct {
  external ffi.Pointer<ffi.NativeFunction<_typedefC_1>> __routine;

  external ffi.Pointer<ffi.Void> __arg;

  external ffi.Pointer<__darwin_pthread_handler_rec> __next;
}

class _opaque_pthread_attr_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_cond_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([40])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_condattr_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_mutex_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_mutexattr_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_once_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_rwlock_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([192])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_rwlockattr_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  @ffi.Array.multi([16])
  external ffi.Array<ffi.Int8> __opaque;
}

class _opaque_pthread_t extends ffi.Struct {
  @ffi.Int64()
  external int __sig;

  external ffi.Pointer<__darwin_pthread_handler_rec> __cleanup_stack;

  @ffi.Array.multi([8176])
  external ffi.Array<ffi.Int8> __opaque;
}

class Blake3Hasher extends ffi.Opaque {}

class _Dart_Handle extends ffi.Opaque {}

class Ed25519Keypair extends ffi.Opaque {}

class X25519Secret extends ffi.Opaque {}

const int __DARWIN_ONLY_64_BIT_INO_T = 0;

const int __DARWIN_ONLY_UNIX_CONFORMANCE = 1;

const int __DARWIN_ONLY_VERS_1050 = 0;

const int __DARWIN_UNIX03 = 1;

const int __DARWIN_64_BIT_INO_T = 1;

const int __DARWIN_VERS_1050 = 1;

const int __DARWIN_NON_CANCELABLE = 0;

const String __DARWIN_SUF_64_BIT_INO_T = '\$INODE64';

const String __DARWIN_SUF_1050 = '\$1050';

const String __DARWIN_SUF_EXTSN = '\$DARWIN_EXTSN';

const int __DARWIN_C_ANSI = 4096;

const int __DARWIN_C_FULL = 900000;

const int __DARWIN_C_LEVEL = 900000;

const int __STDC_WANT_LIB_EXT1__ = 1;

const int __DARWIN_NO_LONG_LONG = 0;

const int _DARWIN_FEATURE_64_BIT_INODE = 1;

const int _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;

const int _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;

const int __DARWIN_NULL = 0;

const int __PTHREAD_SIZE__ = 8176;

const int __PTHREAD_ATTR_SIZE__ = 56;

const int __PTHREAD_MUTEXATTR_SIZE__ = 8;

const int __PTHREAD_MUTEX_SIZE__ = 56;

const int __PTHREAD_CONDATTR_SIZE__ = 8;

const int __PTHREAD_COND_SIZE__ = 40;

const int __PTHREAD_ONCE_SIZE__ = 8;

const int __PTHREAD_RWLOCK_SIZE__ = 192;

const int __PTHREAD_RWLOCKATTR_SIZE__ = 16;

const int __DARWIN_WCHAR_MAX = 2147483647;

const int __DARWIN_WCHAR_MIN = -2147483648;

const int __DARWIN_WEOF = -1;

const int _FORTIFY_SOURCE = 2;

const int NULL = 0;

const int USER_ADDR_NULL = 0;

const int __WORDSIZE = 64;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -32768;

const int INT_FAST32_MIN = -2147483648;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 32767;

const int INT_FAST32_MAX = 2147483647;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = 65535;

const int UINT_FAST32_MAX = 4294967295;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MAX = 9223372036854775807;

const int INTPTR_MIN = -9223372036854775808;

const int UINTPTR_MAX = -1;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIZE_MAX = -1;

const int RSIZE_MAX = 9223372036854775807;

const int WCHAR_MAX = 2147483647;

const int WCHAR_MIN = -2147483648;

const int WINT_MIN = -2147483648;

const int WINT_MAX = 2147483647;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const int true_1 = 1;

const int false_1 = 0;

const int __bool_true_false_are_defined = 1;

typedef _c_blake3_hash = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_blake3_hash = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_blake3_hasher_new = ffi.Pointer<Blake3Hasher> Function();

typedef _dart_blake3_hasher_new = ffi.Pointer<Blake3Hasher> Function();

typedef _c_blake3_hasher_update = ffi.Void Function(
  ffi.Pointer<Blake3Hasher> hasher,
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_blake3_hasher_update = void Function(
  ffi.Pointer<Blake3Hasher> hasher,
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_blake3_hasher_end = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Blake3Hasher> hasher,
);

typedef _dart_blake3_hasher_end = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Blake3Hasher> hasher,
);

typedef _c_blake3_gc_bind = ffi.Void Function(
  ffi.Handle handle,
  ffi.Pointer<ffi.Void> pointer,
);

typedef _dart_blake3_gc_bind = void Function(
  Object handle,
  ffi.Pointer<ffi.Void> pointer,
);

typedef _c_rand_u8_32 = ffi.Pointer<ffi.Uint8> Function();

typedef _dart_rand_u8_32 = ffi.Pointer<ffi.Uint8> Function();

typedef _c_ed25519_from_seed = ffi.Pointer<Ed25519Keypair> Function(
  ffi.Pointer<ffi.Uint8> data,
);

typedef _dart_ed25519_from_seed = ffi.Pointer<Ed25519Keypair> Function(
  ffi.Pointer<ffi.Uint8> data,
);

typedef _c_ed25519_verify = ffi.Uint8 Function(
  ffi.Pointer<Ed25519Keypair> keypair,
  ffi.Pointer<ffi.Uint8> sign,
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_ed25519_verify = int Function(
  ffi.Pointer<Ed25519Keypair> keypair,
  ffi.Pointer<ffi.Uint8> sign,
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_ed25519_sk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _dart_ed25519_sk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _c_ed25519_pk_x25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> pk,
);

typedef _dart_ed25519_pk_x25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> pk,
);

typedef _c_ed25519_x25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _dart_ed25519_x25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _c_ed25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _dart_ed25519_pk = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _c_ed25519_pk_verify = ffi.Uint8 Function(
  ffi.Pointer<ffi.Uint8> pk,
  ffi.Pointer<ffi.Uint8> sign,
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_ed25519_pk_verify = int Function(
  ffi.Pointer<ffi.Uint8> pk,
  ffi.Pointer<ffi.Uint8> sign,
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_ed25519_sign = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_ed25519_sign = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<Ed25519Keypair> keypair,
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_ed25519_free = ffi.Void Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _dart_ed25519_free = void Function(
  ffi.Pointer<Ed25519Keypair> keypair,
);

typedef _c_x25519_sk_from_bytes = ffi.Pointer<X25519Secret> Function(
  ffi.Pointer<ffi.Uint8> seed,
);

typedef _dart_x25519_sk_from_bytes = ffi.Pointer<X25519Secret> Function(
  ffi.Pointer<ffi.Uint8> seed,
);

typedef _c_x25519_sk_diffie_hellman = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<X25519Secret> secret,
  ffi.Pointer<ffi.Uint8> pk,
);

typedef _dart_x25519_sk_diffie_hellman = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<X25519Secret> secret,
  ffi.Pointer<ffi.Uint8> pk,
);

typedef _c_free_u8 = ffi.Void Function(
  ffi.Pointer<ffi.Uint8> data,
  ffi.Uint64 len,
);

typedef _dart_free_u8 = void Function(
  ffi.Pointer<ffi.Uint8> data,
  int len,
);

typedef _c_free_u8_32 = ffi.Void Function(
  ffi.Pointer<ffi.Uint8> data,
);

typedef _dart_free_u8_32 = void Function(
  ffi.Pointer<ffi.Uint8> data,
);

typedef _typedefC_1 = ffi.Void Function(
  ffi.Pointer<ffi.Void>,
);
