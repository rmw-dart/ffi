use crate::into::const_u8;
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

/*
TODO : 自动释放内存。
如何自动释放内存参考
https://github.com/dart-lang/sdk/issues/35770 dart:ffi GC finalizers
https://docs.rs/dart-sdk-sys/2.12.4/dart_sdk_sys/fn.Dart_NewFinalizableHandle.html
*/

#[ffi_export]
pub fn rand_u8_32() -> *const u8 {
  const_u8(rand::thread_rng().gen::<[u8; 32]>())
}

#[ffi_export]
pub fn ed25519_from_seed(data: *const u8) -> repr_c::Box<Ed25519Keypair> {
  let seed = unsafe { slice::from_raw_parts(data, 32) };
  let sk = SecretKey::from_bytes(&seed).unwrap();
  repr_c::Box::new(Ed25519Keypair {
    key: Keypair {
      public: PublicKey::from(&sk),
      secret: sk,
    },
  })
}

#[ffi_export]
pub fn ed25519_verify(
  keypair: &mut Ed25519Keypair,
  sign: *const u8,
  data: *const u8,
  len: usize,
) -> bool {
  _verify(keypair.key.public, sign, data, len)
}

#[ffi_export]
pub fn ed25519_sk(keypair: &mut Ed25519Keypair) -> *const u8 {
  const_u8(*keypair.key.secret.as_bytes())
}

#[ffi_export]
pub fn ed25519_pk(keypair: &mut Ed25519Keypair) -> *const u8 {
  const_u8(*keypair.key.public.as_bytes())
}

#[ffi_export]
pub fn ed25519_pk_verify(pk: *const u8, sign: *const u8, data: *const u8, len: usize) -> bool {
  let pk = unsafe { slice::from_raw_parts(pk, 32) };
  let pk = PublicKey::from_bytes(pk).unwrap();
  _verify(pk, sign, data, len)
}

#[inline]
pub fn _verify(pk: PublicKey, sign: *const u8, data: *const u8, len: usize) -> bool {
  let data = unsafe { slice::from_raw_parts(data, len) };
  let sign = unsafe { slice::from_raw_parts(sign, 64) };
  let signature = Signature::try_from(sign).unwrap();
  pk.verify(data, &signature).is_ok()
}

#[ffi_export]
pub fn ed25519_sign(keypair: &mut Ed25519Keypair, data: *const u8, len: usize) -> *const u8 {
  let msg = unsafe { slice::from_raw_parts(data, len) };
  const_u8(keypair.key.sign(msg).to_bytes())
}

#[ffi_export]
pub fn ed25519_free(keypair: repr_c::Box<Ed25519Keypair>) {
  drop(keypair)
}
