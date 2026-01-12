Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BC326958;
	Mon, 12 Jan 2026 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258181; cv=none; b=TJaaxr3Cz/OLoIdkKMytjQ035piQlOGHSxLiUyUBOoRdsxewL1LRwrnltAHz97ymd8+9xt3WKz0B428nqHyBACxjSTuo7SAsEUV/DgKQR+UJeX9RXE/8sd7juIKxmfKul6m1a2YUGV+Cl9S5lr9Bc7NkVfrQl8rH7dntoIcjcZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258181; c=relaxed/simple;
	bh=XN2R9SGOj9THEQ3V3jjcI+uwL+U1dtsAzfJpfF53GGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xg4xdNld56eTPEG4nYDMBIzT/YmLtP06Oq7pBmhX9jH2avXULkyCRpbHQIQHCNZFPpHA2L7/aDYUIAbAo4MsUa43zT4kO/Vh4f4naXZPZftrxJxzhHRkCEsSshJsynV7rVh1RBA6NoGBKCt9nEGVEiCprByGLYX2nutT3xcZC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhWalKYq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhWalKYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768258177; x=1799794177;
  h=date:from:to:cc:subject:message-id;
  bh=XN2R9SGOj9THEQ3V3jjcI+uwL+U1dtsAzfJpfF53GGc=;
  b=YhWalKYqCrvZkX8S7aKQE0lTOEo7tW2C8p36dCSijsFTfeBw9DmGMIME
   KuawqN5o1OBcHsrwGzH9zxhw0MHJbdHt9WjocyaXwM18XUXibjYe4g1ku
   phgUe/x8Spxev15CApEfaIBEYFQ/ElgmQoKJc3h++3RH3FAfAK+4aLMLx
   GMC5gcBE6O8zSSyJV8DAzsOkfNaP62c6Q9A+eWWOlMVwIYs3FvARP4RTh
   T8eSXEVR9jsxQ/eVuLHyTqI7FSnv4M4AzlQsZoFDmIsBFh4GQ145T/tFv
   SX/NypdhLEMsEIGEjT0k0VYaTmwXHeT4LpAe+KaRkPplUGnQiw1uPLIVc
   Q==;
X-CSE-ConnectionGUID: qfSThxV6SG+vQl13AzFRAw==
X-CSE-MsgGUID: w+iv9EOzTDGHvbP+VZ3b8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69439088"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69439088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:49:23 -0800
X-CSE-ConnectionGUID: 1+fBq8grSBOi+BPU2ISy0w==
X-CSE-MsgGUID: hUwCD06jSjCcg5Fi1VUPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204867845"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jan 2026 14:49:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQit-00000000DxA-0r5G;
	Mon, 12 Jan 2026 22:49:19 +0000
Date: Tue, 13 Jan 2026 06:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:251:12: warning: stack frame size (1152)
 exceeds limit (1024) in 'hmac_setkey_ahash'
Message-ID: <202601130603.OVc1bV9o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
date:   8 months ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20260113/202601130603.OVc1bV9o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130603.OVc1bV9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130603.OVc1bV9o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit (1024) in 'hmac_setkey_ahash' [-Wframe-larger-than]
     251 | static int hmac_setkey_ahash(struct crypto_ahash *parent,
         |            ^
   1 warning generated.


vim +/hmac_setkey_ahash +251 crypto/hmac.c

   250	
 > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,
   252				     const u8 *inkey, unsigned int keylen)
   253	{
   254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
   255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
   256		int ds = crypto_ahash_digestsize(parent);
   257		int bs = crypto_ahash_blocksize(parent);
   258		int ss = crypto_ahash_statesize(parent);
   259		HASH_REQUEST_ON_STACK(req, fb);
   260		u8 *opad = &tctx->pads[ss];
   261		u8 *ipad = &tctx->pads[0];
   262		int err, i;
   263	
   264		if (fips_enabled && (keylen < 112 / 8))
   265			return -EINVAL;
   266	
   267		ahash_request_set_callback(req, 0, NULL, NULL);
   268	
   269		if (keylen > bs) {
   270			ahash_request_set_virt(req, inkey, ipad, keylen);
   271			err = crypto_ahash_digest(req);
   272			if (err)
   273				goto out_zero_req;
   274	
   275			keylen = ds;
   276		} else
   277			memcpy(ipad, inkey, keylen);
   278	
   279		memset(ipad + keylen, 0, bs - keylen);
   280		memcpy(opad, ipad, bs);
   281	
   282		for (i = 0; i < bs; i++) {
   283			ipad[i] ^= HMAC_IPAD_VALUE;
   284			opad[i] ^= HMAC_OPAD_VALUE;
   285		}
   286	
   287		ahash_request_set_virt(req, ipad, NULL, bs);
   288		err = crypto_ahash_init(req) ?:
   289		      crypto_ahash_update(req) ?:
   290		      crypto_ahash_export(req, ipad);
   291	
   292		ahash_request_set_virt(req, opad, NULL, bs);
   293		err = err ?:
   294		      crypto_ahash_init(req) ?:
   295		      crypto_ahash_update(req) ?:
   296		      crypto_ahash_export(req, opad);
   297	
   298	out_zero_req:
   299		HASH_REQUEST_ZERO(req);
   300		return err;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
