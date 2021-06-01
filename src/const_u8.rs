pub fn const_u8<const N: usize>(arr: [u8; N]) -> *const u8 {
  Box::into_raw(Box::new(arr)) as *const u8
}
