<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# dart.blake3.rust

##  编译脚本

运行 ./build.sh 生成 so

运行 ./test.sh 测试

## 使用演示

```dart
import 'dart:convert' show utf8, base64;
import './lib/rmw.dart'
    show init, hash, Hasher, rand_u8_32, Ed25519, ed25519_verify;

void main() {
  init();
  var n = 0;
  while (true) {
    ++n;
    final seed = rand_u8_32();
    final hasher = Hasher();
    hasher.update(seed);
    if (n % 100000 == 0) {
      print(hasher.end());
    }
  }
  return;
  /*
     var n = 0;
     final seed = rand_u8_32();
     final ed25519 = Ed25519(seed);
     final pk = ed25519.pk();
     print("pk $pk\nseed $seed ");
     while (true) {
     final data = utf8.encoder.convert("$n");

     final sign = ed25519.sign(data);
     final verify1 = ed25519.verify(sign, data);
     final verify2 = ed25519_verify(pk, sign, data);
     final h = hash(data);
     final hasher = Hasher();
     hasher.update(data);
     hasher.update(data);
     final h2 = hasher.end();
     if (n % 1000000 == 0) {
     print('$n');
     print('  ed25519 $verify1 $verify2 ${base64.encode(sign)}');
     print('  ${base64.encode(h)} ${base64.encode(h2)}');
     }
     n++;
  }
     */
}

```

## 参考文献

* [引入更安全的FFI](https://www.ditto.live/blog/posts/introducing-safer-ffi)
* [How to call a Rust function from Dart using FFI](https://medium.com/flutter-community/how-to-call-a-rust-function-from-dart-using-ffi-f48f3ea3af2c)
* [如何将字节数组从Rust函数返回到FFI C？](https://users.rust-lang.org/t/how-to-return-byte-array-from-rust-function-to-ffi-c/18136/16)
* [其他语言使用Rust对象](http://jakegoulding.com/rust-ffi-omnibus/objects/)

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)
