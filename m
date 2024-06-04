Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B1A5F;
	Tue,  4 Jun 2024 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539867; cv=none; b=ChbqY7PuFkx3Gv2new49217KY7Y1NNqARzzLzmbmcURART3UigzwiWEnW1XZpOrc5PE1SumyE6ZQmq9l7ysC6aVAZDSYacdAr5Sihu3waWEJL73Qpia3a5HwR85+RMCO2qqSQ3BEPfhxesgsKqVuETxVqlB+YzugYMOgSekYPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539867; c=relaxed/simple;
	bh=DaIF5g4h026kkd8Kr4YOZqYE2KAv1GfAwYsB1XchsE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ae0mkNx72feKRj5vp9bm2BAO0/fhYmxOy29RsaXd93JQd4SdNbsmJYFwjG0fo0/4M2j+6CKcXDjLIkmtUjv0TH1sl0UTqwDNYAGZVAm+UjqZ+ms5WihLcIUwJTHLtlb8KTIPFmulRszuBWPuRqCK8wji1yZezVzxnMYfPM6Kl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ftm47uv/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ftm47uv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717539865; x=1749075865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DaIF5g4h026kkd8Kr4YOZqYE2KAv1GfAwYsB1XchsE4=;
  b=Ftm47uv/v7DR/k+AOT+nqPzW0WAqlS71CuxQkAOv9KfkVbOCLybDAajz
   57Q69XniicpF1FxLR6tQFnhK2p5JsaZMaAPW2BOP2678maxCAAaCtfqZ4
   3pK2C5mT0TT552j1KOmiCVYzG90xO/gLQePF91lNwDjRDszXiDmqaXlXG
   UqgR7vdw/7vsAzTfBqXAmm2DHdYJ6BeoK4qwlDGItiFYB4yqQ88iY34kS
   8EjR04HNqnjMAcWgO/reelP6boYOol/Ie1RjoqyWnytiKHmhSBAqU4iZG
   xR9izLTQauO0JRAaTQL0rTXrnDDkYUoKZzmT19IB2SrDAtunvoKKYu9cb
   A==;
X-CSE-ConnectionGUID: VjeRE8UqR9GCu7Y+AILgEA==
X-CSE-MsgGUID: EYvtql4pR6aNaa6XhmjxQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17055281"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="17055281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 15:24:23 -0700
X-CSE-ConnectionGUID: MsEbv0eRSfyggnUHnYc7hg==
X-CSE-MsgGUID: brjN/PJ7Q3CeK9nWn8TRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37442901"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2024 15:24:22 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEcZm-0000bz-1k;
	Tue, 04 Jun 2024 22:24:18 +0000
Date: Wed, 5 Jun 2024 06:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: [linux-next:master 1323/3381]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4: error: format specifies type
 'unsigned char' but the argument has type 'int'
Message-ID: <202406050622.SmOX6DL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d97496ca23a2d4ee80b7302849404859d9058bcd
commit: 0ea55445554209913a72eab86b60f5788776c4d6 [1323/3381] drm/amdgpu: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
config: arm64-randconfig-003-20240605 (https://download.01.org/0day-ci/archive/20240605/202406050622.SmOX6DL6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050622.SmOX6DL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050622.SmOX6DL6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4: error: format specifies type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
                    xcc_id, ring->me, ring->pipe, ring->queue);
                    ^~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:12: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
                    xcc_id, ring->me, ring->pipe, ring->queue);
                            ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:22: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
                    xcc_id, ring->me, ring->pipe, ring->queue);
                                      ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:34: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
                    xcc_id, ring->me, ring->pipe, ring->queue);
                                                  ^~~~~~~~~~~
   4 errors generated.


vim +333 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

71c37505e7eaa0 Alex Deucher         2017-06-07  306  
4acd31e6c2b97c Ma Jun               2024-02-18  307  int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev, int xcc_id)
71c37505e7eaa0 Alex Deucher         2017-06-07  308  {
def799c6596d07 Le Ma                2022-05-24  309  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
4acd31e6c2b97c Ma Jun               2024-02-18  310  	struct amdgpu_irq_src *irq = &kiq->irq;
4acd31e6c2b97c Ma Jun               2024-02-18  311  	struct amdgpu_ring *ring = &kiq->ring;
71c37505e7eaa0 Alex Deucher         2017-06-07  312  	int r = 0;
71c37505e7eaa0 Alex Deucher         2017-06-07  313  
43ca8efa46d9b1 pding                2017-10-13  314  	spin_lock_init(&kiq->ring_lock);
71c37505e7eaa0 Alex Deucher         2017-06-07  315  
71c37505e7eaa0 Alex Deucher         2017-06-07  316  	ring->adev = NULL;
71c37505e7eaa0 Alex Deucher         2017-06-07  317  	ring->ring_obj = NULL;
71c37505e7eaa0 Alex Deucher         2017-06-07  318  	ring->use_doorbell = true;
def799c6596d07 Le Ma                2022-05-24  319  	ring->xcc_id = xcc_id;
3566938b3491bb Le Ma                2021-12-20  320  	ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
233bb3733bd439 Lijo Lazar           2023-01-19  321  	ring->doorbell_index =
233bb3733bd439 Lijo Lazar           2023-01-19  322  		(adev->doorbell_index.kiq +
233bb3733bd439 Lijo Lazar           2023-01-19  323  		 xcc_id * adev->doorbell_index.xcc_doorbell_range)
233bb3733bd439 Lijo Lazar           2023-01-19  324  		<< 1;
71c37505e7eaa0 Alex Deucher         2017-06-07  325  
def799c6596d07 Le Ma                2022-05-24  326  	r = amdgpu_gfx_kiq_acquire(adev, ring, xcc_id);
71c37505e7eaa0 Alex Deucher         2017-06-07  327  	if (r)
71c37505e7eaa0 Alex Deucher         2017-06-07  328  		return r;
71c37505e7eaa0 Alex Deucher         2017-06-07  329  
71c37505e7eaa0 Alex Deucher         2017-06-07  330  	ring->eop_gpu_addr = kiq->eop_gpu_addr;
a783910d5c8b45 Alex Deucher         2020-04-09  331  	ring->no_scheduler = true;
0ea55445554209 Srinivasan Shanmugam 2024-05-21  332  	snprintf(ring->name, sizeof(ring->name), "kiq_%hhu.%hhu.%hhu.%hhu",
345a36c4f1baa0 Jani Nikula          2024-01-10 @333  		 xcc_id, ring->me, ring->pipe, ring->queue);
c107171b8d3241 Christian König      2021-02-02  334  	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
c107171b8d3241 Christian König      2021-02-02  335  			     AMDGPU_RING_PRIO_DEFAULT, NULL);
71c37505e7eaa0 Alex Deucher         2017-06-07  336  	if (r)
71c37505e7eaa0 Alex Deucher         2017-06-07  337  		dev_warn(adev->dev, "(%d) failed to init kiq ring\n", r);
71c37505e7eaa0 Alex Deucher         2017-06-07  338  
71c37505e7eaa0 Alex Deucher         2017-06-07  339  	return r;
71c37505e7eaa0 Alex Deucher         2017-06-07  340  }
71c37505e7eaa0 Alex Deucher         2017-06-07  341  

:::::: The code at line 333 was first introduced by commit
:::::: 345a36c4f1baa03275d88cd13747c6c1748b1fc0 drm/amdgpu: prefer snprintf over sprintf

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
