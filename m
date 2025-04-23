Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A24A281365;
	Wed, 23 Apr 2025 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426611; cv=none; b=MGcAIy+Itz5oOpiqvJYTxXyaYQ+eHwaEWRuMQJVdNwmuhqz/shmBAvGFD3JEog6WJk3ieZlY//0WZwn6LmfjSWWk4C6FYEJCaAT3S5BXjtsFCK0i2H0KYBCPWOrPHDJftpGh/hhLNrrBdPFAHVKqgiT4zzcYNfzs5kM58NiNV60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426611; c=relaxed/simple;
	bh=CtjI7Yy/ZC+A4HIGtbsqdPQ9cZCHp/HLEyna3GdrrX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KH1DvhTgoRze0EYijm2/JDPQCJkyzVUsICQh+g36q+WIzDRi6ggJ1JsFC5Gpbr0IJx3TjU6SnblNtLA2llQPz79a3d/a+FQblgb8GGt876LH36vif78DBce+iS1dF1/ECaupYhdODeBcPF5Ub1galvjub9IyJt8hqLk1q9CphL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0DVbuMC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0DVbuMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745426609; x=1776962609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CtjI7Yy/ZC+A4HIGtbsqdPQ9cZCHp/HLEyna3GdrrX4=;
  b=Q0DVbuMC6JBW9kbdU9G+pwHLgLFkrYSZuoS30kDq+vYgK9fSze3GfRyi
   KJC9FDFZRb5iQ2+aSlzMjJgPRW1ffXTFOtYXiH9ShBt657pA7eWiLamMe
   8ceovW0Obzjqmlp3mDT3VtbBelwgmJjPRhEsJCQsb3dKJ2FL+neViMUax
   7MhmeHBVRdU5G5rNmNe9f9RhRs9klZSLL+z5w7FTnUOsEmH+rcR24h2NH
   i7hgchOxnJFRCc2noDdkOoDnF3MvlSO4fx/icRzpRhhm0ISiiTEogzxYj
   5cJyAf06fU8yDf6niFSJUoynjuXciLwmWjAAz9NbZ5XWIoGLaWk/XCEsO
   Q==;
X-CSE-ConnectionGUID: 1FyPE68SRZOtd0RHOx9gkw==
X-CSE-MsgGUID: Yr1RFVfHQg2TiEwr7XWKyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47160693"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47160693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:43:28 -0700
X-CSE-ConnectionGUID: 8KtdgQPhQeOoi2GRFXEbQQ==
X-CSE-MsgGUID: oGwgHLJYQZyEqd7oKlj1qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132256337"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2025 09:43:27 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dC0-0003TH-2r;
	Wed, 23 Apr 2025 16:43:24 +0000
Date: Thu, 24 Apr 2025 00:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Message-ID: <202504240005.n3Qql6rF-lkp@intel.com>
References: <20250422113156.575971-3-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-3-eugen.hristev@linaro.org>

Hi Eugen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on tip/sched/core lwn/docs-next linus/master v6.15-rc3 next-20250423]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/Documentation-add-kmemdump/20250422-193638
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250422113156.575971-3-eugen.hristev%40linaro.org
patch subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250424/202504240005.n3Qql6rF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240005.n3Qql6rF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240005.n3Qql6rF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/debug/kmemdump.c:28:28: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      28 |         struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
         |                                   ^
>> drivers/debug/kmemdump.c:28:24: error: incompatible integer to pointer conversion initializing 'struct kmemdump_zone *' with an expression of type 'int' [-Wint-conversion]
      28 |         struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
         |                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/debug/kmemdump.c:88:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         kfree(z);
         |         ^
   3 errors generated.


vim +/kzalloc +28 drivers/debug/kmemdump.c

    15	
    16	/**
    17	 * kmemdump_register() - Register region into kmemdump.
    18	 * @handle: string of maximum 8 chars that identifies this region
    19	 * @zone: pointer to the zone of memory
    20	 * @size: region size
    21	 *
    22	 * Return: On success, it returns an allocated unique id that can be used
    23	 *	at a later point to identify the region. On failure, it returns
    24	 *	negative error value.
    25	 */
    26	int kmemdump_register(char *handle, void *zone, size_t size)
    27	{
  > 28		struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
    29		int id;
    30	
    31		if (!z)
    32			return -ENOMEM;
    33	
    34		mutex_lock(&kmemdump_lock);
    35	
    36		id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
    37		if (id < 0) {
    38			mutex_unlock(&kmemdump_lock);
    39			return id;
    40		}
    41	
    42		if (!backend)
    43			pr_debug("kmemdump backend not available yet, waiting...\n");
    44	
    45		z->zone = zone;
    46		z->size = size;
    47		z->id = id;
    48	
    49		if (handle)
    50			strscpy(z->handle, handle, 8);
    51	
    52		if (backend) {
    53			int ret;
    54	
    55			ret = backend->register_region(id, handle, zone, size);
    56			if (ret) {
    57				mutex_unlock(&kmemdump_lock);
    58				return ret;
    59			}
    60			z->registered = true;
    61		}
    62	
    63		mutex_unlock(&kmemdump_lock);
    64		return id;
    65	}
    66	EXPORT_SYMBOL_GPL(kmemdump_register);
    67	
    68	/**
    69	 * kmemdump_unregister() - Unregister region from kmemdump.
    70	 * @id: unique id that was returned when this region was successfully
    71	 *	registered initially.
    72	 *
    73	 * Return: None
    74	 */
    75	void kmemdump_unregister(int id)
    76	{
    77		struct kmemdump_zone *z;
    78	
    79		mutex_lock(&kmemdump_lock);
    80	
    81		z = idr_find(&kmemdump_idr, id);
    82		if (!z)
    83			return;
    84		if (z->registered && backend)
    85			backend->unregister_region(z->id);
    86	
    87		idr_remove(&kmemdump_idr, id);
  > 88		kfree(z);
    89	
    90		mutex_unlock(&kmemdump_lock);
    91	}
    92	EXPORT_SYMBOL_GPL(kmemdump_unregister);
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
