use crate::const_u8::const_u8;
use crate::dart::Dart_NewFinalizableHandle_DL;
use crate::dart_sdk::Dart_Handle;
use blake3::Hasher;
use core::slice;
use safer_ffi::prelude::*;
use std::mem::size_of;
use std::pin::Pin;

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
  let r = const_u8(*hasher.h.finalize().as_bytes());
  //drop(hasher);
  r
}

extern "C" fn _blake3_hasher_gc(isolate_callback_data: *mut libc::c_void, peer: *mut libc::c_void) {
  //drop(peer);
  println!("todo gc !!!");
}

#[ffi_export]
pub fn blake3_gc_bind(handle: Dart_Handle, pointer: *mut libc::c_void) {
  unsafe {
    Dart_NewFinalizableHandle_DL(
      handle,
      pointer,
      size_of::<Hasher>(),
      None, //Some(_blake3_hasher_gc),
    );
  }
}
