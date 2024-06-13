Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BA51428FC;
	Thu, 13 Jun 2024 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278735; cv=none; b=i6RiX7XdTYHh3GyTt/Qz77t9ZvL7AiMzGrY9TjO7Z+O/8siogfjAftlpJuxTWat8im03lwgq6jzbWX1tyHENKtalT4YPIiidkRxbdKGgwhbXPlZCGxX8hGJbMTe13YSbZMuXP4n62S2o16k7eoKUHQKDnxFb1l9STe8DII1Nr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278735; c=relaxed/simple;
	bh=kc2wGPCf8fw2xZNvSde/pA1Ba3m3HWV0VOTl3uTLzFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJWhENNU6hMle+JkiD5MF2ptiCnuXonAU4f7EGlyvFF8QC73nTfZbqvtfAJgWnbZboHf9Sg+6u9SRk4jNT7GF+oXB02QtctKMbMTi5+9Z+C3aR1R/Td/HpJ8AK1gR3d2i8Na8rQKlYFs/w6Fm4nvVTuV929NPvivf6bOuJcu5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR48vOVo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR48vOVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718278734; x=1749814734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kc2wGPCf8fw2xZNvSde/pA1Ba3m3HWV0VOTl3uTLzFs=;
  b=mR48vOVo3S/7R2KxSS5B1IOFzt26oshGtR4wr2SPDqbd3Z04xVYg5uBu
   7XjO9efesWtCSjFIiAgDH22LPOxyTlMy4hjEyyazkK3CEtteEcbZL7R/p
   laOd06zmoC1cs5B9m7rKQXe3gdN+0WP3BshXY+00D5U1uZ4CsbNZS4T0L
   nJBk8t/MXw6SfrHr6Bng9UMmd4yi2Kfsz+0fkdp6cWXfbwn/1GdJ1/sPV
   0Ok+OApk5CM5PLoOlaFWkV0l5Q+RnBfDjLlRdIVEGgMNaUJpofOqZWk5o
   3JeEk7tIAo1qzK/5aHLsIYa4g0fJ7Ft2KOhZo/kTmm/TuVZUiPIDbeH8V
   Q==;
X-CSE-ConnectionGUID: SeKTplzPTK+BveHYD6rlTQ==
X-CSE-MsgGUID: bzrprpk8TNWhoGwWphkJkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14967218"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="14967218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 04:38:53 -0700
X-CSE-ConnectionGUID: dI9Gpuq/TqytdRU56ddI/g==
X-CSE-MsgGUID: 2DLOxBRLSG2wuP2ktDVgYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="39978473"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jun 2024 04:38:52 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHin4-0002YE-0x;
	Thu, 13 Jun 2024 11:38:50 +0000
Date: Thu, 13 Jun 2024 19:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 4/7] crypto/tpm2_key.c:66:46: warning:
 format specifies type 'unsigned long' but the argument has type 'size_t'
 (aka 'unsigned int')
Message-ID: <202406131947.HQPeOX9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   d9163bc5bda8b6415ef960406b9bc952fa1b1b9f
commit: a6354b96f28990ba3d0b8753f0f639127febccb0 [4/7] crypto: tpm2_key: Implement a robust parser
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240613/202406131947.HQPeOX9t-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131947.HQPeOX9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131947.HQPeOX9t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/tpm2_key.c:66:46: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      66 |         pr_info("%s: header size: %lu\n", __func__, header_size);
         |                                   ~~~               ^~~~~~~~~~~
         |                                   %zu
   include/linux/printk.h:537:34: note: expanded from macro 'pr_info'
     537 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   crypto/tpm2_key.c:67:46: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      67 |         pr_info("%s: public size: %lu\n", __func__, size);
         |                                   ~~~               ^~~~
         |                                   %zu
   include/linux/printk.h:537:34: note: expanded from macro 'pr_info'
     537 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +66 crypto/tpm2_key.c

    44	
    45	int tpm2_parse_public(void *context, size_t hdrlen, u8 tag, const void *value, size_t size)
    46	{
    47		const void *ptr = value + sizeof(struct tpm2_public);
    48		struct tpm2_key *work = context;
    49		size_t header_size;
    50	
    51		if (!tpm2_key_valid(value, size))
    52			return -EBADMSG;
    53	
    54		if (sizeof(struct tpm2_public) > size - 2)
    55			return -EBADMSG;
    56	
    57		ptr += 2 + get_unaligned_be16(ptr);
    58		header_size = ptr - value;
    59	
    60		if ((ptr - value) > size - 2)
    61			return -EBADMSG;
    62	
    63		work->public = value;
    64		work->public_size = size;
    65	
  > 66		pr_info("%s: header size: %lu\n", __func__, header_size);
    67		pr_info("%s: public size: %lu\n", __func__, size);
    68		return 0;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
