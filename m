Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B271E7653;
	Tue,  3 Dec 2024 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229591; cv=none; b=G9NkYrMSXjtT5G/PBw/ns8o7J1yZK8bOKbaBc4n1fWy0JLe0xz/y0dDSkLHctsiWuN8LEvrIXlXOQnzgsdRMdgEhaO/tELThz9lgrmcMh5IOqMngZuIViQKzlbM/QtlSn8jeZnMNtpXD5fXMoNhCIEAagylYrKMKtsYmYNyta2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229591; c=relaxed/simple;
	bh=yK8MfbUzSpP3v47cypxNeS5fJXi2PLCFEaTuSSvDFeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+6IY/3XlEyUJt4Yfqh6cpftaWQ2FccLA0BhYDXr+oFta+ryKpxefzpxS/ZStceyYHfHs3jjUffQTLigLBBoG6uorC13LPy2WsKvcO96iWqQPq11Wq6RpJxIS4om1Sev6FLF9Oc0Z6eBQaswEhplkLMizvaHYJge1kd2+vJQmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdyuNfGf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdyuNfGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733229589; x=1764765589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yK8MfbUzSpP3v47cypxNeS5fJXi2PLCFEaTuSSvDFeg=;
  b=cdyuNfGfijH5dldMX9CLOW6/LsiJLU1vkQEImhB1CTLWy5vVAi1p8fTm
   n7qbnaLZzOlhgZM0CmFbaCJ9IqceSmvqK4sKDOFOmdHHf1iAd7CIru5dS
   Oob/G298mqQGBXsxFH0n2SwbCo2ht1IdWgQs7GOrmpH8ISMskCF0Ryd7Q
   /wExsQjOs8M9hiVMKZJSiV3e7WQR6lANlqXEJmTRsyJgSOF0SB0IH/1SL
   qdk0Z6tQCGG3L2NmDNcBRMSAL3PDhjocr7N/B78kzDrePmkxKdk2sOAwI
   XmqWisPUMe0vlkwyx6kXsv4VAPL46lBYUqai6eurAwYD5iBjP/4fUtqRz
   A==;
X-CSE-ConnectionGUID: L6JiuwEkSyGbfuJCl2FyKw==
X-CSE-MsgGUID: 7fgE1AeeSZ61BulWH4ZysQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="55925058"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="55925058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:39:49 -0800
X-CSE-ConnectionGUID: WnfIYfgnQga6CcI2c11DAQ==
X-CSE-MsgGUID: VnC7xwE8RvCbtXgrxKMWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="97497549"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2024 04:39:47 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tISBt-0000f1-0x;
	Tue, 03 Dec 2024 12:39:45 +0000
Date: Tue, 3 Dec 2024 20:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v1 8/37] drivers/clk/clk-rpmi.c:572:2: error:
 expected ';' after top level declarator
Message-ID: <202412032011.FVOM3TL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v1
head:   bf7506e7bec204376453e68c7d7c3ab7ff37dcaf
commit: 10dfaa174d4f0b1eb57d9b078d7fddb759bf48d3 [8/37] clk: Add clock driver for the RISC-V RPMI clock service group
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241203/202412032011.FVOM3TL6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032011.FVOM3TL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032011.FVOM3TL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clk-rpmi.c:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-rpmi.c:572:2: error: expected ';' after top level declarator
     572 | }
         |  ^
         |  ;
   4 warnings and 1 error generated.


vim +572 drivers/clk/clk-rpmi.c

   568	
   569	static const struct of_device_id rpmi_clk_of_match[] = {
   570		{ .compatible = "riscv,rpmi-clock" },
   571		{ },
 > 572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
