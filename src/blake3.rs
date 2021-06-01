use crate::into::const_u8;
use blake3::Hasher;
use core::slice;
// use dart_sdk_sys::{Dart_Handle, Dart_NewFinalizableHandle};
use safer_ffi::prelude::*;

#[derive_ReprC]
#[ReprC::opaque]
pub struct Blake3Hasher {
  pub h: Hasher,
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
  return const_u8(*hasher.h.finalize().as_bytes());
}

/*

fn _blake3_hasher_gc(isolate_callback_data: *mut c_void, peer: *mut c_void) {
  drop(peer);
}

#[ffi_export]
pub fn blake3_hasher_gc(object: Dart_Handle, peer: *mut c_void) {
  Dart_NewFinalizableHandle(object, peer, 0, _blake3_hasher_gc)
}
*/
