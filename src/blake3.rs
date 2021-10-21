use crate::const_u8::const_u8;
use crate::dart::Dart_NewFinalizableHandle_DL;
use crate::dart_sdk::Dart_Handle;
use blake3::Hasher;
use core::slice;
use libc::c_void;
use safer_ffi::prelude::*;
use static_init::dynamic;
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

extern "C" fn _blake3_hasher_gc(isolate_callback_data: *mut c_void, peer: *mut c_void) {
  //drop(peer);
  println!("todo gc !!!");
}

#[ffi_export]
pub fn blake3_hasher_new(handle: Dart_Handle) -> repr_c::Box<Blake3Hasher> {
  let peer = repr_c::Box::new(Blake3Hasher::new());
  let pin = Box::new(Pin::new(&peer));
  unsafe {
    Dart_NewFinalizableHandle_DL(
      handle,
      Box::into_raw(pin) as *mut c_void,
      32,
      None, //Some(_blake3_hasher_gc),
    );
  }
  peer
}

#[ffi_export]
pub fn blake3_hasher_update(hasher: &mut Blake3Hasher, data: *const u8, len: usize) {
  let v = unsafe { slice::from_raw_parts(data, len) };
  hasher.h.update(v);
}

#[ffi_export]
pub fn blake3_hasher_end(hasher: repr_c::Box<Blake3Hasher>) -> *const u8 {
  let r = const_u8(*hasher.h.finalize().as_bytes());
  drop(hasher);
  r
}
