Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7118C346;
	Wed, 13 Nov 2024 23:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731540177; cv=none; b=VhLHpIJDtdG/yhJbJHeqOM4ciJuIad49WEjRSVDJl+HP4j8BSEHf+JjIwFoqieiFU01TXj8Ei1I6dbef+1gGQ1smbmzj110a8xSrG7KbJJJdtj/9YP5e9TaridGvM5nLtg1TYkdG8dYiIM2cBsT+s3DRgRKQe0KojY3S6RiDb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731540177; c=relaxed/simple;
	bh=gGEsecAmz54n91Vy/vNGu0ho97CKNc5Z2+CrQ6eEPpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYR06BkpHT3m4QzaH7SHCvjHaYHSB60Rem/xc0xNRRyWSlsx4uqmXTqj9F3+tdKVDA4I4IHEMTlwqfU5WQZ0ubfljXTJp6ZK9Is/mG5upjB4ZFuSF+9HreTqd1PmhMcBrn3OwEprPGkoQO/r6AyfzhAoZzaNEgOumiBIW9Q1yhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcFl398m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcFl398m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731540175; x=1763076175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gGEsecAmz54n91Vy/vNGu0ho97CKNc5Z2+CrQ6eEPpg=;
  b=dcFl398mkdCJ/41ha8wc/e/7l60Tq47BMvbyTEtuG6Bf5Axx3ENamlvW
   jNKv4yAVWLAhWcALyI65t+3SHLZCzm8QVphdFu7dvZ1zeSyaMmDbKoapJ
   7HS+Ab2X/pWqQQK0tIk49YPBgdkYOSwhKc+88KP0JBwfeEQHRieS+BN7G
   HkAFFzAdiS8Qs+nEXMqeDMYGbH/wEHfxHmIjLiwIaMvarFl3hqSMN5Gl8
   F4bPklLyJZxsSoV6mt6DfwWdxrTwnCidRADMUOaMYWJN4njVoDsKTXWlo
   ri4SI+hlkBYCnk1Q+jhtzGxVFTzWBW8ffpAsUpIL4ikjeKse2nzBDLt0C
   Q==;
X-CSE-ConnectionGUID: Nu2TGyjlR2KyND1aFp3obg==
X-CSE-MsgGUID: R/+/OkGpRt24kOlsi4in6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31614527"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31614527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:22:52 -0800
X-CSE-ConnectionGUID: whvV2z+fSmOFPR3C59GobA==
X-CSE-MsgGUID: C5a8VtGESqGjdFHHpFZOfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="118955821"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2024 15:22:48 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMhC-0000qT-0X;
	Wed, 13 Nov 2024 23:22:46 +0000
Date: Thu, 14 Nov 2024 07:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Gal Pressman <gal@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next 3/8] devlink: Extend devlink rate API with
 traffic classes bandwidth management
Message-ID: <202411140730.KCvy3X1m-lkp@intel.com>
References: <20241113180034.714102-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113180034.714102-4-tariqt@nvidia.com>

Hi Tariq,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/net-mlx5-DR-expand-SWS-STE-callbacks-and-consolidate-common-structs/20241114-022031
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241113180034.714102-4-tariqt%40nvidia.com
patch subject: [PATCH net-next 3/8] devlink: Extend devlink rate API with traffic classes bandwidth management
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241114/202411140730.KCvy3X1m-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140730.KCvy3X1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140730.KCvy3X1m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/devlink/core.c:7:
   In file included from include/net/genetlink.h:5:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2213:
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
   In file included from net/devlink/core.c:9:
   In file included from include/trace/events/devlink.h:11:
>> include/net/devlink.h:121:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     121 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   In file included from net/devlink/core.c:11:
   net/devlink/devl_internal.h:29:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:30:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      30 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.
--
   In file included from net/devlink/dev.c:8:
   In file included from include/net/genetlink.h:5:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2213:
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
   In file included from net/devlink/dev.c:10:
   In file included from net/devlink/devl_internal.h:14:
>> include/net/devlink.h:121:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     121 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   In file included from net/devlink/dev.c:10:
   net/devlink/devl_internal.h:29:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:30:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      30 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/dev.c:335:20: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
     335 |                 stat_idx = limit * __DEVLINK_RELOAD_ACTION_MAX + action;
         |                            ~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/dev.c:447:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
     447 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings and 1 error generated.
--
   In file included from net/devlink/rate.c:7:
   In file included from net/devlink/devl_internal.h:7:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
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
   In file included from net/devlink/rate.c:7:
   In file included from net/devlink/devl_internal.h:14:
>> include/net/devlink.h:121:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     121 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   In file included from net/devlink/rate.c:7:
   net/devlink/devl_internal.h:29:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:30:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      30 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:26:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      26 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/devlink/rate.c:133:18: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     133 |         for (i = 0; i < IEEE_8021QAZ_MAX_TCS; i++) {
         |                         ^
   net/devlink/rate.c:335:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     335 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   net/devlink/rate.c:405:19: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     405 |                 for (i = 0; i < IEEE_8021QAZ_MAX_TCS; i++) {
         |                                 ^
   6 warnings and 4 errors generated.
--
   In file included from drivers/net/ethernet/intel/i40e/i40e_main.c:5:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
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
   In file included from drivers/net/ethernet/intel/i40e/i40e_main.c:13:
   In file included from drivers/net/ethernet/intel/i40e/i40e.h:13:
>> include/net/devlink.h:121:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     121 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:15639:46: warning: shift count >= width of type [-Wshift-count-overflow]
    15639 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
          |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   5 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/intel/i40e/i40e_ethtool.c:8:
   In file included from drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:7:
   In file included from drivers/net/ethernet/intel/i40e/i40e.h:7:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
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
   In file included from drivers/net/ethernet/intel/i40e/i40e_ethtool.c:8:
   In file included from drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:7:
   In file included from drivers/net/ethernet/intel/i40e/i40e.h:13:
>> include/net/devlink.h:121:12: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     121 |         u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
         |                   ^
   4 warnings and 1 error generated.


vim +/IEEE_8021QAZ_MAX_TCS +121 include/net/devlink.h

   100	
   101	struct devlink_rate {
   102		struct list_head list;
   103		enum devlink_rate_type type;
   104		struct devlink *devlink;
   105		void *priv;
   106		u64 tx_share;
   107		u64 tx_max;
   108	
   109		struct devlink_rate *parent;
   110		union {
   111			struct devlink_port *devlink_port;
   112			struct {
   113				char *name;
   114				refcount_t refcnt;
   115			};
   116		};
   117	
   118		u32 tx_priority;
   119		u32 tx_weight;
   120	
 > 121		u32 tc_bw[IEEE_8021QAZ_MAX_TCS];
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
