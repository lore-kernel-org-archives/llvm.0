Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7DDF6B;
	Sun, 19 May 2024 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716113174; cv=none; b=noIyfx174ebBCbQn7S7jMksify8A53j0P2Ewlgc8RU+cgg+o7tLXus94CQeCHfdMhWQ+o70U8rShEwYChAHgdK+VrEuIR+GR422x6/HMDWL4yxULCIZuRhg2klDGPjvTZ/UclP6kdkT48+ykQ43+jopNTYF0RWFq/GpBc47vE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716113174; c=relaxed/simple;
	bh=6kl+gvTHef1UfDl4iYcBh+EfxBOTQAEMdeNDmnetVkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzstG9+l4+c5vgNF/7B5hekNqSImjXLT+tvCQSfLkUH25AW9pHKUDK5Fpj2XSCNTobXMfzWjWE8bqeaNHxhAsaQd/9y156ItV44MJOCgabewNOViWidNCaxp88pI7I+mNY/RIl9ebzWJfWzurkrMGhroyQIzlUE3pSWsaz11de0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiArLoZ2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiArLoZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716113172; x=1747649172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6kl+gvTHef1UfDl4iYcBh+EfxBOTQAEMdeNDmnetVkY=;
  b=kiArLoZ2H8mb0VKQ66tfYW4OgSVvZVa2Llv2bz/zgUB2E/2YQdXALqnm
   Tb6RFlbcCRUGSAW29K1pMeXqTJPHxBlbj86M0QSMqXUYacmm1Re9IpwIV
   d7GtAmGFtPzB54MhjfbI67kLkclWj92NfenvcPTwE8UN7ArRlbC+tmhe1
   sjLRAlNSbUn+2S8axgnIj7HhLxj4FubisLDoZf2VvNUlfOGYeCtvhZHKl
   fPrEKWKUYP/uWLGNaaO5Y6WN5uoiDPbvYrohTtWvq4nf0idMoDSRxYq8p
   Swxe0o9ldzIV5i/KTfL5eWrvbWIl2aOI/eZ94DnWC0Z+rPpDihIGodKHc
   A==;
X-CSE-ConnectionGUID: 31+JYfSeR+mfUjDOR11zGA==
X-CSE-MsgGUID: iNNF40yWRNeoMC2hzyhsCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="34761914"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="34761914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 03:06:12 -0700
X-CSE-ConnectionGUID: ovEogxceT++ZCVpYp/i7pQ==
X-CSE-MsgGUID: lg1m6lzHTw2xf+2pTbWzXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32085237"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2024 03:06:11 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8dQd-0003Md-2o;
	Sun, 19 May 2024 10:06:07 +0000
Date: Sun, 19 May 2024 18:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 09/28] net: ethernet: ti: cpsw-proxy-client:
 add helper to init TX DMA Channels
Message-ID: <202405191750.xaJqZFSN-lkp@intel.com>
References: <20240518124234.2671651-10-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518124234.2671651-10-s-vadapalli@ti.com>

Hi Siddharth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/docs-networking-ti-add-driver-doc-for-CPSW-Proxy-Client/20240518-205357
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240518124234.2671651-10-s-vadapalli%40ti.com
patch subject: [RFC PATCH net-next 09/28] net: ethernet: ti: cpsw-proxy-client: add helper to init TX DMA Channels
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191750.xaJqZFSN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191750.xaJqZFSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191750.xaJqZFSN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/cpsw-proxy-client.c:8:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2210:
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
   In file included from drivers/net/ethernet/ti/cpsw-proxy-client.c:12:
   In file included from include/linux/dma/k3-udma-glue.h:10:
>> include/linux/soc/ti/k3-ringacc.h:267:52: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
     267 | struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
         |                                                    ^
   drivers/net/ethernet/ti/cpsw-proxy-client.c:337:12: warning: unused function 'get_virtual_port_info' [-Wunused-function]
     337 | static int get_virtual_port_info(struct cpsw_proxy_priv *proxy_priv)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:394:12: warning: unused function 'attach_virtual_ports' [-Wunused-function]
     394 | static int attach_virtual_ports(struct cpsw_proxy_priv *proxy_priv)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:542:12: warning: unused function 'allocate_port_resources' [-Wunused-function]
     542 | static int allocate_port_resources(struct cpsw_proxy_priv *proxy_priv)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:648:12: warning: unused function 'init_tx_chans' [-Wunused-function]
     648 | static int init_tx_chans(struct cpsw_proxy_priv *proxy_priv)
         |            ^~~~~~~~~~~~~
   10 warnings generated.


vim +267 include/linux/soc/ti/k3-ringacc.h

d782298c6f6b85 Grygorii Strashko 2020-12-08  266  
d782298c6f6b85 Grygorii Strashko 2020-12-08 @267  struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
d782298c6f6b85 Grygorii Strashko 2020-12-08  268  					    struct k3_ringacc_init_data *data);
d782298c6f6b85 Grygorii Strashko 2020-12-08  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
