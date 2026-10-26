Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013651;
	b=wJ+fSzGHib4Es6QOm8k5Msjevg/M9gmY2RPgbzruMawRwgASvV90L2fovpNntaJ9zZ20
	 VWf8NOcnwtbQjOkTv41JCI2DV3N9kbhDo+Eu9Wy9wbYvHqIqEweTzCGSw37wBHdp1ldEw
	 ISPyoTswd4Z2VznLJ6LUxFMSrzb3QT2TMq9IxI7V0Ib3cr+Uv3iR5uGg0OvUwozGxipMf
	 JrbXpONs/ZUXbO0JDdQ+N+ATNCvz22/pu76KtqRJIhH1mTqsNqh+rx6k+nNLw/TzNKqWo
	 AVursrmBmjujWnWuksDO19Aiw0GsAXjushnj/YDipjTMEI7OX5Sf/Zl/U51srj6u+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013651;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xmg2mS39hpCYA1Z3AM0sPBkLEA8uAYpfPLsJJ//wi3w=;
	b=lzmiPCIG9sAJqVYdLGWTTsq5ytHuTZCrfeAVT3AAhz+8xw6T2j2zb1rmfQQ3hMJ+HZJd
	 yN1VJmUdcFvyx5SRfs1GrkxcozbW/a9jEPq8UfT+eFYtMAeAWSIxu+98M175r1Mn+KMly
	 wKG9AmX6FcVT1DgORakT2ramdCCVNnvmFvdq0C6pvQNROP2EK9HbqUiodpou7gaJd955A
	 oblyF8HnBWI8zV5Io+/9lLb+O9z+z5ymNMOu28bsYvCSX7cyh9OaMiNK9kTytcMvin36P
	 jqmmgq8bbqyyd1kJiMORKdjt6Y6M3xIXDPWG4/vWRlBq0fIFYfoLweanOHtSGnMmLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxzYzrT5;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F052606A31A;
	Mon, 26 Oct 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F052606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxzYzrT5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793013650; x=1824549650;
  h=date:from:to:cc:subject:message-id;
  bh=iCglwzwjvzyhgl7CC1BSULErpRK6VGP/OGBu0WumKS0=;
  b=BxzYzrT5SxFzeLZVlSBjyKDLo74wVxLPAIuHoQlp74w9Eukg7+iJbl/A
   LvHukRPYQCUF6MtVzzmTPyR2MgpwWswFN6rIK0OMrM+scaqOgLJC2JQIZ
   qMzBm/o/E5K9xLAyefs0c5AHzKX/Ddlg51h88TV6FFHiI2ct2LSkFnVXr
   hyrI9M8N2c6lxjhPqLpaTSLr982mPxD3S/BMs6p6mcEo8gBhz3+EWMiqX
   HtqkQUB1O6hkKYM1k+IlFbqHspCTgSVJRJDZStrMiuxC4djc4SY/1wK06
   4ZsXzoVrc0RAU/TyTvIX5XY47UAI8o4TS61N1TPQHXfwHhFOg1XytDlID
   g==;
X-CSE-ConnectionGUID: c6z+jAigSDCVWq0twN64hA==
X-CSE-MsgGUID: xFAiVSiUSj6MMyjKnP77hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1689436"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1689436"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:20:50 -0700
X-CSE-ConnectionGUID: 7H4Su7U9R/eK/vHb0SRxbQ==
X-CSE-MsgGUID: D/858oBmTpuHgpzTYDfj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6061994"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 04:20:48 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLIkv-0000000045r-2RT5;
	Mon, 26 Oct 2026 11:20:45 +0000
Date: Mon, 26 Oct 2026 12:20:01 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 89/133] net/core/devmem.c:77:2:
 warning: ignoring return value of function declared with 'warn_unused_result'
 attribute
Message-ID: <202610261208.1M0H73SK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   09aab91c2fcb166bfe35c0f9c2c5b6b960722087
commit: 138228c4404c30f42ca28639aeab8f8a1f92d07a [89/133] dma-resv: Make checking the dma_resv_lock() return value mandatory
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261026/202610261208.1M0H73SK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261208.1M0H73SK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261208.1M0H73SK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/devmem.c:77:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
      77 |         dma_resv_lock(binding->dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/devmem.c:246:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     246 |         dma_resv_lock(dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/devmem.c:359:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     359 |         dma_resv_lock(dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/warn_unused_result +77 net/core/devmem.c

5c024716f52bb8b Bobby Eshleman     2026-01-07  66  
bd61848900bff59 Mina Almasry       2025-05-08  67  void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
170aafe35cb98e0 Mina Almasry       2024-09-10  68  {
bd61848900bff59 Mina Almasry       2025-05-08  69  	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
bd61848900bff59 Mina Almasry       2025-05-08  70  
083e64a3af77173 Stanislav Fomichev 2026-09-17  71  	if (binding->freelist)
13648ba787223c8 Stanislav Fomichev 2026-09-17  72  		WARN(binding->free_count != binding->area.num_niovs,
1cf2f913b3dd934 Stanislav Fomichev 2026-09-25  73  		     "destroying dmabuf binding with outstanding net_iovs: total=%zu, free=%u",
13648ba787223c8 Stanislav Fomichev 2026-09-17  74  		     binding->area.num_niovs, binding->free_count);
170aafe35cb98e0 Mina Almasry       2024-09-10  75  
13648ba787223c8 Stanislav Fomichev 2026-09-17  76  	kvfree(binding->area.niovs);
69ab87acc614cbe Erfan Sharafzadeh  2026-10-13 @77  	dma_resv_lock(binding->dmabuf->resv, NULL);
69ab87acc614cbe Erfan Sharafzadeh  2026-10-13  78  	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
fa516c0d8bf90da Jakub Kicinski     2025-07-31  79  				 binding->direction);
69ab87acc614cbe Erfan Sharafzadeh  2026-10-13  80  	dma_buf_unpin(binding->attachment);
69ab87acc614cbe Erfan Sharafzadeh  2026-10-13  81  	dma_resv_unlock(binding->dmabuf->resv);
170aafe35cb98e0 Mina Almasry       2024-09-10  82  	dma_buf_detach(binding->dmabuf, binding->attachment);
170aafe35cb98e0 Mina Almasry       2024-09-10  83  	dma_buf_put(binding->dmabuf);
170aafe35cb98e0 Mina Almasry       2024-09-10  84  	xa_destroy(&binding->bound_rxqs);
5c024716f52bb8b Bobby Eshleman     2026-01-07  85  	percpu_ref_exit(&binding->ref);
083e64a3af77173 Stanislav Fomichev 2026-09-17  86  	kvfree(binding->freelist);
bd61848900bff59 Mina Almasry       2025-05-08  87  	kvfree(binding->tx_vec);
170aafe35cb98e0 Mina Almasry       2024-09-10  88  	kfree(binding);
170aafe35cb98e0 Mina Almasry       2024-09-10  89  }
170aafe35cb98e0 Mina Almasry       2024-09-10  90  

:::::: The code at line 77 was first introduced by commit
:::::: 69ab87acc614cbe0bd08a65ece6e1aabee805106 net: devmem: allow peer-to-peer dma-buf attach for bindings

:::::: TO: Erfan Sharafzadeh <erfansh@meta.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
