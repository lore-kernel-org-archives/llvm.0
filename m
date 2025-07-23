Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335D1E9B2A;
	Wed, 23 Jul 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753306160; cv=none; b=BfCgfNonYSTXOPlAAgdo3MHoLYgsPc4+saaRQXaJj+HNAiHcebvCOOgqJX005CxWOotSqQd2ijcUjAlBt2PaigNFH/lnuHCaBn47XFDnx92obTrSf91EY8egjtryBz1QhFcsyod3VFzMFi1gYyfO/qt3YOQaw6N0JSb0oGH45OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753306160; c=relaxed/simple;
	bh=zAWAhhvWXU+oi3yWc/SqgqYpYzEUylCz+ZcMCl+21wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJhb5cZ4N/sem1z8uTjKVfRJ500eothlnDX8gSpg18NcGGstak4Jp9QeUKHR6f8YyLreZEsCGqpMRhjRnbEl4ATPWjWUz7/58DjXG266UjPz9plc2ai6RwVXugNP7gTSbm7EbZnqHE6Irvx45f6PEUn30WpHKkSsUhO13k1u3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V24t4nEL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V24t4nEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753306159; x=1784842159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAWAhhvWXU+oi3yWc/SqgqYpYzEUylCz+ZcMCl+21wc=;
  b=V24t4nELze3CNL5nqyZykR/cMtp+9tDA7TQpt3EhJ+dMp8QrPjqymXgF
   cMRjZYlR3KvdmkC1cKTEfFLCuTADX8BVkONzaOduoI9J3Uk2JH/ZxGsXP
   qcvYHKt4k6PQYk3iR6Ea5o5DXyVPYXtjJ4QYv7NtFxfURVwd7UBbnduty
   YtCsYfdcAcRHatRC2aA5txEOeMC3sYtdu3Md9r5EicK6TCQG9WnWFyHOR
   tOk8p1WpYlHEpEOMxZVpVT28XxUvpFFls+9GH6dIRdBa/OES/vbbMurdN
   OaPGO0cancJQOqohf5O08/uD/p736DKpmd29pDTUiX8rFc48OuZi5rB5j
   Q==;
X-CSE-ConnectionGUID: sP434F2MRumaTC+2/FrZfg==
X-CSE-MsgGUID: OaUbqkcARQaBHWaLfJKnfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78140987"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="78140987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 14:29:18 -0700
X-CSE-ConnectionGUID: wU6TqcFgRtONveESPBV9+Q==
X-CSE-MsgGUID: AqQSKtu7SXyOb8j8d9qHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="160470109"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2025 14:29:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueh1W-000JoH-22;
	Wed, 23 Jul 2025 21:29:14 +0000
Date: Thu, 24 Jul 2025 05:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit
 (1024) in 'hmac_setkey_ahash'
Message-ID: <202507240507.5fyAWOKF-lkp@intel.com>
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
head:   01a412d06bc5786eb4e44a6c8f0f4659bd4c9864
commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
date:   9 weeks ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20250724/202507240507.5fyAWOKF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240507.5fyAWOKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240507.5fyAWOKF-lkp@intel.com/

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
