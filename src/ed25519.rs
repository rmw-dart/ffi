use core::slice;
use ed25519_dalek_blake3::{Keypair, PublicKey, SecretKey, Signature, Signer, Verifier};
use rand::Rng;
use safer_ffi::prelude::*;

/*
use rand::rngs::OsRng;

fn _seed() -> [u8; 32] {
  let mut rng = OsRng {};
  let keypair: Keypair = Keypair::generate(&mut rng);
  keypair.secret.to_bytes()
}
*/

#[derive_ReprC]
#[ReprC::opaque]
pub struct Ed25519Keypair {
  pub key: Keypair,
}

// randBytes

/*
TODO : 自动释放内存。
如何自动释放内存参考
https://github.com/dart-lang/sdk/issues/35770 dart:ffi GC finalizers
https://docs.rs/dart-sdk-sys/2.12.4/dart_sdk_sys/fn.Dart_NewFinalizableHandle.html
*/

#[ffi_export]
pub fn rand_u8_32() -> *const u8 {
  let b = Box::new(rand::thread_rng().gen::<[u8; 32]>());
  Box::into_raw(b) as *const u8
}

#[ffi_export]
pub fn ed25519_from_seed(data: *const u8) -> repr_c::Box<Ed25519Keypair> {
  let seed = unsafe { slice::from_raw_parts(data, 32) };
  let sk = SecretKey::from_bytes(&seed).unwrap();
  let mut skv = sk.as_bytes().to_vec();
  skv.extend_from_slice(PublicKey::from(&sk).as_bytes());
  repr_c::Box::new(Ed25519Keypair {
    key: Keypair::from_bytes(&skv as &[u8]).unwrap(),
  })
}

/*
#[ffi_export]
pub fn ed25519_verify(keypair: repr_c::Box<Ed25519Keypair>, data: *const u8, len: usize) -> bool {
  let sign = unsafe { slice::from_raw_parts(data, len) };
}
*/

#[ffi_export]
pub fn ed25519_sign(
  keypair: repr_c::Box<Ed25519Keypair>,
  data: *const u8,
  len: usize,
) -> c_slice::Box<u8> {
  let msg = unsafe { slice::from_raw_parts(data, len) };
  keypair
    .key
    .sign(msg)
    .to_bytes()
    .to_vec()
    .into_boxed_slice()
    .into()
}

/*
keypair(seed)
sign
pk

pk_from_bytes
verify
*/
