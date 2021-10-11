use crate::const_u8::const_u8;
use crate::dart::Dart_NewFinalizableHandle_DL_Trampolined;
use crate::dart_sdk::Dart_Handle;
use blake3::Hasher;
use core::slice;
use safer_ffi::prelude::*;
use static_init::dynamic;
use std::mem::size_of;

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

#[dynamic]
static SIZE: usize = size_of::<Blake3Hasher>();

pub extern "C" fn blake3_hasher_gced(
  isolate_callback_data: *mut libc::c_void,
  peer: *mut libc::c_void,
) {
  //unsafe { slice::from_raw_parts(peer, *SIZE) };
}

#[ffi_export]
pub fn blake3_hasher_gc(object: Dart_Handle, peer: *mut Blake3Hasher) {
  let peer = peer as *mut libc::c_void;
  unsafe {
    Dart_NewFinalizableHandle_DL_Trampolined(object, peer, *SIZE, Some(blake3_hasher_gced))
  };
}
