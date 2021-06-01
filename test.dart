import 'dart:convert' show utf8, base64;
import './lib/rmw.dart' show hash, Hasher, rand_u8_32, Ed25519;

void main() {
  var n = 0;
  final seed = rand_u8_32();
  print("seed $seed");
  final ed25519 = Ed25519(seed);
  while (true) {
    final data = utf8.encoder.convert("$n");

    final sign = ed25519.sign(data);

    final h = hash(data);
    final hasher = Hasher();
    hasher.update(data);
    hasher.update(data);
    final h2 = hasher.end();
    if (n % 10000 == 0) {
      print('$n');
      print('  ed25519 ${base64.encode(sign)}');
      print('  ${base64.encode(h)} ${base64.encode(h2)}');
    }
    n++;
  }
}
