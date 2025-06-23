Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9623958A;
	Mon, 23 Jun 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674158; cv=none; b=SdNtgG5QdtfDSGDkpi6Vkq5fZva+SwyK0J0j/JqpAAoMs+h31Hx8ycDU+PlupzDfBh0jgrNVQlhh3NUUDxOH0z7G1YncK8XeUd1mNgMmmWoSpH7eE/8gxmkfZfcNs9F37uuudHhGe7P3KvpVkR1zE3pE3pYer8ee6vGWfJlI1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674158; c=relaxed/simple;
	bh=N+f1IMoQmJSJYFkMvRIKSJjb+qKVBq1nttQYgTK+V70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iV00aeAsXUFFE41QFEv4hXgvh0fPjQOnlZDkWoyoEFJ7h8RdMb8v+vRJ7wQJwFWPw+Qr8YTS7nrrJBWzPDvdqRS6JpKOvAoq/eYTKjSAwJbmwIwC+AutPkv+bOdabSKyqpLDgEvKGvmDkbS01+jO9ROufQalqeGRg2k/WeLisKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aV7aTM3E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aV7aTM3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750674157; x=1782210157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+f1IMoQmJSJYFkMvRIKSJjb+qKVBq1nttQYgTK+V70=;
  b=aV7aTM3EHDsJdrwajB9bIb1R41ymuImmtxPRkmHzMy6uayhH7ZHyKbuI
   GsRKJ9aH57EYhVUhQqN5MAqbDohXzkJllhRZSc1q5urM6wD2x09ystgOt
   GCrYGsf4wCfaDP+AzFdhxv6A3yRSRN9SGF7wgU6k2FBcFioSV6Ju37xDc
   DMvqjZHFSemTliS1BOgkykWeheiS73ovybhaLApII1TVRVofZZbt0aHjr
   rEcDtHwfhZFPRDm11xWl2zvix4ClP1k6MzDzLOjEqgUV6+sS5QKrdWP5G
   NgIKn4GhcnA0J6jQD9UFWTqmYW+x3AnvyQui9OHQsA8r3GSt1bzXx04V2
   w==;
X-CSE-ConnectionGUID: Te+baFRITMGr0mAnoaNwfA==
X-CSE-MsgGUID: yCnGuOqWSJKJQ+4/68RAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56654744"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56654744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:22:36 -0700
X-CSE-ConnectionGUID: YKeq+UCmR0KBt0dwBvpRTQ==
X-CSE-MsgGUID: tDwYR4DBS4a1pNAVRW3Jog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182605324"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 03:22:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTeJs-000Nwm-0X;
	Mon, 23 Jun 2025 10:22:32 +0000
Date: Mon, 23 Jun 2025 18:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-sha256 54/59]
 drivers/crypto/chelsio/chcr_algo.c:335:13: warning: variable 'error' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202506231854.K6i67ZQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-sha256
head:   13bdf5c3b6b542578f8d488953a011c92bc0dea8
commit: 5f194c5a9f449aacd155ba6c45347c47120376b0 [54/59] crypto: chelsio - use SHA-2 library in chcr_compute_partial_hash()
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250623/202506231854.K6i67ZQT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231854.K6i67ZQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231854.K6i67ZQT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/chelsio/chcr_algo.c:47:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/crypto/chelsio/chcr_algo.c:335:13: warning: variable 'error' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     335 |         } else if (digest_size == SHA512_DIGEST_SIZE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:345:9: note: uninitialized use occurs here
     345 |         return error;
         |                ^~~~~
   drivers/crypto/chelsio/chcr_algo.c:335:9: note: remove the 'if' if its condition is always false
     335 |         } else if (digest_size == SHA512_DIGEST_SIZE) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                 struct sha512_ctx ctx;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     337 | 
     338 |                 sha512_init(&ctx);
         |                 ~~~~~~~~~~~~~~~~~~
     339 |                 sha512_update(&ctx, iopad, SHA512_BLOCK_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     340 |                 memcpy(result_hash, &ctx.ctx.state, SHA512_DIGEST_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     341 |         } else {
         |         ~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:329:13: warning: variable 'error' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     329 |         } else if (digest_size == SHA384_DIGEST_SIZE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:345:9: note: uninitialized use occurs here
     345 |         return error;
         |                ^~~~~
   drivers/crypto/chelsio/chcr_algo.c:329:9: note: remove the 'if' if its condition is always false
     329 |         } else if (digest_size == SHA384_DIGEST_SIZE) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     330 |                 struct sha384_ctx ctx;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     331 | 
     332 |                 sha384_init(&ctx);
         |                 ~~~~~~~~~~~~~~~~~~
     333 |                 sha384_update(&ctx, iopad, SHA384_BLOCK_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     334 |                 memcpy(result_hash, &ctx.ctx.state, SHA384_DIGEST_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     335 |         } else if (digest_size == SHA512_DIGEST_SIZE) {
         |         ~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:323:13: warning: variable 'error' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     323 |         } else if (digest_size == SHA256_DIGEST_SIZE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:345:9: note: uninitialized use occurs here
     345 |         return error;
         |                ^~~~~
   drivers/crypto/chelsio/chcr_algo.c:323:9: note: remove the 'if' if its condition is always false
     323 |         } else if (digest_size == SHA256_DIGEST_SIZE) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     324 |                 struct sha256_ctx ctx;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     325 | 
     326 |                 sha256_init(&ctx);
         |                 ~~~~~~~~~~~~~~~~~~
     327 |                 sha256_update(&ctx, iopad, SHA256_BLOCK_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     328 |                 memcpy(result_hash, &ctx.ctx.state, SHA256_DIGEST_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     329 |         } else if (digest_size == SHA384_DIGEST_SIZE) {
         |         ~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:317:13: warning: variable 'error' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     317 |         } else if (digest_size == SHA224_DIGEST_SIZE) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:345:9: note: uninitialized use occurs here
     345 |         return error;
         |                ^~~~~
   drivers/crypto/chelsio/chcr_algo.c:317:9: note: remove the 'if' if its condition is always false
     317 |         } else if (digest_size == SHA224_DIGEST_SIZE) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     318 |                 struct sha224_ctx ctx;
         |                 ~~~~~~~~~~~~~~~~~~~~~~
     319 | 
     320 |                 sha224_init(&ctx);
         |                 ~~~~~~~~~~~~~~~~~~
     321 |                 sha224_update(&ctx, iopad, SHA256_BLOCK_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     322 |                 memcpy(result_hash, &ctx.ctx.state, SHA256_DIGEST_SIZE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     323 |         } else if (digest_size == SHA256_DIGEST_SIZE) {
         |         ~~~~~~
   drivers/crypto/chelsio/chcr_algo.c:310:11: note: initialize the variable 'error' to silence this warning
     310 |         int error;
         |                  ^
         |                   = 0
   5 warnings generated.


vim +335 drivers/crypto/chelsio/chcr_algo.c

324429d74127d0 Hariprasad Shenai 2016-08-17  304  
324429d74127d0 Hariprasad Shenai 2016-08-17  305  static int chcr_compute_partial_hash(struct shash_desc *desc,
324429d74127d0 Hariprasad Shenai 2016-08-17  306  				     char *iopad, char *result_hash,
324429d74127d0 Hariprasad Shenai 2016-08-17  307  				     int digest_size)
324429d74127d0 Hariprasad Shenai 2016-08-17  308  {
324429d74127d0 Hariprasad Shenai 2016-08-17  309  	struct sha1_state sha1_st;
324429d74127d0 Hariprasad Shenai 2016-08-17  310  	int error;
324429d74127d0 Hariprasad Shenai 2016-08-17  311  
324429d74127d0 Hariprasad Shenai 2016-08-17  312  	if (digest_size == SHA1_DIGEST_SIZE) {
324429d74127d0 Hariprasad Shenai 2016-08-17  313  		error = crypto_shash_init(desc) ?:
324429d74127d0 Hariprasad Shenai 2016-08-17  314  			crypto_shash_update(desc, iopad, SHA1_BLOCK_SIZE) ?:
324429d74127d0 Hariprasad Shenai 2016-08-17  315  			crypto_shash_export(desc, (void *)&sha1_st);
324429d74127d0 Hariprasad Shenai 2016-08-17  316  		memcpy(result_hash, sha1_st.state, SHA1_DIGEST_SIZE);
324429d74127d0 Hariprasad Shenai 2016-08-17  317  	} else if (digest_size == SHA224_DIGEST_SIZE) {
5f194c5a9f449a Eric Biggers      2025-06-22  318  		struct sha224_ctx ctx;
324429d74127d0 Hariprasad Shenai 2016-08-17  319  
5f194c5a9f449a Eric Biggers      2025-06-22  320  		sha224_init(&ctx);
5f194c5a9f449a Eric Biggers      2025-06-22  321  		sha224_update(&ctx, iopad, SHA256_BLOCK_SIZE);
5f194c5a9f449a Eric Biggers      2025-06-22  322  		memcpy(result_hash, &ctx.ctx.state, SHA256_DIGEST_SIZE);
324429d74127d0 Hariprasad Shenai 2016-08-17  323  	} else if (digest_size == SHA256_DIGEST_SIZE) {
5f194c5a9f449a Eric Biggers      2025-06-22  324  		struct sha256_ctx ctx;
324429d74127d0 Hariprasad Shenai 2016-08-17  325  
5f194c5a9f449a Eric Biggers      2025-06-22  326  		sha256_init(&ctx);
5f194c5a9f449a Eric Biggers      2025-06-22  327  		sha256_update(&ctx, iopad, SHA256_BLOCK_SIZE);
5f194c5a9f449a Eric Biggers      2025-06-22  328  		memcpy(result_hash, &ctx.ctx.state, SHA256_DIGEST_SIZE);
324429d74127d0 Hariprasad Shenai 2016-08-17  329  	} else if (digest_size == SHA384_DIGEST_SIZE) {
5f194c5a9f449a Eric Biggers      2025-06-22  330  		struct sha384_ctx ctx;
324429d74127d0 Hariprasad Shenai 2016-08-17  331  
5f194c5a9f449a Eric Biggers      2025-06-22  332  		sha384_init(&ctx);
5f194c5a9f449a Eric Biggers      2025-06-22  333  		sha384_update(&ctx, iopad, SHA384_BLOCK_SIZE);
5f194c5a9f449a Eric Biggers      2025-06-22  334  		memcpy(result_hash, &ctx.ctx.state, SHA384_DIGEST_SIZE);
324429d74127d0 Hariprasad Shenai 2016-08-17 @335  	} else if (digest_size == SHA512_DIGEST_SIZE) {
5f194c5a9f449a Eric Biggers      2025-06-22  336  		struct sha512_ctx ctx;
5f194c5a9f449a Eric Biggers      2025-06-22  337  
5f194c5a9f449a Eric Biggers      2025-06-22  338  		sha512_init(&ctx);
5f194c5a9f449a Eric Biggers      2025-06-22  339  		sha512_update(&ctx, iopad, SHA512_BLOCK_SIZE);
5f194c5a9f449a Eric Biggers      2025-06-22  340  		memcpy(result_hash, &ctx.ctx.state, SHA512_DIGEST_SIZE);
324429d74127d0 Hariprasad Shenai 2016-08-17  341  	} else {
324429d74127d0 Hariprasad Shenai 2016-08-17  342  		error = -EINVAL;
324429d74127d0 Hariprasad Shenai 2016-08-17  343  		pr_err("Unknown digest size %d\n", digest_size);
324429d74127d0 Hariprasad Shenai 2016-08-17  344  	}
324429d74127d0 Hariprasad Shenai 2016-08-17  345  	return error;
324429d74127d0 Hariprasad Shenai 2016-08-17  346  }
324429d74127d0 Hariprasad Shenai 2016-08-17  347  

:::::: The code at line 335 was first introduced by commit
:::::: 324429d74127d0cc8a1a42d20035f8f986149ec4 chcr: Support for Chelsio's Crypto Hardware

:::::: TO: Hariprasad Shenai <hariprasad@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
