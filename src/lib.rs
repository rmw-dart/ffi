mod blake3;
mod ed25519;

#[::safer_ffi::cfg_headers]
#[test]
fn c_h() -> ::std::io::Result<()> {
  safer_ffi::headers::builder().to_file("ffi.h")?.generate()
}
