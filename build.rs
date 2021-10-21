fn main() {
  println!("cargo:rerun-if-changed=dart_sdk/trampoline.c");
  cc::Build::new()
    .file("dart_sdk/dart_api_dl.c")
    .compile("trampoline");
}
