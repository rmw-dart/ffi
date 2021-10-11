import 'dart:convert' show utf8, base64;
import './lib/rmw.dart'
show init, hash, Hasher, rand_u8_32, Ed25519, ed25519_verify;

void main() {
  init();
  while (true) {
    final seed = rand_u8_32();
    final hasher = Hasher();
    hasher.update(seed);
    print(hasher.end());
  }
  return;
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
    if (n % 10000 == 0) {
      print('$n');
      print('  ed25519 $verify1 $verify2 ${base64.encode(sign)}');
      print('  ${base64.encode(h)} ${base64.encode(h2)}');
    }
    n++;
  }
}
