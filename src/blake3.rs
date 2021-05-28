use blake3::Hasher;
use core::slice;
use safer_ffi::prelude::*;

#[derive_ReprC]
#[ReprC::opaque]
pub struct Blake3Hasher {
  pub h: Hasher,
}

#[ffi_export]
pub fn blake3_hash_free(data: *mut u8) {
  unsafe {
    let p = std::slice::from_raw_parts_mut(data, 32).as_mut_ptr();
    Box::from_raw(p);
  }
}

#[ffi_export]
pub fn blake3_hash(data: *const u8, len: usize) -> *const u8 {
  let v = unsafe { slice::from_raw_parts(data, len) };
  let h = Box::new(*blake3::hash(&v).as_bytes());
  Box::into_raw(h) as *const u8
}

impl Blake3Hasher {
  pub fn new() -> Self {
    Self { h: Hasher::new() }
  }
}

#[ffi_export]
pub fn blake3_hasher_new() -> repr_c::Box<Blake3Hasher> {
  repr_c::Box::new(Blake3Hasher::new())
}

#[ffi_export]
pub fn blake3_hasher_update(hasher: &mut Blake3Hasher, data: *const u8, len: usize) {
  let v = unsafe { slice::from_raw_parts(data, len) };
  hasher.h.update(v);
}

#[ffi_export]
pub fn blake3_hasher_end(hasher: repr_c::Box<Blake3Hasher>) -> *const u8 {
  let h = Box::new(*hasher.h.finalize().as_bytes());
  drop(hasher);
  Box::into_raw(h) as *const u8
}
