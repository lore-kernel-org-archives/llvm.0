Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C484A48;
	Tue,  5 Mar 2024 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709645869; cv=none; b=YIqhS1cWrBmWf6Mh3sqF6vL7CB5OXsgZDGTToc1Zo9XVyE2wenbwXqPoaUAMqqY9Trtgt6qaFcNqh2ZOum993mA7poVfUzKU8P2AipU/LMSdO2LzyCL/pj4Bj2SY50Zi02StkxnnNJx3fRH1OITPJ9/RKSWe5i0/why82AEAJHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709645869; c=relaxed/simple;
	bh=ax/AzGyHbaXf9JUnZYDYcZScwOSIjDgnlEjR07TqFE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CxClHjV9eoahaMzteKDQfKkp32K4T9k0TZKgqJFY2A74IB5m8G3xp8MogQh891i2Nic4+rujNmiJ0ztTnA4Uk+atG0/67aLUiGEMucsbJFb7wBdd8zdVxak/m7zfCOT33nUaQxmSbyCpdLIF/hR0BvP6q4i1QD/TrCupJL0hfd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fjuq1jod; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fjuq1jod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709645867; x=1741181867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ax/AzGyHbaXf9JUnZYDYcZScwOSIjDgnlEjR07TqFE0=;
  b=Fjuq1jodADrJvEkxU5yeQvyzV9Lwl8cPef6jHR8WA46Khxo2/9Iqg3bA
   BeNWV4U98QRAPVnOkIh3Edyu30PbokApfhLSTuy5PqhiokKKDbcENkT2H
   YXMqQcuGBz1D8AzhBStTlruKLtPvMVbNzz7FXyVbi5QBSD6YrDxkqXnOz
   Z4lY51opH8tEBAJlhcoiUJy4TMD6Pc50iqKTZTN8yVViVNO0oNBFSu5WQ
   IUmUHIsaA6m4KiBZ9CG2i2gUzV9ZJqsQNBkuTK4oLNcfp8+v8lt1AM2Nn
   G/KE2gheo45Wsgq87NNYmnipzJKoM5MUepaADDG1V9XOj4Dv5Yjryx1Ro
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4076134"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4076134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9439917"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2024 05:37:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhUzF-0003KH-2g;
	Tue, 05 Mar 2024 13:37:41 +0000
Date: Tue, 5 Mar 2024 21:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 26/28] block/blk-merge.c:597:9: warning: format
 specifies type 'unsigned long long' but the argument has type 'dma_addr_t'
 (aka 'unsigned int')
Message-ID: <202403052151.hPT88XvP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   9a1309977ab77599d5c66aa6a77b5b308f4f4379
commit: d6bc00edad972dc9c214c239e8d253c7ba370a4a [26/28] block: add dma_link_range() based API
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403052151.hPT88XvP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052151.hPT88XvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052151.hPT88XvP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-merge.c:7:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> block/blk-merge.c:597:9: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     596 |                 pr_err("dma_mapping_err %d dma_addr 0x%llx dma_offset %llu\n",
         |                                                       ~~~~
         |                                                       %x
     597 |                         ret, dma_addr, dma_offset);
         |                              ^~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   block/blk-merge.c:597:19: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     596 |                 pr_err("dma_mapping_err %d dma_addr 0x%llx dma_offset %llu\n",
         |                                                                       ~~~~
         |                                                                       %u
     597 |                         ret, dma_addr, dma_offset);
         |                                        ^~~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +597 block/blk-merge.c

   585	
   586	static dma_addr_t blk_dma_link_page(struct page *page, unsigned int page_offset,
   587					    struct dma_iova_attrs *iova,
   588					    dma_addr_t dma_offset)
   589	{
   590		dma_addr_t dma_addr;
   591		int ret;
   592	
   593		dma_addr = dma_link_range(page, page_offset, iova, dma_offset);
   594		ret = dma_mapping_error(iova->dev, dma_addr);
   595		if (ret) {
   596			pr_err("dma_mapping_err %d dma_addr 0x%llx dma_offset %llu\n",
 > 597				ret, dma_addr, dma_offset);
   598			/* better way ? */
   599			dma_addr = 0;
   600		}
   601		return dma_addr;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
