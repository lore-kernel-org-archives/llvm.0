Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6B2A1BF;
	Sun, 27 Sep 2026 06:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790489848; cv=none; b=ObUMLIqW64X6cju3NnPUdQAsJBpoFLKuXKPWFfaaCGUOLvkGpv3IsmQ18TxeUN0bZZTDWky4VbKcWIFhNrqHH89O+bltVGAqF4qJ9Od/3DEV7r/3RY6z3MnAsplUtZP2fpVzZxM6BanIE9xX1NtFfE6tllA+AZbBTmKaMBq8Z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790489848; c=relaxed/simple;
	bh=3GnjD2ieH28okNftnapPNQ+63F4x/RrNJLimrDQU2OY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WvTKU6emYa5UGIGujz30+yQ4d+FyLv3IxFCKLtIL5tim4ErBiSU3QokN0dx33acKcoewlVS8ClPOMzLou4mHWMqF9mAj2K9zQcyR18HTvLYc7a9IPtfue96wcJohjYS48IGhb6hGCye74cxYehs6sk291rw1qdCKptcgMesC5/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gL6178Yg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gL6178Yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790489846; x=1822025846;
  h=date:from:to:cc:subject:message-id;
  bh=3GnjD2ieH28okNftnapPNQ+63F4x/RrNJLimrDQU2OY=;
  b=gL6178Ygqfdf45t82eeGGmcOfnu/KKU/OvSEObolDWEFp4Xcakr/UmQ6
   pHbe3QRhTPJ8zkIGHLHOaoAvsw9dgbsQiIZnpeRl1qQmg3hEubnlZIiyg
   1Nrd5eyRLD/WBWJDcnsULRrBVm8WzEz5RxMyWJ5+DN7cS7YIxRrZBO1NN
   TwEv3sUYe9ES70sRxx93MZ5/BFdOBBPgN5+hwTcYIb9AP/wTT3nNZrxuP
   XildH0Eji8ZYp3cj/u237RvHjT9S1K8sZQIHiMFCQPkst6ze3abyhssYJ
   PfG8Wx3h+sSnGCj17OifP/ZISN3VHUjGnpzDca1nuAnGu4KCz9Mv2gNKO
   Q==;
X-CSE-ConnectionGUID: 8VsOtpz7Rk6r6f5RvQFyKQ==
X-CSE-MsgGUID: 6t4Upjy3Tra3n4/hdP0RhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100551718"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="100551718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 23:17:26 -0700
X-CSE-ConnectionGUID: i04RR+VkRZqkADkjW7FTtg==
X-CSE-MsgGUID: A7RoIRvWTGqHxId3nyjkqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="312655341"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2026 23:17:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAiCO-00000000MSN-3Tx5;
	Sun, 27 Sep 2026 06:17:20 +0000
Date: Sun, 27 Sep 2026 14:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [xilinx-xlnx:master 1071/1090]
 drivers/remoteproc/amd_mbv_bram_rproc.c:129:47: error: 'dev_dbg' is defined
 as a function-like macro; did you mean 'dev_dbg(...)'?
Message-ID: <202609271438.v7ChzuoE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: dfff428d04b81b2cfd96007517cf9c85a38f427f [1071/1090] remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260927/202609271438.v7ChzuoE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 78ff5215e53a117851dc6e81e793a106f1a79df8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271438.v7ChzuoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271438.v7ChzuoE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/amd_mbv_bram_rproc.c:73:8: error: use of undeclared identifier 'rproc_mem_entry_ioremap_wc'
      73 |                                    rproc_mem_entry_ioremap_wc,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/amd_mbv_bram_rproc.c:74:8: error: use of undeclared identifier 'rproc_mem_entry_iounmap'; did you mean 'rproc_mem_entry_init'?
      74 |                                    rproc_mem_entry_iounmap,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
         |                                    rproc_mem_entry_init
   include/linux/remoteproc.h:677:1: note: 'rproc_mem_entry_init' declared here
     677 | rproc_mem_entry_init(struct device *dev,
         | ^
   drivers/remoteproc/amd_mbv_bram_rproc.c:129:2: error: call to undeclared function 'rproc_elf_load_rsc_table_optional'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |         ^
   drivers/remoteproc/amd_mbv_bram_rproc.c:129:2: note: did you mean 'rproc_elf_load_rsc_table'?
   drivers/remoteproc/remoteproc_internal.h:117:5: note: 'rproc_elf_load_rsc_table' declared here
     117 | int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
         |     ^
>> drivers/remoteproc/amd_mbv_bram_rproc.c:129:47: error: 'dev_dbg' is defined as a function-like macro; did you mean 'dev_dbg(...)'?
     129 |         rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
         |                                                      ^
   include/linux/dev_printk.h:164:9: note: 'dev_dbg' defined here as a function-like macro
     164 | #define dev_dbg(dev, fmt, ...)                                          \
         |         ^
   4 errors generated.


vim +129 drivers/remoteproc/amd_mbv_bram_rproc.c

   125	
   126	static int amd_bram_rproc_parse_fw(struct rproc *rproc,
   127					   const struct firmware *fw)
   128	{
 > 129		rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
   130						  "no resource table found\n");
   131		return 0;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
