Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A5157490;
	Wed, 25 Sep 2024 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727250914; cv=none; b=WhMQ0Pa5MS9ZobqBy/gWfNXYHz33ONYZZcBD7kvjQnxVk8R2fCrTeJayARd2BErwh+AVIwSBETu3IQVmI2RiYLHYHL4dgGWPsgUewYyO6HRO8X7vJ5Tb7OgCCzsL9RQxPmBekxF0CazRsWlFv+BrSlBzAliIn/7ZsG03IqgI9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727250914; c=relaxed/simple;
	bh=onnuYLvkaKKSJNLqIp8eCNb0T4hkLx7Ysm2WxJr7wEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9jZjnwrKiMYwfVQRSk3KI+yL3BtAlh58nI71D4z/9JHOcN5/uixv9qyloWt3IzmWn5oXUj5s4lsYy0MShKFifT0k5UlFu+TO82pvT5kPA3j0PMXQTo35J1PnUe0qfvz/2pbZZtWnnZsHXa4Ta1LFoEjw0GLJybqlJb4SMrnq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ul29YE1i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul29YE1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727250912; x=1758786912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=onnuYLvkaKKSJNLqIp8eCNb0T4hkLx7Ysm2WxJr7wEg=;
  b=Ul29YE1iHKm89eHBTXIhVZ6lWl4zotVVgUF+dmnD/qkNjkh8sh4lVZzz
   MdmzWlPCYZoQScMvHINHyqlEYaQo+xn4sw8/BC5g5+9dSUMk2G3NR3MZP
   tDfo+WL0maQq1Qz1SGTPJYsbZLxsySQq3PYtjBkPcEiQkP5NYiUM7sW1p
   thOYUeuvIiGIySvV4kEoIjGBtegtXFtGHcTu4XZF1u06xlYJIp3ACAxaJ
   WVLf2tCOmkLG5JoZ4AC/9RW/mxARkZFIqSrpZU8TFrqM4tUQvRwnDFEi2
   TNNdKN6vn912nAGu/2sYGP81ClzznqHeAfFyyDTZRsnrgYzrZbmLpnPrr
   w==;
X-CSE-ConnectionGUID: OpSCoiLCTNywRRwXflQb5A==
X-CSE-MsgGUID: TfQeFteQSyGQIOMzvd6o/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26231808"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26231808"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 00:55:09 -0700
X-CSE-ConnectionGUID: qWQlesjeQNm+CQ8oGSH/1g==
X-CSE-MsgGUID: PFEEdDF3Q1eojZB8t1AvIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71837108"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 00:55:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stMrZ-000JKd-1I;
	Wed, 25 Sep 2024 07:55:05 +0000
Date: Wed, 25 Sep 2024 15:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] block: add support for partition table defined
 in OF
Message-ID: <202409251530.PSGUVk2k-lkp@intel.com>
References: <20240923105937.4374-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923105937.4374-4-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on robh/for-next lwn/docs-next linus/master v6.11 next-20240925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/block-add-support-for-defining-read-only-partitions/20240923-190251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240923105937.4374-4-ansuelsmth%40gmail.com
patch subject: [RFC PATCH 3/4] block: add support for partition table defined in OF
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409251530.PSGUVk2k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251530.PSGUVk2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251530.PSGUVk2k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/partitions/of.c:3:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from block/partitions/of.c:5:
   In file included from block/partitions/check.h:4:
   In file included from block/partitions/../blk.h:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from block/partitions/of.c:5:
   In file included from block/partitions/check.h:4:
   In file included from block/partitions/../blk.h:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from block/partitions/of.c:5:
   In file included from block/partitions/check.h:4:
   In file included from block/partitions/../blk.h:7:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> block/partitions/of.c:47:28: error: use of undeclared identifier 'pp'
      47 |         if (of_property_read_bool(pp, "read-only"))
         |                                   ^
>> block/partitions/of.c:58:5: warning: no previous prototype for function 'of_partition' [-Wmissing-prototypes]
      58 | int of_partition(struct parsed_partitions *state)
         |     ^
   block/partitions/of.c:58:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      58 | int of_partition(struct parsed_partitions *state)
         | ^
         | static 
   17 warnings and 1 error generated.


vim +/pp +47 block/partitions/of.c

    25	
    26	static void add_of_partition(struct parsed_partitions *state, int slot,
    27				     struct device_node *np)
    28	{
    29		struct partition_meta_info *info;
    30		char tmp[sizeof(info->volname) + 4];
    31		int a_cells, s_cells;
    32		const char *partname;
    33		const __be32 *reg;
    34		u64 offset, size;
    35		int len;
    36	
    37		reg = of_get_property(np, "reg", &len);
    38	
    39		a_cells = of_n_addr_cells(np);
    40		s_cells = of_n_size_cells(np);
    41	
    42		offset = of_read_number(reg, a_cells);
    43		size = of_read_number(reg + a_cells, s_cells);
    44	
    45		put_partition(state, slot, offset, size);
    46	
  > 47		if (of_property_read_bool(pp, "read-only"))
    48			state->parts[slot].flags |= ADDPART_FLAG_READONLY;
    49	
    50		info = &state->parts[slot].info;
    51		partname = of_get_property(np, "label", &len);
    52		strscpy(info->volname, partname, sizeof(info->volname));
    53	
    54		snprintf(tmp, sizeof(tmp), "(%s)", info->volname);
    55		strlcat(state->pp_buf, tmp, PAGE_SIZE);
    56	}
    57	
  > 58	int of_partition(struct parsed_partitions *state)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
