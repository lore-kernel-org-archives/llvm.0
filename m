Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A55242D6C;
	Thu, 16 Apr 2026 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776308724; cv=none; b=nw9VXinCbQTyYqFU0boK6ie8FLcu+IX65ZXwdoiKVboSRtEEBulGxk8dWCb3bvMSmarnghm52qpLDSh0HIMdXC9Z4Fsu0/p9VxPjK9yqZF/tb1Mc6SPpAyUY6ZTT/0KWmIhSXEl0Pzu0oHx20BAc0447DTRIyiUhxfLmGmmVMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776308724; c=relaxed/simple;
	bh=oLlRjTggjSKGCdDYy8mh0XDo852VTrTFEUJ8S01rCTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dd8bp0zSeijFJdj56KpOXt2O3xlAbUmelLx7llYRx4y3aE7r7coL+PzUr++Q8l9Q8YgD/0zwTh62Yo7YCcCX6jwxEo+70V/lPwnJR6tlVRPVhBHjvrcg/DvRQtzH2IC75Tfn67DE9CTUZys3Nqzdx03fIZl9/sYsxc/9Jhlhe00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwyJfxSR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwyJfxSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776308722; x=1807844722;
  h=date:from:to:cc:subject:message-id;
  bh=oLlRjTggjSKGCdDYy8mh0XDo852VTrTFEUJ8S01rCTk=;
  b=TwyJfxSR8AR8Z78EwvBkuTkNsb1QgN+Ipn1kzxJeLl/QIpqyYA2YYUIC
   AC+OviMazNCTvZ3AnNsQzKalz1lcmxfwzU9HTDjayWmuUCRhH++pInbKQ
   v6Wkz/b+qI5KdRaLYBaVYN3XxqylSkIvz5Pnmxitf6swE5bKebvbXAYrN
   btMkGl7p1jS2HemG7H7ybHXzc7+g6No30J0Z86zk+Nd+JZOroqBVCVaP7
   l4FTlp8k0019PMSqFPAcP8iQNY9CniTzgwJ0ebTadVuZkzJEtHBw3J8uf
   zuTbW7+rumy0bjGAGB1CMTXjcK5EZJKhoaYnVIh4laYFrpNHR4PMspHq7
   g==;
X-CSE-ConnectionGUID: eTHQ/33VTxS0lWu+zVC8fQ==
X-CSE-MsgGUID: fnOTRcd3TX+ntGowKnnYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87602010"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="87602010"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:05:20 -0700
X-CSE-ConnectionGUID: QTvpotYRRqGR7rMmBoQ6hw==
X-CSE-MsgGUID: ylI335nnSi+jl2U5PyKpkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230534856"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Apr 2026 20:05:19 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDD2Z-000000001E8-3ztT;
	Thu, 16 Apr 2026 03:05:15 +0000
Date: Thu, 16 Apr 2026 11:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:251:12: warning: stack frame size (1152)
 exceeds limit (1024) in 'hmac_setkey_ahash'
Message-ID: <202604161035.PMTaI4Cg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9e1e9d660255d7216067193d774f338d08d8528d
commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
date:   11 months ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20260416/202604161035.PMTaI4Cg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161035.PMTaI4Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c3103416d521 ("crypto: hmac - Add ahash support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161035.PMTaI4Cg-lkp@intel.com/

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
