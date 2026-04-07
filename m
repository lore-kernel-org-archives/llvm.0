Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDD3A1E8C;
	Tue,  7 Apr 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549960; cv=none; b=bWw7VxTOxCj31BfVWF6CPv6eNC3wfTH3pH04hhufElGo8bSFxdzbj/WFFa1SUMQidUYXhVgMKx9rFwXqO8KYujvZy+mBbDGDyFu5O30CVU280gzrvrY5sPwY9ZNOcyvJNVtvmRb4ll5NbipTC4ker+6+x+heSdAh+vsNceJW1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549960; c=relaxed/simple;
	bh=9YCb96n+B4yy1l/JYKHgCpIr7s8EOaFMlHCUga4NlFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzjOYk4fWmct9zrk6Mucc938EuMGqCKUZ/ZlRy3CwHYTFPll15i1g5XtpSA4OcmJYMhpB/ttHTy7pDwu8+VvlerlQKF6FnvGdhp1IzmtHSNCF0kILpcMMvqNLu/xrEtEJGlrm3M/7YbqEjzaY5MCH3qBOmEJVvL22105sxEeB9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvLXjnSZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvLXjnSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775549958; x=1807085958;
  h=date:from:to:cc:subject:message-id;
  bh=9YCb96n+B4yy1l/JYKHgCpIr7s8EOaFMlHCUga4NlFs=;
  b=SvLXjnSZLdFHDuP/hITPnQ+bMobac1qGHrHEKHS1RkHt2J6MccVqTfJR
   aexEsJ88AijCDINqt6fdFKt57vgO8Wa2lUGh7BaAOylry2MWvuz+6IY7L
   QWZMlnkqeDY9r16qs32a2OA9SColtkWFiUKzmF68dKgvIZl3jnfZRV50O
   MyNQwNypvqE0kKqX8xQa/UmrlqNnW+txWXNL3fLbdcUVE8RI7NmQr2qAf
   rAACVGJ6jh/hbVF4LqWIemacaIzg/5J3bQEK6nQNe3rIkENw/E4ROdgrs
   p8dbCS1BetAc8yYdeNrkJhz/WEy74ZM5HhAEpS+yE5eH2oohTjjm1duno
   w==;
X-CSE-ConnectionGUID: hy82+c6bT4afQtpxiS9sXA==
X-CSE-MsgGUID: Q6dx9nUpRMq2B6dDS+PmXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76389122"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76389122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:19:18 -0700
X-CSE-ConnectionGUID: 4rZpyfeWTaiUxXsWMTBF7Q==
X-CSE-MsgGUID: ipSF0BbBR5SvNbomIxzP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233069563"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 01:19:16 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA1eT-000000000Ml-1qV2;
	Tue, 07 Apr 2026 08:19:13 +0000
Date: Tue, 07 Apr 2026 16:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/51] fs/rpdfs/block.c:309:6:
 warning: variable 'now' is used uninitialized whenever '&&' condition is
 false
Message-ID: <202604071621.RJ4cJwBm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Zach,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/51] rpdfs: initial commit
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071621.RJ4cJwBm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071621.RJ4cJwBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071621.RJ4cJwBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/rpdfs/block.c:309:6: warning: variable 'now' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     309 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:312:15: note: uninitialized use occurs here
     312 |         WARN_ON_ONCE(now < 0);
         |                      ^~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/rpdfs/block.c:309:6: note: remove the '&&' if its condition is always true
     309 |         if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/block.c:307:9: note: initialize the variable 'now' to silence this warning
     307 |         s64 now;
         |                ^
         |                 = 0
   1 warning generated.
--
>> fs/rpdfs/super.c:160:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     160 |         case Opt_mkfs:
         |              ^~~~~~~~
   fs/rpdfs/super.c:178:9: note: uninitialized use occurs here
     178 |         return ret;
         |                ^~~
   fs/rpdfs/super.c:153:9: note: initialize the variable 'ret' to silence this warning
     153 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +309 fs/rpdfs/block.c

   304	
   305	static void put_block(struct rpdfs_block *bk)
   306	{
   307		s64 now;
   308	
 > 309		if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
   310			free_block(bk);
   311	
   312		WARN_ON_ONCE(now < 0);
   313		WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
