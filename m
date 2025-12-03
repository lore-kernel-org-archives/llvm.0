Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FBBA3F;
	Wed,  3 Dec 2025 00:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764720779; cv=none; b=YlLsJNzAIivpM1wRvy9UUxNSTsFURIvmyJWXczBh0sPFA7L/G4C+3vrCcxw6Nb8pRtcZTJKWCWQtPH+VbSku8hR/2tIX8wdk7rTp+lCRLk9B+x6HW98ORAHNBNe0yr7IhCh2gHQQIMfAVB8oV8S+NroPBA7mOFpuE8U1mWtnbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764720779; c=relaxed/simple;
	bh=Xpx15788iOselgFqHlsWrPegDcIlu5w6+75OLdugedU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ci2E/d8R6bqCw83FI2vyX8hI+Sw1iMcD8GniKehypEtAmX44OSv+7AwPVH4La6b7rvM5X1+3jiYy4JXC0XkSuNl89KZ3lvDJyRKEGEwTTJzGtFaAo0LHpLwtacE3/Gzy9zsvUyd9LnKXgf1Qip6oXdX2hIIrOBRmsSCVEfq8HAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU8Y2bEJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU8Y2bEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764720778; x=1796256778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xpx15788iOselgFqHlsWrPegDcIlu5w6+75OLdugedU=;
  b=kU8Y2bEJVWLVtj3oFn0QKu5lHOn6vClOSSvUK89cFZLhBdmI3jCqg9N2
   V3dyL49W7DdRhT5JTDwOVr+vFyWfQAc2n0fIk/+t/jiDWN0qRLUUASJb8
   Qru8LLcWc459147mTJAsIKy3EGxVnaft7fsRyS0A7JmXH+dPTI6ZuFAEv
   iO4yef1FiljH31zydIHioARJFHF8VDuwkNbnSjb2rY2tPAy63d9kjE9xZ
   RyXn43zPw5XeuUeQjD54fHxgYXlhS/4EYjpR4M7SJgACE5RyTSzJA0vxa
   yQz8Vmp8xiJUbers32VnzoN/M/+hmj7FdKFMxRgE26YOhrgPjBqu4ZRuX
   A==;
X-CSE-ConnectionGUID: PvY/u11FQhW+hgHnrbm2xQ==
X-CSE-MsgGUID: ZxA/l3TeRcaDQMXcosHU7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66427011"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66427011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 16:12:57 -0800
X-CSE-ConnectionGUID: sRmz7F3KSiG+7NKPlnfoCg==
X-CSE-MsgGUID: BYgwzL0/SaWy4WBVCDe3MA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2025 16:12:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQaUI-00000000AJl-1kQM;
	Wed, 03 Dec 2025 00:12:54 +0000
Date: Wed, 3 Dec 2025 08:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit
 (1024) in 'hmac_setkey_ahash'
Message-ID: <202512030801.YJaB0zQK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d61f1cc5db799f4e44a63418b2dc19396787427b
commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
date:   7 months ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20251203/202512030801.YJaB0zQK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030801.YJaB0zQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030801.YJaB0zQK-lkp@intel.com/

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
