mod blake3;
mod const_u8;
mod ed25519;
mod x25519;

use safer_ffi::prelude::*;

#[ffi_export]
pub fn free_u8(data: *mut u8, len: usize) {
  unsafe {
    Box::from_raw(std::slice::from_raw_parts_mut(data, len).as_mut_ptr());
  }
}

#[ffi_export]
pub fn free_u8_32(data: *mut u8) {
  unsafe {
    Box::from_raw(std::slice::from_raw_parts_mut(data, 32).as_mut_ptr());
  }
}

#[::safer_ffi::cfg_headers]
#[test]
fn c_h() -> ::std::io::Result<()> {
  safer_ffi::headers::builder().to_file("ffi.h")?.generate()
}
