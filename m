Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17A1F3B9E;
	Sat, 18 Oct 2025 03:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760759085; cv=none; b=o9oJBuQjkl2eOZFbI6xkBGT3gUf1NjFaPy5Ac0QU80CSrNX1vitLk3SSMINPFCPZruvCKVq2n7EKhGRn0I071aTqkKIztFrfZXrgeNZWe/ShItWNhdv1UCQUxfK+k3v11/ZTMj6UG79398plqkJr0Sf45QlxmrgMqcAfB6a6k8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760759085; c=relaxed/simple;
	bh=QA9806xeGubpeoELIKV+1UYTzfEK0KND0d1oZ5vSKCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iHLei8Z1y4pfdntUBFUfQZbaMXOtoSG8Ggidg54C/z5YaPEjsnQzhMf5MVvmg6/uLHkcnBEBaiW/OFeu0HuQJmHvsaCIT+2S9L2hXNjQxRBUDoxdVtaR9GrQTDSG3ntIsNt7jeIGW1qSRnjxgxGUIsktYqoW51PEREC6Ex2oE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPnbbreH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPnbbreH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760759084; x=1792295084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QA9806xeGubpeoELIKV+1UYTzfEK0KND0d1oZ5vSKCI=;
  b=hPnbbreHLmJh8FM7gN1y1fGtl0gElmAVQJDXk4Q44oO7DfJTZIeS2T9s
   MKfX7BNimlXLo5uG9UXqTaTbEcsiSh2yit6q+4WhqQbe8ZbyEGSuD4upJ
   cbk4uIzckslMyiymlZK8Kyud/GYo4+XjeTNDpZqYM5Xn2zipVVi1OcL/B
   zgvNixFDjCOyos0T0kKHHvU8NEBrg5X6/rIJ8mtgNjtSdBtFLOQyd4JDP
   IEh9xbfNuJ7axZMj3GUCFY3sL8kd47tlyf+yOAtOXG+nBfdnU6z35U89t
   J1toaMgd7VUIhW/MwzAbLnkx8vK7VMBPj62YBgn1EjZ0p02I8iccnLQsB
   w==;
X-CSE-ConnectionGUID: N5NNvs7/RYW1g5kLfC8gYQ==
X-CSE-MsgGUID: ounuz1yyQdyyMHjvBpJO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63017931"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="63017931"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:44:44 -0700
X-CSE-ConnectionGUID: 11xkKIaxTEaXn7Nac8zYXQ==
X-CSE-MsgGUID: S3UhllmaR9qV9ae8nQA8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="206601047"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Oct 2025 20:44:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9xrr-00082H-0o;
	Sat, 18 Oct 2025 03:44:34 +0000
Date: Sat, 18 Oct 2025 11:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 10/17]
 crypto/ml_dsa/dilithium_signature_impl.h:55:12: warning: stack frame size
 (4040) exceeds limit (2048) in 'dilithium_sign_internal_ahat'
Message-ID: <202510181107.KY6FJpsR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   91d7b63566e977976872603971e4a3ec4efeeb60
commit: db8f1bc64c0114a9b9757bc412bf3126e3d211ca [10/17] crypto: Add ML-DSA/Dilithium support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510181107.KY6FJpsR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181107.KY6FJpsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181107.KY6FJpsR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/ml_dsa/dilithium_87.c:33:
   In file included from crypto/ml_dsa/dilithium_signature_c.c:38:
>> crypto/ml_dsa/dilithium_signature_impl.h:55:12: warning: stack frame size (4040) exceeds limit (2048) in 'dilithium_sign_internal_ahat' [-Wframe-larger-than]
      55 | static int dilithium_sign_internal_ahat(struct dilithium_sig *sig,
         |            ^
   1 warning generated.


vim +/dilithium_sign_internal_ahat +55 crypto/ml_dsa/dilithium_signature_impl.h

    51	
    52	#define WS_POLY_UNIFORM_BUF_SIZE                                               \
    53		(_WS_POLY_UNIFORM_BUF_SIZE * LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER)
    54	
  > 55	static int dilithium_sign_internal_ahat(struct dilithium_sig *sig,
    56						const struct dilithium_sk *sk,
    57						struct dilithium_ctx *ctx,
    58						struct crypto_rng *rng_ctx)
    59	{
    60		struct workspace_sign {
    61			polyvecl s1, y, z;
    62			polyveck t0, s2, w1, w0, h;
    63			poly cp;
    64			uint8_t seedbuf[DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES +
    65					DILITHIUM_CRHBYTES];
    66			union {
    67				uint8_t poly_uniform_gamma1_buf[WS_POLY_UNIFORM_BUF_SIZE];
    68				uint8_t poly_challenge_buf[POLY_CHALLENGE_BYTES];
    69			} tmp;
    70		};
    71		unsigned int n;
    72		uint8_t *key, *mu, *rhoprime, *rnd;
    73		const polyvecl *mat = ctx->ahat;
    74		uint16_t nonce = 0;
    75		int ret = 0;
    76		uint8_t __maybe_unused rej_total = 0;
    77		LC_DECLARE_MEM(ws, struct workspace_sign, sizeof(uint64_t));
    78	
    79		/* AHat must be present at this time */
    80		if (WARN_ON_ONCE(!mat)) {
    81			ret = -EINVAL;
    82			goto out;
    83		}
    84	
    85		key = ws->seedbuf;
    86		rnd = key + DILITHIUM_SEEDBYTES;
    87		mu = rnd + DILITHIUM_RNDBYTES;
    88	
    89		/*
    90		 * If the external mu is provided, use this verbatim, otherwise
    91		 * calculate the mu value.
    92		 */
    93		if (ctx->external_mu) {
    94			if (ctx->external_mu_len != DILITHIUM_CRHBYTES)
    95				return -EINVAL;
    96			memcpy(mu, ctx->external_mu, DILITHIUM_CRHBYTES);
    97		} else {
    98			/*
    99			 * Set the digestsize - for SHA512 this is a noop, for SHAKE256,
   100			 * it sets the value. The BUILD_BUG_ON is to check that the
   101			 * SHA-512 output size is identical to the expected length.
   102			 */
   103			BUILD_BUG_ON(DILITHIUM_CRHBYTES != SHA3_512_DIGEST_SIZE);
   104			if (!dilithium_hash_check_digestsize(ctx, DILITHIUM_CRHBYTES)) {
   105				ret = -EINVAL;
   106				goto out;
   107			}
   108			dilithium_hash_final(ctx, mu, DILITHIUM_CRHBYTES);
   109		}
   110		dilithium_print_buffer(mu, DILITHIUM_CRHBYTES, "Siggen - MU:");
   111	
   112		if (rng_ctx) {
   113			ret = crypto_rng_generate(rng_ctx, NULL, 0, rnd,
   114						  DILITHIUM_RNDBYTES);
   115			if (ret < 0)
   116				goto out;
   117		} else {
   118			memset(rnd, 0, DILITHIUM_RNDBYTES);
   119		}
   120		dilithium_print_buffer(rnd, DILITHIUM_RNDBYTES, "Siggen - RND:");
   121	
   122		unpack_sk_key(key, sk);
   123	
   124		/* Timecop: key is secret */
   125		poison(key, DILITHIUM_SEEDBYTES);
   126	
   127		/* Re-use the ws->seedbuf, but making sure that mu is unchanged */
   128		BUILD_BUG_ON(DILITHIUM_CRHBYTES >
   129			     DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES);
   130		rhoprime = key;
   131	
   132		shake256(key,
   133			 DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES +
   134			 DILITHIUM_CRHBYTES,
   135			 rhoprime, DILITHIUM_CRHBYTES);
   136		dilithium_print_buffer(rhoprime, DILITHIUM_CRHBYTES,
   137				       "Siggen - RHOPrime:");
   138	
   139		/*
   140		 * Timecop: RHO' is the hash of the secret value of key which is
   141		 * enlarged to sample the intermediate vector y from. Due to the hashing
   142		 * any side channel on RHO' cannot allow the deduction of the original
   143		 * key.
   144		 */
   145		unpoison(rhoprime, DILITHIUM_CRHBYTES);
   146	
   147		unpack_sk_s1(&ws->s1, sk);
   148	
   149		/* Timecop: s1 is secret */
   150		poison(&ws->s1, sizeof(polyvecl));
   151	
   152		polyvecl_ntt(&ws->s1);
   153		dilithium_print_polyvecl(&ws->s1,
   154					 "Siggen - S1 L x N matrix after NTT:");
   155	
   156		unpack_sk_s2(&ws->s2, sk);
   157	
   158		/* Timecop: s2 is secret */
   159		poison(&ws->s2, sizeof(polyveck));
   160	
   161		polyveck_ntt(&ws->s2);
   162		dilithium_print_polyveck(&ws->s2,
   163					 "Siggen - S2 K x N matrix after NTT:");
   164	
   165		unpack_sk_t0(&ws->t0, sk);
   166		polyveck_ntt(&ws->t0);
   167		dilithium_print_polyveck(&ws->t0,
   168					 "Siggen - T0 K x N matrix after NTT:");
   169	
   170	rej:
   171		/* Sample intermediate vector y */
   172		polyvecl_uniform_gamma1(&ws->y, rhoprime, nonce++,
   173					ws->tmp.poly_uniform_gamma1_buf);
   174		dilithium_print_polyvecl(
   175			&ws->y,
   176			"Siggen - Y L x N matrix after ExpandMask - start of loop");
   177	
   178		/* Timecop: s2 is secret */
   179		poison(&ws->y, sizeof(polyvecl));
   180	
   181		/* Matrix-vector multiplication */
   182		ws->z = ws->y;
   183		polyvecl_ntt(&ws->z);
   184	
   185		/* Use the cp for this operation as it is not used here so far. */
   186		polyvec_matrix_pointwise_montgomery(&ws->w1, mat, &ws->z, &ws->cp);
   187		polyveck_reduce(&ws->w1);
   188		polyveck_invntt_tomont(&ws->w1);
   189		dilithium_print_polyveck(&ws->w1,
   190					 "Siggen - W K x N matrix after NTT-1");
   191	
   192		/* Decompose w and call the random oracle */
   193		polyveck_caddq(&ws->w1);
   194		polyveck_decompose(&ws->w1, &ws->w0, &ws->w1);
   195	
   196		/* Timecop: the signature component w1 is not sensitive any more. */
   197		unpoison(&ws->w1, sizeof(polyveck));
   198		polyveck_pack_w1(sig->sig, &ws->w1);
   199		dilithium_print_buffer(sig->sig,
   200				       DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
   201				       "Siggen - w1Encode of W1");
   202	
   203		dilithium_hash_init(ctx);
   204		dilithium_hash_update(ctx, mu, DILITHIUM_CRHBYTES);
   205		dilithium_hash_finup(ctx, sig->sig,
   206				     DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
   207				     sig->sig, DILITHIUM_CTILDE_BYTES);
   208	
   209		dilithium_print_buffer(sig->sig, DILITHIUM_CTILDE_BYTES,
   210				       "Siggen - ctilde");
   211	
   212		poly_challenge(&ws->cp, sig->sig, ws->tmp.poly_challenge_buf);
   213		dilithium_print_poly(&ws->cp, "Siggen - c after SampleInBall");
   214		poly_ntt(&ws->cp);
   215		dilithium_print_poly(&ws->cp, "Siggen - c after NTT");
   216	
   217		/* Compute z, reject if it reveals secret */
   218		polyvecl_pointwise_poly_montgomery(&ws->z, &ws->cp, &ws->s1);
   219		polyvecl_invntt_tomont(&ws->z);
   220		polyvecl_add(&ws->z, &ws->z, &ws->y);
   221		dilithium_print_polyvecl(&ws->z, "Siggen - z <- y + cs1");
   222	
   223		polyvecl_reduce(&ws->z);
   224		dilithium_print_polyvecl(&ws->z, "Siggen - z reduction");
   225	
   226		/* Timecop: the signature component z is not sensitive any more. */
   227		unpoison(&ws->z, sizeof(polyvecl));
   228	
   229		if (polyvecl_chknorm(&ws->z, DILITHIUM_GAMMA1 - DILITHIUM_BETA)) {
   230			dilithium_print_polyvecl(&ws->z, "Siggen - z rejection");
   231			rej_total |= 1 << 0;
   232			goto rej;
   233		}
   234	
   235		/*
   236		 * Check that subtracting cs2 does not change high bits of w and low
   237		 * bits do not reveal secret information.
   238		 */
   239		polyveck_pointwise_poly_montgomery(&ws->h, &ws->cp, &ws->s2);
   240		polyveck_invntt_tomont(&ws->h);
   241		polyveck_sub(&ws->w0, &ws->w0, &ws->h);
   242		polyveck_reduce(&ws->w0);
   243	
   244		/* Timecop: verification data w0 is not sensitive any more. */
   245		unpoison(&ws->w0, sizeof(polyveck));
   246	
   247		if (polyveck_chknorm(&ws->w0,
   248				     DILITHIUM_GAMMA2 - DILITHIUM_BETA)) {
   249			dilithium_print_polyveck(&ws->w0, "Siggen - r0 rejection");
   250			rej_total |= 1 << 1;
   251			goto rej;
   252		}
   253	
   254		/* Compute hints for w1 */
   255		polyveck_pointwise_poly_montgomery(&ws->h, &ws->cp, &ws->t0);
   256		polyveck_invntt_tomont(&ws->h);
   257		polyveck_reduce(&ws->h);
   258	
   259		/* Timecop: the signature component h is not sensitive any more. */
   260		unpoison(&ws->h, sizeof(polyveck));
   261	
   262		if (polyveck_chknorm(&ws->h, DILITHIUM_GAMMA2)) {
   263			dilithium_print_polyveck(&ws->h, "Siggen - ct0 rejection");
   264			rej_total |= 1 << 2;
   265			goto rej;
   266		}
   267	
   268		polyveck_add(&ws->w0, &ws->w0, &ws->h);
   269	
   270		n = polyveck_make_hint(&ws->h, &ws->w0, &ws->w1);
   271		if (n > DILITHIUM_OMEGA) {
   272			dilithium_print_polyveck(&ws->w0, "Siggen - h rejection");
   273			rej_total |= 1 << 3;
   274			goto rej;
   275		}
   276	
   277		/* Write signature */
   278		dilithium_print_buffer(sig->sig, DILITHIUM_CTILDE_BYTES,
   279				       "Siggen - Ctilde:");
   280		dilithium_print_polyvecl(&ws->z, "Siggen - Z L x N matrix:");
   281		dilithium_print_polyveck(&ws->h, "Siggen - H K x N matrix:");
   282	
   283		pack_sig(sig, &ws->z, &ws->h);
   284	
   285		dilithium_print_buffer(sig->sig, DILITHIUM_CRYPTO_BYTES,
   286				       "Siggen - Signature:");
   287	
   288	out:
   289		LC_RELEASE_MEM(ws);
   290	#ifdef REJECTION_TEST_SAMPLING
   291		return ret ? ret : rej_total;
   292	#else
   293		return ret;
   294	#endif
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
