Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DD20A5F3;
	Tue, 25 Nov 2025 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086761; cv=none; b=mo6sBCAK7tkb4LpPNgQr5mPpnzbnSm1ObckMPFVmq6o6jcSMg5/OuKHkadvySSlEpY9qEECnLZM2oNtEQalolvVBznI4CzKjagwxoW96ZqI4MuNxHEWjEv69MeDK0/KNfck1fG9J2tVMTF+SVHwLd5UVn83GiQ0FvzbGk5maPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086761; c=relaxed/simple;
	bh=9ZGYfWFgJtnna+dca+hPYw9vMbjA713F6g6NzcXCf8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asI0NA+dAuR1nOEQqnirAfBat9980sukNb2rdbOjKBqNRieWuikqT/asAxRWp/2CDDdMyjcAVwDPSN8O1+G+1iFxef36gYmDk//8e1viMFD7Y4qa1mh7gg7jl4QIHHCYxH7esc5pmkB3py1sWmOks4H+XSz92IH6I0vKR2CIC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAWgycUk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAWgycUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764086760; x=1795622760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ZGYfWFgJtnna+dca+hPYw9vMbjA713F6g6NzcXCf8o=;
  b=QAWgycUkVJN5AIxjqrurja+O0Mq665YLjR+JBrprLtwBusSDddg6kO9a
   kqw8u0ePpNfdwC8tHdMVkW/BUs3ooL6KL7qBc1q6NTibvHiws+A8qWi6D
   l4PFnzYPx1Bia0gUAGSCcvxMoGl5gRn+VMbeVkgaf65CpZyiULAUpCIyG
   ekhKucaS3nACqTmYC650u/QYhL/vHtf0at79GxamC4QOrsu91KtkgW/B9
   cVe6DGgTjRrp1vzXg0xXwIVojMLq383bXaoSWuD2Zi74MdXIz9KjnniML
   asXepLBFOpSMMNg1lCGXWAPCuOO2/HUMVp/dca4x20+kOej+0dKLUEv+x
   Q==;
X-CSE-ConnectionGUID: bhbCtdW9R2iA35g9U1q32A==
X-CSE-MsgGUID: 8BVOUhOqTW2rHe4UFRIlXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68698553"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="68698553"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 08:05:59 -0800
X-CSE-ConnectionGUID: /TM/VREMSZ+yfkIx4G+MHw==
X-CSE-MsgGUID: Orwqdye7QyOQ50e9mhCvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197791962"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2025 08:05:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNvYA-000000001zp-31x1;
	Tue, 25 Nov 2025 16:05:54 +0000
Date: Wed, 26 Nov 2025 00:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 1/2] remoteproc: Use of_reserved_mem_region_*
 functions for "memory-region"
Message-ID: <202511252230.MRBagKGI-lkp@intel.com>
References: <20251124182751.507624-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v6.18-rc7 next-20251125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/remoteproc-qcom-Use-of_reserved_mem_region_-functions-for-memory-region/20251125-023031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20251124182751.507624-1-robh%40kernel.org
patch subject: [PATCH v7 1/2] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251125/202511252230.MRBagKGI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252230.MRBagKGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252230.MRBagKGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/st_remoteproc.c:158:3: warning: variable 'index' is incremented both in the loop header and in the loop body [-Wfor-loop-analysis]
     158 |                 index++;
         |                 ^
   drivers/remoteproc/st_remoteproc.c:127:39: note: incremented here
     127 |         for (int index = 0; index < entries; index++) {
         |                                              ^
   1 warning generated.


vim +/index +158 drivers/remoteproc/st_remoteproc.c

3df52ed7f269a2 Loic Pallardy     2019-01-10  117  
3df52ed7f269a2 Loic Pallardy     2019-01-10  118  static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
3df52ed7f269a2 Loic Pallardy     2019-01-10  119  {
3df52ed7f269a2 Loic Pallardy     2019-01-10  120  	struct device *dev = rproc->dev.parent;
3df52ed7f269a2 Loic Pallardy     2019-01-10  121  	struct device_node *np = dev->of_node;
3df52ed7f269a2 Loic Pallardy     2019-01-10  122  	struct rproc_mem_entry *mem;
63a1074795248e Rob Herring (Arm  2025-11-24  123) 	int entries;
63a1074795248e Rob Herring (Arm  2025-11-24  124) 
63a1074795248e Rob Herring (Arm  2025-11-24  125) 	entries = of_reserved_mem_region_count(np);
63a1074795248e Rob Herring (Arm  2025-11-24  126) 
63a1074795248e Rob Herring (Arm  2025-11-24  127) 	for (int index = 0; index < entries; index++) {
63a1074795248e Rob Herring (Arm  2025-11-24  128) 		struct resource res;
63a1074795248e Rob Herring (Arm  2025-11-24  129) 		int ret;
63a1074795248e Rob Herring (Arm  2025-11-24  130) 
63a1074795248e Rob Herring (Arm  2025-11-24  131) 		ret = of_reserved_mem_region_to_resource(np, index, &res);
63a1074795248e Rob Herring (Arm  2025-11-24  132) 		if (ret)
63a1074795248e Rob Herring (Arm  2025-11-24  133) 			return ret;
3df52ed7f269a2 Loic Pallardy     2019-01-10  134  
3df52ed7f269a2 Loic Pallardy     2019-01-10  135  		/*  No need to map vdev buffer */
63a1074795248e Rob Herring (Arm  2025-11-24  136) 		if (!strstarts(res.name, "vdev0buffer")) {
3df52ed7f269a2 Loic Pallardy     2019-01-10  137  			/* Register memory region */
3df52ed7f269a2 Loic Pallardy     2019-01-10  138  			mem = rproc_mem_entry_init(dev, NULL,
63a1074795248e Rob Herring (Arm  2025-11-24  139) 						   (dma_addr_t)res.start,
63a1074795248e Rob Herring (Arm  2025-11-24  140) 						   resource_size(&res), res.start,
3df52ed7f269a2 Loic Pallardy     2019-01-10  141  						   st_rproc_mem_alloc,
3df52ed7f269a2 Loic Pallardy     2019-01-10  142  						   st_rproc_mem_release,
63a1074795248e Rob Herring (Arm  2025-11-24  143) 						   "%.*s",
63a1074795248e Rob Herring (Arm  2025-11-24  144) 						   strchrnul(res.name, '@') - res.name,
63a1074795248e Rob Herring (Arm  2025-11-24  145) 						   res.name);
3df52ed7f269a2 Loic Pallardy     2019-01-10  146  		} else {
3df52ed7f269a2 Loic Pallardy     2019-01-10  147  			/* Register reserved memory for vdev buffer allocation */
3df52ed7f269a2 Loic Pallardy     2019-01-10  148  			mem = rproc_of_resm_mem_entry_init(dev, index,
63a1074795248e Rob Herring (Arm  2025-11-24  149) 							   resource_size(&res),
63a1074795248e Rob Herring (Arm  2025-11-24  150) 							   res.start,
63a1074795248e Rob Herring (Arm  2025-11-24  151) 							   "vdev0buffer");
3df52ed7f269a2 Loic Pallardy     2019-01-10  152  		}
3df52ed7f269a2 Loic Pallardy     2019-01-10  153  
63a1074795248e Rob Herring (Arm  2025-11-24  154) 		if (!mem)
3df52ed7f269a2 Loic Pallardy     2019-01-10  155  			return -ENOMEM;
3df52ed7f269a2 Loic Pallardy     2019-01-10  156  
3df52ed7f269a2 Loic Pallardy     2019-01-10  157  		rproc_add_carveout(rproc, mem);
3df52ed7f269a2 Loic Pallardy     2019-01-10 @158  		index++;
3df52ed7f269a2 Loic Pallardy     2019-01-10  159  	}
3df52ed7f269a2 Loic Pallardy     2019-01-10  160  
3df52ed7f269a2 Loic Pallardy     2019-01-10  161  	return rproc_elf_load_rsc_table(rproc, fw);
3df52ed7f269a2 Loic Pallardy     2019-01-10  162  }
3df52ed7f269a2 Loic Pallardy     2019-01-10  163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
