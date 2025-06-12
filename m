Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D482BD013;
	Thu, 12 Jun 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741690; cv=none; b=IaQIR/P9T7vX/RhL8wyjEaekP6Fv+w7hq7csPuNoc0NKFac21tglBbTy1v14StUZLp3IuyzldQIzWDcvc6mceuKYGGbN7UBGUQNgAKweb5Ct5BfYZIVhA1F41FfkdENChxnCJBaYH6vMdkguElp3bNmw4T9Yi9gyhiVlkqIfc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741690; c=relaxed/simple;
	bh=Djn8nhsFH8EBoL6/rpUpNkoXQl7/TmUbu+/DzUeyPy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYQRx27P5LZIPFD0JMMTpK6F2EWv7jbZgwuu1tGN+GSwepmF5KorVWLswHcEzv9M9EddUuVojtzTZmL8lAK1NfaBCcORQ9WheQvBZEEgjKESrLlqzoOm0nPAdq8wfZy4/sBCVtxWXGOi+lN7jPoDBJPCib97wy0lA6L32XBrVUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8Qo2jll; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8Qo2jll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749741689; x=1781277689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Djn8nhsFH8EBoL6/rpUpNkoXQl7/TmUbu+/DzUeyPy0=;
  b=N8Qo2jllGKC9JBIW8SwU0BYNT0NkaTAz3Bsz34EILV5QFUVT7jA6uDdH
   ef77bc7NJi+95qexx467I9z59LgKkRbrC0wnvTx80G0zbbGrwIXX9d5hG
   2z+tkoArdzh5ipIsiigWUN9chVMZrApi8eFqCQyiNQFaD2h6wyuptr25t
   DjwsHBB0zi5xqW0AmGIQaQgknL4YNIyQmlb3CESGUjXxelR3JcLQuZQnG
   8DF2Pdox/JcVzE4Z8aVfeecuFGs9IeybA5pyurkuHh1Hb2rlVfCNNqyD4
   Iw6wUMeoTgOxV1j8i3l5N4KaTOdiQKgBVTqB/Ej0w9b+sxwP93RJlIi45
   A==;
X-CSE-ConnectionGUID: imbiJRrySpu89rspDVYMIA==
X-CSE-MsgGUID: CgOEtVY+RzaT+Uf8beh4bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69366525"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="69366525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 08:21:28 -0700
X-CSE-ConnectionGUID: 2VJ/05PfRxmJ0J1NDyfOPg==
X-CSE-MsgGUID: ECvaRSvCTDiRXSQAflo9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="152317193"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 08:21:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPjk4-000Bhe-1R;
	Thu, 12 Jun 2025 15:21:24 +0000
Date: Thu, 12 Jun 2025 23:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/memory-region 2/17]
 drivers/remoteproc/ti_k3_common.c:523:13: warning: variable 'rmem' is
 uninitialized when used here
Message-ID: <202506122318.qkhIU3u8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
head:   acb6a336a64dc26032171de30a4d43a25aa88284
commit: ad8112ef27e513573350ff33dfc28c2796c294ec [2/17] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
config: hexagon-randconfig-001-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122318.qkhIU3u8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506122318.qkhIU3u8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506122318.qkhIU3u8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_common.c:476:22: warning: unused variable 'rmem_np' [-Wunused-variable]
     476 |         struct device_node *rmem_np;
         |                             ^~~~~~~
>> drivers/remoteproc/ti_k3_common.c:523:13: warning: variable 'rmem' is uninitialized when used here [-Wuninitialized]
     523 |                                 i + 1, &rmem->base, &rmem->size);
         |                                         ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/remoteproc/ti_k3_common.c:477:27: note: initialize the variable 'rmem' to silence this warning
     477 |         struct reserved_mem *rmem;
         |                                  ^
         |                                   = NULL
   2 warnings generated.


vim +/rmem +523 drivers/remoteproc/ti_k3_common.c

744270b336c70b Beleswar Padhi    2025-05-13  471  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  472  int k3_reserved_mem_init(struct k3_rproc *kproc)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  473  {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  474  	struct device *dev = kproc->dev;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  475  	struct device_node *np = dev->of_node;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  476  	struct device_node *rmem_np;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  477  	struct reserved_mem *rmem;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  478  	int num_rmems;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  479  	int ret, i;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  480  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  481) 	num_rmems = of_reserved_mem_region_count(np);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  482  	if (num_rmems < 0) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  483  		dev_err(dev, "device does not reserved memory regions (%d)\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  484  			num_rmems);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  485  		return -EINVAL;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  486  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  487  	if (num_rmems < 2) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  488  		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  489  			num_rmems);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  490  		return -EINVAL;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  491  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  492  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  493  	/* use reserved memory region 0 for vring DMA allocations */
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  494  	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  495  	if (ret) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  496  		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  497  		return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  498  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  499  	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  500  	if (ret)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  501  		return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  502  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  503  	num_rmems--;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  504  	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  505  	if (!kproc->rmem)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  506  		return -ENOMEM;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  507  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  508  	/* use remaining reserved memory regions for static carveouts */
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  509  	for (i = 0; i < num_rmems; i++) {
ad8112ef27e513 Rob Herring (Arm  2025-03-13  510) 		struct resource res;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  511  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  512) 		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
ad8112ef27e513 Rob Herring (Arm  2025-03-13  513) 		if (ret)
ad8112ef27e513 Rob Herring (Arm  2025-03-13  514) 			return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  515  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  516) 		kproc->rmem[i].bus_addr = res.start;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  517  		/* 64-bit address regions currently not supported */
ad8112ef27e513 Rob Herring (Arm  2025-03-13  518) 		kproc->rmem[i].dev_addr = (u32)res.start;
ad8112ef27e513 Rob Herring (Arm  2025-03-13  519) 		kproc->rmem[i].size = resource_size(&res);
ad8112ef27e513 Rob Herring (Arm  2025-03-13  520) 		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  521  		if (!kproc->rmem[i].cpu_addr) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  522  			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13 @523  				i + 1, &rmem->base, &rmem->size);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  524  			return -ENOMEM;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  525  		}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  526  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  527  		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  528  			i + 1, &kproc->rmem[i].bus_addr,
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  529  			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  530  			kproc->rmem[i].dev_addr);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  531  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  532  	kproc->num_rmems = num_rmems;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  533  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  534  	return 0;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  535  }
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  536  EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  537  

:::::: The code at line 523 was first introduced by commit
:::::: c52d5f1d2aaca18b57b71d1c146e03fd08bbd91a remoteproc: k3: Refactor reserved_mem_init() functions into common driver

:::::: TO: Beleswar Padhi <b-padhi@ti.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
