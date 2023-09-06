from flint._flint cimport mp_ptr, mp_limb_t, mp_bitcnt_t
from flint._flint cimport flint_rand_t, ulong
from flint.flintlib.nmod_vec cimport nmod_t

cdef extern from "flint/nmod_poly.h":
    ctypedef struct nmod_poly_struct:
        mp_ptr coeffs
        long alloc
        long length
        nmod_t mod
    ctypedef nmod_poly_struct nmod_poly_t[1]

    ctypedef struct nmod_poly_factor_struct:
        nmod_poly_struct *p
        long *exp
        long num
        long alloc
    ctypedef nmod_poly_factor_struct nmod_poly_factor_t[1]

    void nmod_poly_init(nmod_poly_t poly, mp_limb_t n)
    void nmod_poly_init_preinv(nmod_poly_t poly, mp_limb_t n, mp_limb_t ninv)
    void nmod_poly_init2(nmod_poly_t poly, mp_limb_t n, long alloc)
    void nmod_poly_init2_preinv(nmod_poly_t poly, mp_limb_t n, mp_limb_t ninv, long alloc)
    void nmod_poly_realloc(nmod_poly_t poly, long alloc)
    void nmod_poly_clear(nmod_poly_t poly)
    void nmod_poly_fit_length(nmod_poly_t poly, long alloc)
    long nmod_poly_length(nmod_poly_t poly)
    long nmod_poly_degree(nmod_poly_t poly)
    mp_limb_t nmod_poly_modulus(nmod_poly_t poly)
    mp_bitcnt_t nmod_poly_max_bits(nmod_poly_t poly)
    void nmod_poly_set(nmod_poly_t a, nmod_poly_t b)
    void nmod_poly_swap(nmod_poly_t poly1, nmod_poly_t poly2)
    void nmod_poly_zero(nmod_poly_t res)
    void nmod_poly_truncate(nmod_poly_t poly, long len)
    void nmod_poly_reverse(nmod_poly_t output, nmod_poly_t input, long m)
    void nmod_poly_randtest(nmod_poly_t poly, flint_rand_t state, long len)
    ulong nmod_poly_get_coeff_ui(nmod_poly_t poly, ulong j)
    void nmod_poly_set_coeff_ui(nmod_poly_t poly, ulong j, ulong c)
    char * nmod_poly_get_str(nmod_poly_t poly)
    int nmod_poly_set_str(char * s, nmod_poly_t poly)
    int nmod_poly_print(nmod_poly_t a)
    int nmod_poly_equal(nmod_poly_t a, nmod_poly_t b)
    int nmod_poly_is_zero(nmod_poly_t poly)
    void nmod_poly_shift_left(nmod_poly_t res, nmod_poly_t poly, long k)
    void nmod_poly_shift_right(nmod_poly_t res, nmod_poly_t poly, long k)
    void nmod_poly_add(nmod_poly_t res, nmod_poly_t poly1, nmod_poly_t poly2)
    void nmod_poly_sub(nmod_poly_t res, nmod_poly_t poly1, nmod_poly_t poly2)
    void nmod_poly_neg(nmod_poly_t res, nmod_poly_t poly1)
    void nmod_poly_scalar_mul_nmod(nmod_poly_t res, nmod_poly_t poly1, mp_limb_t c)
    void nmod_poly_make_monic(nmod_poly_t output, nmod_poly_t input)
    void nmod_poly_mul(nmod_poly_t res, nmod_poly_t poly1, nmod_poly_t poly2)
    void nmod_poly_mullow(nmod_poly_t res, nmod_poly_t poly1, nmod_poly_t poly2, long trunc)
    void nmod_poly_pow(nmod_poly_t res, nmod_poly_t poly, ulong e)
    void nmod_poly_pow_trunc(nmod_poly_t res, nmod_poly_t poly, ulong e, long trunc)
    void nmod_poly_divrem(nmod_poly_t Q, nmod_poly_t R, nmod_poly_t A, nmod_poly_t B)
    void nmod_poly_div(nmod_poly_t Q, nmod_poly_t A, nmod_poly_t B)
    void nmod_poly_inv_series(nmod_poly_t Qinv, nmod_poly_t Q, long n)
    void nmod_poly_div_series(nmod_poly_t Q, nmod_poly_t A, nmod_poly_t B, long n)
    void nmod_poly_derivative(nmod_poly_t x_prime, nmod_poly_t x)
    void nmod_poly_integral(nmod_poly_t x_int, nmod_poly_t x)
    mp_limb_t nmod_poly_evaluate_nmod(nmod_poly_t poly, mp_limb_t c)
    void nmod_poly_compose(nmod_poly_t res, nmod_poly_t poly1, nmod_poly_t poly2)
    void nmod_poly_gcd(nmod_poly_t G, nmod_poly_t A, nmod_poly_t B)
    void nmod_poly_xgcd(nmod_poly_t G, nmod_poly_t S, nmod_poly_t T, nmod_poly_t A, nmod_poly_t B)
    void nmod_poly_invsqrt_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_sqrt_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_atan_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_tan_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_asin_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_sin_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_cos_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_asinh_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_atanh_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_sinh_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_cosh_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_tanh_series(nmod_poly_t g, nmod_poly_t h, long n)
    void nmod_poly_log_series(nmod_poly_t res, nmod_poly_t f, long n)
    void nmod_poly_exp_series(nmod_poly_t f, nmod_poly_t h, long n)

    int nmod_poly_is_irreducible(nmod_poly_t f)
    mp_limb_t nmod_poly_factor_with_berlekamp(nmod_poly_factor_t result, nmod_poly_t poly)
    mp_limb_t nmod_poly_factor_with_cantor_zassenhaus(nmod_poly_factor_t result, nmod_poly_t poly)
    mp_limb_t nmod_poly_factor(nmod_poly_factor_t result, nmod_poly_t input)
    void nmod_poly_factor_init(nmod_poly_factor_t fac)
    void nmod_poly_factor_clear(nmod_poly_factor_t fac)