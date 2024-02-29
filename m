Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018D7D3FC;
	Thu, 29 Feb 2024 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209839; cv=none; b=Jmq7lzzcus5JQSthGBVoMUXwq4OI0AQeXhrhssfBUSJpwqtFj1fC87GK79DbK4Am/52rIu7rnRCpO40yCeGf55sHqryvhMQt+9GR3TKxVS7p3APlklokVL00GVgq4qb4A96z4s2hRfpTIG1yrpj0xb7t3TyvqYWv5389FV4WA5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209839; c=relaxed/simple;
	bh=AQfUKgl3r5f1Z6qgEZHGOxgxEjdFUiCldurNSlZlskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erL0lEynI1V73dXO1uXBncYbPCKlmgAD9b9iCQ7qtjrR++taRcH0E2jrbWQJru+Jitlvxqo0DIXGcp1rOtrlLOPjwcAPPJAtPLMWAPNTfygrR5mliaB+PdsiK+N83YOEUaRixlduoy3XS46zuKHxsgM3nX1/qVvYcm8O0pXgpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGjQE2QQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGjQE2QQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709209837; x=1740745837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQfUKgl3r5f1Z6qgEZHGOxgxEjdFUiCldurNSlZlskQ=;
  b=TGjQE2QQPfYd9m+h4mY8+YH53cfdkiqcO35xs+ytElgU4AT852OCdc49
   GQQzvVAw6LpjQUS4Muv9RAKRNz3qfydkcKNHqVFitm5F/hrhBzOyL3sS8
   CNi8XvZBHe+d/d9TJxc8KKZgSUMzIPsiXKYuDSqxRMELbYUUlw4zdNJMw
   w2diLPPswd9lHYx+ap1C08NwgBtFnGMmc/Ewo9pVlDT9tXyC0EPyUj2Fw
   AF/mgbZIbllQh1umm/sssPT4inBsV2KysDt4beeM1SjYjv8gUloxCAt7f
   BTg8cu6mNg7XcXdo6xMbB4pvXdYLYxE/3z8U0NLZyBSLDn6HOaLToIXM+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3521545"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3521545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12375379"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Feb 2024 04:30:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rffYA-000CwB-2p;
	Thu, 29 Feb 2024 12:30:28 +0000
Date: Thu, 29 Feb 2024 20:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 6/6] drivers/acpi/apei/ghes-dbg.c:47:10:
 warning: result of comparison of constant 18446744073709551615 with
 expression of type 'u8' (aka 'unsigned char') is always false
Message-ID: <202402292010.n19SpyCZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   6c540a23cb1194d67a9dcfefb702774a99afc3b1
commit: 6c540a23cb1194d67a9dcfefb702774a99afc3b1 [6/6] acpi/ghes: Add CXL CPER injection debugfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240229/202402292010.n19SpyCZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292010.n19SpyCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292010.n19SpyCZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes-dbg.c:9:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/apei/ghes-dbg.c:47:10: warning: result of comparison of constant 18446744073709551615 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
      47 |         if (bus == ULONG_MAX)
         |             ~~~ ^  ~~~~~~~~~
   6 warnings generated.


vim +47 drivers/acpi/apei/ghes-dbg.c

    27	
    28	static void ghes_cper_inject(char *bdfstr)
    29	{
    30		struct cxl_cper_event_rec rec;
    31		char *segstr, *busstr, *devstr;
    32		u8 seg, bus, dev, func;
    33	
    34		segstr = strsep(&bdfstr, ":");
    35		if (!segstr || !bdfstr)
    36			return;
    37		seg = strtoul(segstr, NULL, 16);
    38		busstr = strsep(&bdfstr, ":");
    39		if (!busstr || !bdfstr)
    40			return;
    41		bus = strtoul(busstr, NULL, 16);
    42		devstr = strsep(&bdfstr, ".");
    43		if (!devstr || !bdfstr)
    44			return;
    45		dev = strtoul(devstr, NULL, 16);
    46		func = strtoul(bdfstr, NULL, 16);
  > 47		if (bus == ULONG_MAX)
    48			return;
    49	
    50		pr_debug("Record %u:%u:%u.%u\n", seg, bus, dev, func);
    51	
    52		rec = (struct cxl_cper_event_rec) {
    53			.hdr = {
    54				.device_id = {
    55					.func_num = func,
    56					.device_num = dev,
    57					.bus_num = bus,
    58					.segment_num = seg,
    59				},
    60				.dev_serial_num = {
    61					.lower_dw = 0xBEEF,
    62					.upper_dw = 0xDEAD,
    63				},
    64			},
    65		};
    66	
    67		/* Fail; invalid record length (0) */
    68		mock_ghes_poll(CXL_CPER_EVENT_GEN_MEDIA, &rec);
    69	
    70		rec.hdr.length = sizeof(rec);
    71		/* Fail; log valid bit not set */
    72		mock_ghes_poll(CXL_CPER_EVENT_GEN_MEDIA, &rec);
    73	
    74		rec.hdr.validation_bits |= CPER_CXL_COMP_EVENT_LOG_VALID;
    75		mock_ghes_poll(CXL_CPER_EVENT_GEN_MEDIA, &rec);
    76		mock_ghes_poll(CXL_CPER_EVENT_DRAM, &rec);
    77		mock_ghes_poll(CXL_CPER_EVENT_MEM_MODULE, &rec);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
