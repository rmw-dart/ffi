use crate::dart_sdk::{
  Dart_FinalizableHandle, Dart_Handle, Dart_HandleFinalizer, Dart_PersistentHandle,
};

#[link(name = "trampoline")]
extern "C" {
  pub fn Dart_InitializeApiDL(obj: *mut libc::c_void) -> libc::intptr_t;
  pub fn Dart_NewPersistentHandle_DL_Trampolined(object: Dart_Handle) -> Dart_PersistentHandle;
  pub fn Dart_HandleFromPersistent_DL_Trampolined(object: Dart_PersistentHandle) -> Dart_Handle;
  pub fn Dart_DeletePersistentHandle_DL_Trampolined(object: Dart_PersistentHandle);
  pub fn Dart_NewApiError_DL_Trampolined(msg: *const libc::c_char) -> Dart_Handle;
  pub fn Dart_NewUnhandledExceptionError_DL_Trampolined(exception: Dart_Handle) -> Dart_Handle;
  pub fn Dart_PropagateError_DL_Trampolined(handle: Dart_Handle);
  pub fn Dart_NewFinalizableHandle_DL_Trampolined(
    handle: Dart_Handle,
    peer: *mut libc::c_void,
    external_allocation_size: usize,
    callback: Dart_HandleFinalizer,
  ) -> Dart_FinalizableHandle;
}

#[no_mangle]
pub unsafe extern "C" fn InitDartApiDL(obj: *mut libc::c_void) -> libc::intptr_t {
  return Dart_InitializeApiDL(obj);
}

static mut closures_caller: Option<extern "C" fn(c: Dart_Handle)> = None;

#[no_mangle]
pub unsafe extern "C" fn RegisterClosureCallerFP(callback_: extern "C" fn(c: Dart_Handle)) {
  closures_caller = Some(callback_);
}
