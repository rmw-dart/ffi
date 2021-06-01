use crate::const_u8::const_u8;
use core::slice;
use safer_ffi::prelude::*;
use std::convert::TryInto;
use x25519_dalek::{PublicKey, StaticSecret};

#[derive_ReprC]
#[ReprC::opaque]
pub struct X25519Secret {
  pub s: StaticSecret,
}

#[ffi_export]
pub fn x25519_sk_from_bytes(seed: *const u8) -> repr_c::Box<X25519Secret> {
  let seed: [u8; 32] = unsafe { slice::from_raw_parts(seed, 32) }
    .try_into()
    .unwrap();

  repr_c::Box::new(X25519Secret {
    s: StaticSecret::from(seed),
  })
}

#[ffi_export]
pub fn x25519_sk_diffie_hellman(secret: &mut X25519Secret, pk: *const u8) -> *const u8 {
  let pk: [u8; 32] = unsafe { slice::from_raw_parts(pk, 32) }.try_into().unwrap();
  return const_u8(*secret.s.diffie_hellman(&PublicKey::from(pk)).as_bytes());
}
