Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B621AC428;
	Wed, 31 Jul 2024 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428439; cv=none; b=DFwttcqVSZ49QSzJ3ZqZLmPjuVXkirunaGuEQKvxNjf6mWyj0tIFRbWTPDL6YsgoKmmvyyF0xIvdvmTdwrgdNyEOKaBjWTuDR8T/XuewkGq2Y2MQtgZ/Q6EpaESEvl72s+syIExe4DNGgtRsLd+exX/1ceEOJAarUA6yZpP4jOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428439; c=relaxed/simple;
	bh=jfi6oxxWV4P2oDR2PSf947fArK/IKm2iyG4k4ApKfZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNLj8hQOgXDVP4QOxtHuYYD2CmGePkRxe50LzCAr3SyqgASHj/6uJt3AjwBFto5V3KLqUrdOA8ozcLjnCFapbQyhJ+LlMrW3UReGTKPFafFBrtlQZEPnaG8YuKGwobiuZnReN44BaKzkYVz7bjEC8kpWh9y10OEs5vuaLmS/Oco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zt4PKhZ9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zt4PKhZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722428437; x=1753964437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfi6oxxWV4P2oDR2PSf947fArK/IKm2iyG4k4ApKfZQ=;
  b=Zt4PKhZ9wXyos+k5u8TeexMEKGpATUWf3bQV7zAzzFby4mB1Dgs7/Rpz
   GtQrQjpQs8Wn5kaGY+EO3DvZihJX3bQ/LLemppjy3SvL4o57qDRI8ygFm
   7QJCU6Z6oInxHPpdsX3bNV2cvYMQucLc3eWxmtWRXxcnAI93zaaxutHVC
   nOFev1EPKPtoji6VRLTF/Am1g+AKU1Rol+4uEDpLRZE4JuxM7JnwRiXNZ
   J4VsBdLzDyHlm15rFZoKmPcvrHVCFoxJDfX3AcOukyTiif7yxlZ3yYR/7
   YttKpZqWeLO516sCF/EDOFn0CiFMRPy2Urg/bCDw090cgQLbjv1HBWNkv
   Q==;
X-CSE-ConnectionGUID: tUFPF/fYRlKfB6MYz3cJ5w==
X-CSE-MsgGUID: sE4X/Zi0S2OM1XwnWCOFKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19994879"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="19994879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 05:20:37 -0700
X-CSE-ConnectionGUID: cIf3o1quR/6bLziqFIqAyQ==
X-CSE-MsgGUID: k5z0mCxESrmEZ8pgwVYTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54725854"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 05:20:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ8Jm-000uFE-0U;
	Wed, 31 Jul 2024 12:20:34 +0000
Date: Wed, 31 Jul 2024 20:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 3/36] drivers/cpufreq/spear-cpufreq.c:188:8:
 error: implicit declaration of function 'of_property_count_32_elems' is
 invalid in C99
Message-ID: <202407312012.9wRDqMMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   55dff5ffdb04a96e8f78fc4708ffa4701b509a0c
commit: 8b264e285050068c79e499ea56f57805166fd5b1 [3/36] cpufreq: spear: Use property API
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240731/202407312012.9wRDqMMM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312012.9wRDqMMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312012.9wRDqMMM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/spear-cpufreq.c:188:8: error: implicit declaration of function 'of_property_count_32_elems' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           cnt = of_property_count_32_elems(np, "cpufreq_tbl");
                 ^
   drivers/cpufreq/spear-cpufreq.c:188:8: note: did you mean 'of_property_count_u32_elems'?
   include/linux/of.h:1151:19: note: 'of_property_count_u32_elems' declared here
   static inline int of_property_count_u32_elems(const struct device_node *np,
                     ^
>> drivers/cpufreq/spear-cpufreq.c:201:2: error: cannot take the address of an rvalue of type 'u32 *' (aka 'unsigned int *')
           of_property_for_each_u32(np, "cpufreq_tbl", &val)
           ^                                           ~~~~
   include/linux/of.h:1435:37: note: expanded from macro 'of_property_for_each_u32'
                    of_prop_next_u32(_it.prop, NULL, &u)};                 \
                                                     ^~
>> drivers/cpufreq/spear-cpufreq.c:201:2: error: cannot take the address of an rvalue of type 'u32 *' (aka 'unsigned int *')
           of_property_for_each_u32(np, "cpufreq_tbl", &val)
           ^                                           ~~~~
   include/linux/of.h:1437:55: note: expanded from macro 'of_property_for_each_u32'
                _it.item = of_prop_next_u32(_it.prop, _it.item, &u))
                                                                ^~
   3 errors generated.


vim +/of_property_count_32_elems +188 drivers/cpufreq/spear-cpufreq.c

   170	
   171	static int spear_cpufreq_probe(struct platform_device *pdev)
   172	{
   173		struct device_node *np;
   174		struct cpufreq_frequency_table *freq_tbl;
   175		u32 val;
   176		int cnt, i, ret;
   177	
   178		np = of_cpu_device_node_get(0);
   179		if (!np) {
   180			pr_err("No cpu node found\n");
   181			return -ENODEV;
   182		}
   183	
   184		if (of_property_read_u32(np, "clock-latency",
   185					&spear_cpufreq.transition_latency))
   186			spear_cpufreq.transition_latency = CPUFREQ_ETERNAL;
   187	
 > 188		cnt = of_property_count_32_elems(np, "cpufreq_tbl");
   189		if (cnt <= 0) {
   190			pr_err("Invalid cpufreq_tbl\n");
   191			ret = -ENODEV;
   192			goto out_put_node;
   193		}
   194	
   195		freq_tbl = kcalloc(cnt + 1, sizeof(*freq_tbl), GFP_KERNEL);
   196		if (!freq_tbl) {
   197			ret = -ENOMEM;
   198			goto out_put_node;
   199		}
   200	
 > 201		of_property_for_each_u32(np, "cpufreq_tbl", &val)
   202			freq_tbl[i].frequency = val;
   203	
   204		freq_tbl[cnt].frequency = CPUFREQ_TABLE_END;
   205	
   206		spear_cpufreq.freq_tbl = freq_tbl;
   207	
   208		of_node_put(np);
   209	
   210		spear_cpufreq.clk = clk_get(NULL, "cpu_clk");
   211		if (IS_ERR(spear_cpufreq.clk)) {
   212			pr_err("Unable to get CPU clock\n");
   213			ret = PTR_ERR(spear_cpufreq.clk);
   214			goto out_put_mem;
   215		}
   216	
   217		ret = cpufreq_register_driver(&spear_cpufreq_driver);
   218		if (!ret)
   219			return 0;
   220	
   221		pr_err("failed register driver: %d\n", ret);
   222		clk_put(spear_cpufreq.clk);
   223	
   224	out_put_mem:
   225		kfree(freq_tbl);
   226		return ret;
   227	
   228	out_put_node:
   229		of_node_put(np);
   230		return ret;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
