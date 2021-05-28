use core::slice;
use ed25519_dalek_blake3::{PublicKey, SecretKey};
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
pub struct Ed25519Secret {
  pub key: SecretKey,
}

// randBytes

#[ffi_export]
pub fn ed25519_secret_from_bytes(data: *const u8) -> repr_c::Box<Ed25519Secret> {
  let seed = unsafe { slice::from_raw_parts(data, 32) };
  repr_c::Box::new(Ed25519Secret {
    key: SecretKey::from_bytes(seed).unwrap(),
  })
}

/*
keypair(seed)
sign
pk

pk_from_bytes
verify
*/

/*
pub static ref ED25519: Keypair = {
  let sk = SecretKey::from_bytes(&SEED.to_owned()).unwrap();
  let mut skv = sk.as_bytes().to_vec();
  skv.extend_from_slice(PublicKey::from(&sk).as_bytes());
  Keypair::from_bytes(&skv as &[u8]).unwrap()
};
*/
