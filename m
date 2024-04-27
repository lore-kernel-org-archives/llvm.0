Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF520ED;
	Sat, 27 Apr 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714253637; cv=none; b=YVa/5puIahriusa26uKJvHUuYkfLYRxrRr2qKkMXHENwEjXjm6Bib0Csi8uAFHgGbp4P9sKgr4f/6G+AzARMKBEI1xvh9URc2nFKj41vjyOxh5wzrE7l795fAh97VDLf/GuRs+ZdjNLOVauZHNN4HPWg9nZtweHQ9kuelLdIyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714253637; c=relaxed/simple;
	bh=Cin+KIqBrlrPaesmzhPCgxfRH1xSValOgDPkoVG3A2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnws6GaT65gvVNOIhkNyVJCFDPTjWPruXLwKm96Ws2RPu1uEnyn71k/ndriSTZyGjxsXTGRd5m28cMm746kUJ8bX+G72kekX/Lu1AdYopqbla4W4vcEDNvkZ22kZUgcsLNy6EAt+5Zq7n5bInkfBB4Qpb9q9IFBtzbyp5HXVAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWBRTj5A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWBRTj5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714253635; x=1745789635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cin+KIqBrlrPaesmzhPCgxfRH1xSValOgDPkoVG3A2M=;
  b=YWBRTj5AZKWaitvNXmvKL2DmW1gxaaxEBbENQFVe0JynqNvk8gZRkD1x
   SXTQtDtDpFUpFHXkoAvbtN6nIrso3OUwXmzkXwEHoyje9jkye2F9EPq5p
   HfWky3bAyT7IYOOnB1H8IyEAIeXCo+OWvg3PrVIPDNWxPDb/xY/o0lbvy
   xXSP+Htm8fYerMxIECfoK0c/Kf6yroDp72rfdfdQxrTrpvPrcHFOU+GRN
   XlKsCd/3NnMSAY0jlETJFAQo25cgDF5yRkzkXWN4i7y6d4HhiNmpe+TOr
   xENqFRunTW/xeVSzrj9NE0/hRzTnzFsPuw5yAYPL0waxBOeAE9QOyl+23
   A==;
X-CSE-ConnectionGUID: IG6bjLWaQf+t+4EwKKvfng==
X-CSE-MsgGUID: 9MiC+WwaQn6r8KHR055EdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27415057"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="27415057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 14:33:54 -0700
X-CSE-ConnectionGUID: YqBKrODbR/uOwoWl8yMgrg==
X-CSE-MsgGUID: x+nlZ69OQDOnzyGWfGk+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30405123"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2024 14:33:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0pg6-0005WC-22;
	Sat, 27 Apr 2024 21:33:50 +0000
Date: Sun, 28 Apr 2024 05:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 14/14] net/sched/em_meta.c:593:27:
 error: no member named 'offset' in 'struct page_frag_cache'
Message-ID: <202404280540.Fy5xS8Td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: d4839424731dee0af1ba520ac3b177893e765399 [14/14] net: replace page_frag with page_frag_cache
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404280540.Fy5xS8Td-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280540.Fy5xS8Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280540.Fy5xS8Td-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sched/em_meta.c:64:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2208:
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
>> net/sched/em_meta.c:593:27: error: no member named 'offset' in 'struct page_frag_cache'
     593 |         dst->value = sk->sk_frag.offset;
         |                      ~~~~~~~~~~~ ^
   5 warnings and 1 error generated.


vim +593 net/sched/em_meta.c

4890062960cbc4 Thomas Graf    2005-06-08  584  
4890062960cbc4 Thomas Graf    2005-06-08  585  META_COLLECTOR(int_sk_sendmsg_off)
4890062960cbc4 Thomas Graf    2005-06-08  586  {
02a56c81cf33de Eric Dumazet   2015-11-08  587  	const struct sock *sk = skb_to_full_sk(skb);
02a56c81cf33de Eric Dumazet   2015-11-08  588  
02a56c81cf33de Eric Dumazet   2015-11-08  589  	if (!sk) {
4f8f61eb4341be Yang Yingliang 2013-12-11  590  		*err = -1;
4f8f61eb4341be Yang Yingliang 2013-12-11  591  		return;
4f8f61eb4341be Yang Yingliang 2013-12-11  592  	}
02a56c81cf33de Eric Dumazet   2015-11-08 @593  	dst->value = sk->sk_frag.offset;
4890062960cbc4 Thomas Graf    2005-06-08  594  }
4890062960cbc4 Thomas Graf    2005-06-08  595  

:::::: The code at line 593 was first introduced by commit
:::::: 02a56c81cf33dea892da1f8a5231b0f7d7e714fe net_sched: em_meta: use skb_to_full_sk() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
