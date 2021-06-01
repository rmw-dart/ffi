/*! \file */
/*******************************************
 *                                         *
 *  File auto-generated by `::safer_ffi`.  *
 *                                         *
 *  Do not manually edit this file.        *
 *                                         *
 *******************************************/

#ifndef __RUST_DART-FFI__
#define __RUST_DART-FFI__

#ifdef __cplusplus
extern "C" {
#endif


#include <stddef.h>
#include <stdint.h>

void free_u8 (
    uint8_t * data,
    size_t len);

void free_u8_32 (
    uint8_t * data);

uint8_t const * rand_u8_32 (void);

typedef struct Ed25519Keypair Ed25519Keypair_t;

Ed25519Keypair_t * ed25519_from_seed (
    uint8_t const * data);

uint8_t const * ed25519_sign (
    Ed25519Keypair_t * keypair,
    uint8_t const * data,
    size_t len);

uint8_t const * blake3_hash (
    uint8_t const * data,
    size_t len);

typedef struct Blake3Hasher Blake3Hasher_t;

Blake3Hasher_t * blake3_hasher_new (void);

void blake3_hasher_update (
    Blake3Hasher_t * hasher,
    uint8_t const * data,
    size_t len);

uint8_t const * blake3_hasher_end (
    Blake3Hasher_t * hasher);


#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* __RUST_DART-FFI__ */
