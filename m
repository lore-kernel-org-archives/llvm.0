Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB63DFC88;
	Fri, 10 Apr 2026 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840947; cv=none; b=imA2KOVhhUoxttSzmtzVvTy8iq8vp5b6z4Man+Yi5cgHCodTFEXrY7yQtC7nJvfvxSKZ+Zry9lEJaAVxIGXyOt0bGqKcf6eGMYEWdrnx7NL+SvhOincXp/JIz0h7QhHHd7Fzj/bjyQONm3GLWaw7oOArF02iuKiP79c9u3tt5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840947; c=relaxed/simple;
	bh=Or6isq0RdiHFUt5VGq3PE2xmwnErovWmQesaxc5lnQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZmVb2rMc6/6Z/S6FMMvZgHt4vMjMkjh2lNcE6uEvNjfpq1Wg8j4kol91DFbpyOGQg3P22+z6fkf7VOmRbUlY2KrazdSjkQzr7kVw0z8jkm+m7e9sT6rR77hr8VjS3R3/dx12jO83JG7cYMIQYIG/aCJc30eLH/VNpOxIVuITUBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPVXwL8m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPVXwL8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775840945; x=1807376945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Or6isq0RdiHFUt5VGq3PE2xmwnErovWmQesaxc5lnQU=;
  b=YPVXwL8mdHjLf+uVJslsl5sdIe+IW0pjJfXu69NACC6EB+wqC0Xr/Jd+
   HrkmySSR2UwpiylMom8yw1s5Y7tC0L596Mk2VHF0r29JMCHDFrLYQ4Ssn
   6Pa+OQJpLZFsO5VIu6L8L0amD0VsxeOiWpHUvb9df1hlw5bi2wPXh2kRj
   YTHapf/NtkQktdSrIJkLsq651yGtF4WaDzwEGgn+iOkDkhdYWPTacIGBK
   3PYHuUeYZ9EO0+J/a7Hu7n3oG7mo95VA//oiQsTYCWHF6hcNsoO/iLW15
   GPEwTu5b9mLrS0539Ph2YRTBqO2N5bvRUUhve7C9cedtc1nCb3u7nuCBa
   g==;
X-CSE-ConnectionGUID: BCsu/egFSPSKOOOjngUp4A==
X-CSE-MsgGUID: /+RG2ouAQJKHaA342Opeug==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88308784"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88308784"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 10:09:04 -0700
X-CSE-ConnectionGUID: Ro7A8iE+Rwu8Bjvl6W9wyQ==
X-CSE-MsgGUID: TKKMdpbHR2GNPaYeuaRHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="234065603"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2026 10:09:02 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBFLn-00000000429-4ANj;
	Fri, 10 Apr 2026 17:08:59 +0000
Date: Sat, 11 Apr 2026 01:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [linux-next:master 728/13151]
 drivers/gpu/drm/i915/selftests/i915_active.c:326:23: error: no member named
 'lock' in 'struct dma_fence'
Message-ID: <202604110107.XKR8jZTJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa7d958829eb9bc3b469ed07f11de3d2804ef71
commit: 1f32f310a13c9fb67a9993ab67f596b3f960206f [728/13151] dma-buf: inline spinlock for fence protection v5
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110107.XKR8jZTJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110107.XKR8jZTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110107.XKR8jZTJ-lkp@intel.com/

Note: the linux-next/master HEAD 3fa7d958829eb9bc3b469ed07f11de3d2804ef71 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_active.c:1177:
>> drivers/gpu/drm/i915/selftests/i915_active.c:326:23: error: no member named 'lock' in 'struct dma_fence'
     326 |         spin_lock_irq(fence->lock);
         |                       ~~~~~  ^
   drivers/gpu/drm/i915/selftests/i915_active.c:328:25: error: no member named 'lock' in 'struct dma_fence'
     328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
         |                         ~~~~~  ^
   2 errors generated.


vim +326 drivers/gpu/drm/i915/selftests/i915_active.c

38813767c7c5d9 Chris Wilson 2019-11-01  316  
e3e7aeec3281af Chris Wilson 2020-03-06  317  static void active_flush(struct i915_active *ref,
e3e7aeec3281af Chris Wilson 2020-03-06  318  			 struct i915_active_fence *active)
e3e7aeec3281af Chris Wilson 2020-03-06  319  {
e3e7aeec3281af Chris Wilson 2020-03-06  320  	struct dma_fence *fence;
e3e7aeec3281af Chris Wilson 2020-03-06  321  
e3e7aeec3281af Chris Wilson 2020-03-06  322  	fence = xchg(__active_fence_slot(active), NULL);
e3e7aeec3281af Chris Wilson 2020-03-06  323  	if (!fence)
e3e7aeec3281af Chris Wilson 2020-03-06  324  		return;
e3e7aeec3281af Chris Wilson 2020-03-06  325  
e3e7aeec3281af Chris Wilson 2020-03-06 @326  	spin_lock_irq(fence->lock);
e3e7aeec3281af Chris Wilson 2020-03-06  327  	__list_del_entry(&active->cb.node);
e3e7aeec3281af Chris Wilson 2020-03-06  328  	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
e3e7aeec3281af Chris Wilson 2020-03-06  329  	atomic_dec(&ref->count);
e3e7aeec3281af Chris Wilson 2020-03-06  330  
e3e7aeec3281af Chris Wilson 2020-03-06  331  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
e3e7aeec3281af Chris Wilson 2020-03-06  332  }
e3e7aeec3281af Chris Wilson 2020-03-06  333  

:::::: The code at line 326 was first introduced by commit
:::::: e3e7aeec3281af446d7410d6982020e1aa5795fc drm/i915/selftests: Apply a heavy handed flush to i915_active

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
