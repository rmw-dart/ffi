use crate::dart_sdk::{Dart_FinalizableHandle, Dart_Handle, Dart_HandleFinalizer};

#[link(name = "trampoline")]
extern "C" {
  pub fn Dart_InitializeApiDL(obj: *mut libc::c_void) -> libc::intptr_t;
  pub fn Dart_NewFinalizableHandle_DL(
    handle: Dart_Handle,
    peer: *mut libc::c_void,
    external_allocation_size: usize,
    callback: Dart_HandleFinalizer,
  ) -> Dart_FinalizableHandle;
  /*
  pub fn Dart_NewPersistentHandle_DL(object: Dart_Handle) -> Dart_PersistentHandle;
  pub fn Dart_HandleFromPersistent_DL(object: Dart_PersistentHandle) -> Dart_Handle;
  pub fn Dart_DeletePersistentHandle_DL(object: Dart_PersistentHandle);
  pub fn Dart_NewApiError_DL(msg: *const libc::c_char) -> Dart_Handle;
  pub fn Dart_NewUnhandledExceptionError_DL(exception: Dart_Handle) -> Dart_Handle;
  pub fn Dart_PropagateError_DL(handle: Dart_Handle);
  */
}

#[no_mangle]
pub unsafe extern "C" fn InitDartApiDL(obj: *mut libc::c_void) -> libc::intptr_t {
  return Dart_InitializeApiDL(obj);
}
/*
static mut closures_caller: Option<extern "C" fn(c: Dart_Handle)> = None;

#[no_mangle]
pub unsafe extern "C" fn RegisterClosureCallerFP(callback_: extern "C" fn(c: Dart_Handle)) {
  closures_caller = Some(callback_);
}
*/
