Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB94C8F;
	Sat,  4 May 2024 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714851530; cv=none; b=PvtuvKPA+uteNv5E+tgIIIqjmEt9w30PWisQR2eSeWW/mHlMbro4DKjoI1wU9PZvfp0jVETdY2ul4eepK/9cWy89te9lFGdXLYaV4dF1zOxLHCFJsOfnVCzfVh6lyG5okexJKq88T9WZnz2BI//gPZZXfFECulT1QnxLHjhGifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714851530; c=relaxed/simple;
	bh=v4KGjrTq20etWiwgMFKIHbSGzct9mSLXrVMZCWUwf4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSw5kTpvTz7djRwBeqbt737Uer7yCOPAiam9vMgXuU4bOTWcLZ+nTSMUwG4fk7azhDywZMtiqKxvd+8U1LL2DTZI5tfzcPdVp70Ni5B/1i9u5I25XO+KTn78Ui/omKTIywOvqpZ+vU/GpPCVzjt/KG67W6DjQfR+Z38BruzdxRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZ4zcLGk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZ4zcLGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714851529; x=1746387529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4KGjrTq20etWiwgMFKIHbSGzct9mSLXrVMZCWUwf4s=;
  b=lZ4zcLGka5TPell9wHPJITPEm1XOlazJr07i+tgt+ou8VCasxOqHc/5t
   Y5qaJPkgjH7qmtcA1l5eSPqsVtBpb5v/3rkKwDXCAHKD6/jq5lzzpzWRp
   BJyO/DlhMoPDx0QwX2OIBTT/chMElbdLmRkfc0R64NlY7t0ueWKgwMTvB
   /CEHb7ACsGvvIVxdS+LhzlgFF4OMiTL3RiU1D51BheZT5TLrvzbHrhzvr
   mAMPED9lZQDWK++9mIBU2IAmEj/6JtU+HOBRpu5I7SxMjHNq2oDQmH0mn
   ttDuWHPVyfDEXBJznUcdw/L/lfZCxZ0LZ7R3VdXUaVgM+WnYDlT/pdB97
   w==;
X-CSE-ConnectionGUID: BttIFvJGT3GSzXm53nKeLA==
X-CSE-MsgGUID: DW6Ipk1DT0SObvFuemI9oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14454665"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="14454665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 12:38:48 -0700
X-CSE-ConnectionGUID: EEuSBY4oQ2ynJ93LSQZFRA==
X-CSE-MsgGUID: OJFicr+KTLC3Ih7ZYa4LWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="65189681"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 May 2024 12:38:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3LDX-000D7L-2y;
	Sat, 04 May 2024 19:38:43 +0000
Date: Sun, 5 May 2024 03:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <sboyd@kernel.org>
Subject: [rmk:for-next 35/36] drivers/clk/clkdev.c:195:9: error: incompatible
 pointer types assigning to 'va_list *' (aka '__builtin_va_list *') from
 'struct __va_list_tag **'
Message-ID: <202405050318.OSjmXulC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   15b7967c1ef112c0f4179ed4e9a537e84388210b
commit: 5d998425e37b10e05393941e7a8fbefd3d1d4101 [35/36] clkdev: report over-sized strings when creating clkdev entries
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405050318.OSjmXulC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050318.OSjmXulC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050318.OSjmXulC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/clkdev.c:9:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
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
>> drivers/clk/clkdev.c:195:9: error: incompatible pointer types assigning to 'va_list *' (aka '__builtin_va_list *') from 'struct __va_list_tag **' [-Werror,-Wincompatible-pointer-types]
     195 |         fmt.va = &ap;
         |                ^ ~~~
   5 warnings and 1 error generated.


vim +195 drivers/clk/clkdev.c

   155	
   156	static struct clk_lookup * __ref
   157	vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
   158		va_list ap)
   159	{
   160		struct clk_lookup_alloc *cla;
   161		struct va_format fmt;
   162		const char *failure;
   163		size_t max_size;
   164		ssize_t res;
   165	
   166		cla = kzalloc(sizeof(*cla), GFP_KERNEL);
   167		if (!cla)
   168			return NULL;
   169	
   170		cla->cl.clk_hw = hw;
   171		if (con_id) {
   172			res = strscpy(cla->con_id, con_id, sizeof(cla->con_id));
   173			if (res < 0) {
   174				max_size = sizeof(cla->con_id);
   175				failure = "connection";
   176				goto fail;
   177			}
   178			cla->cl.con_id = cla->con_id;
   179		}
   180	
   181		if (dev_fmt) {
   182			res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
   183			if (res >= sizeof(cla->dev_id)) {
   184				max_size = sizeof(cla->dev_id);
   185				failure = "device";
   186				goto fail;
   187			}
   188			cla->cl.dev_id = cla->dev_id;
   189		}
   190	
   191		return &cla->cl;
   192	
   193	fail:
   194		fmt.fmt = dev_fmt;
 > 195		fmt.va = &ap;
   196		pr_err("%pV:%s: %s ID is greater than %zu\n",
   197		       &fmt, con_id, failure, max_size);
   198		kfree(cla);
   199		return NULL;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
