Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45775B661;
	Fri, 10 Jan 2025 03:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736480836; cv=none; b=f+2mrFjJb8ZHf+5sPu6+vXMiCwxFp8C4M3junj7Ab9LbCSA+dxwvNiVwNDBcx0S/AvkoZd42KcqjMEtK1jSOqjVbtStPgRZM81/HqQtSbzbDCjr1VG/DvdObdG5L334YUyP8xMdEckAmEsbM7X4b9unLSTgx5L99lVmpLpDP5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736480836; c=relaxed/simple;
	bh=KjKowHOTBxutd5Z05iZ1UuGOm4z51o31/kCUn7wFKjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze+3T518iTD4wHS4SCCPYoh3s9EIxTn8Ux4MaRClorG6+LhjuP3ZugSwhI3AH3zmoGL1b0r/HGE3jrkBlqFfI0bnMX3XahkmnvCxJkcvVlC6w7YkU4Tw+WyUveyIB48Ux8MuGEcLRZK+ElO+Va3zj3fqQavcXA4hgfenT7TtMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xvnd0GG/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xvnd0GG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736480834; x=1768016834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KjKowHOTBxutd5Z05iZ1UuGOm4z51o31/kCUn7wFKjg=;
  b=Xvnd0GG/SxLS7yC49UoGJu/r8qNJahE47jnY+N0YJ62bmjBk5PGZYA3U
   2ltXB3NWwfY8PCNgMP4zrZaFQykoY+D5BOLt2rii8kR7yDGOkdNyDaUmV
   ACbV1Jux8bEbxVwvo5D87RnuhNSMFANkc7V/2N2+YZbcmjgBQ1IwNY/BF
   kgyYLHZHxHqFc1KHgeSFjZeFee7/tX6UQ4m0Hk+lW8jP4U0B9QcQd9h1e
   qWGW3Rce2EquJug6zUTcjmOILhZ9oC2UwKfgsxuK9QX2BCU2sDXM3m3Mt
   rZfZpoYufwfytdg2xRuhko61H6C1LiWspokvjwi5RBgTegDxvrWJqKVtS
   w==;
X-CSE-ConnectionGUID: y8tFne9ZT+e2hCCeWm7y7Q==
X-CSE-MsgGUID: wDSJcmGoSmmhuTE2fXEwTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="24369069"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="24369069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 19:47:13 -0800
X-CSE-ConnectionGUID: 6TVp+HLCTgOuWGKaf5PJ7Q==
X-CSE-MsgGUID: aelnAd06RnGBNPxbZsteJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104491941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 19:47:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW5zJ-000IVv-31;
	Fri, 10 Jan 2025 03:47:09 +0000
Date: Fri, 10 Jan 2025 11:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 08/11] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
Message-ID: <202501101110.Y2RdAOgc-lkp@intel.com>
References: <20250108233128.14484-9-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108233128.14484-9-npache@redhat.com>

Hi Nico,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/introduce-khugepaged_collapse_single_pmd-to-collapse-a-single-pmd/20250109-073542
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250108233128.14484-9-npache%40redhat.com
patch subject: [RFC 08/11] khugepaged: introduce khugepaged_scan_bitmap for mTHP support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501101110.Y2RdAOgc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101110.Y2RdAOgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101110.Y2RdAOgc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/khugepaged.c:4:
   In file included from include/linux/mm.h:2289:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/khugepaged.c:10:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/khugepaged.c:1330:7: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
    1330 |                 if (!(enabled_orders >> (order +  MIN_MTHP_ORDER)) & 1)
         |                     ^                                              ~
   mm/khugepaged.c:1330:7: note: add parentheses after the '!' to evaluate the bitwise operator first
    1330 |                 if (!(enabled_orders >> (order +  MIN_MTHP_ORDER)) & 1)
         |                     ^                                                 
         |                      (                                                )
   mm/khugepaged.c:1330:7: note: add parentheses around left hand side expression to silence this warning
    1330 |                 if (!(enabled_orders >> (order +  MIN_MTHP_ORDER)) & 1)
         |                     ^
         |                     (                                             )
   mm/khugepaged.c:1308:12: warning: unused function 'khugepaged_scan_bitmap' [-Wunused-function]
    1308 | static int khugepaged_scan_bitmap(struct mm_struct *mm, unsigned long address,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +1330 mm/khugepaged.c

  1306	
  1307	// Recursive function to consume the bitmap
  1308	static int khugepaged_scan_bitmap(struct mm_struct *mm, unsigned long address,
  1309				int referenced, int unmapped, struct collapse_control *cc,
  1310				bool *mmap_locked, unsigned long enabled_orders)
  1311	{
  1312		u8 order, offset;
  1313		int num_chunks;
  1314		int bits_set, max_percent, threshold_bits;
  1315		int next_order, mid_offset;
  1316		int top = -1;
  1317		int collapsed = 0;
  1318		int ret;
  1319		struct scan_bit_state state;
  1320	
  1321		cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1322			{ HPAGE_PMD_ORDER - MIN_MTHP_ORDER, 0 };
  1323	
  1324		while (top >= 0) {
  1325			state = cc->mthp_bitmap_stack[top--];
  1326			order = state.order;
  1327			offset = state.offset;
  1328			num_chunks = 1 << order;
  1329			// Skip mTHP orders that are not enabled
> 1330			if (!(enabled_orders >> (order +  MIN_MTHP_ORDER)) & 1)
  1331				goto next;
  1332	
  1333			// copy the relavant section to a new bitmap
  1334			bitmap_shift_right(cc->mthp_bitmap_temp, cc->mthp_bitmap, offset,
  1335					  MTHP_BITMAP_SIZE);
  1336	
  1337			bits_set = bitmap_weight(cc->mthp_bitmap_temp, num_chunks);
  1338	
  1339			// Check if the region is "almost full" based on the threshold
  1340			max_percent = ((HPAGE_PMD_NR - khugepaged_max_ptes_none - 1) * 100)
  1341							/ (HPAGE_PMD_NR - 1);
  1342			threshold_bits = (max_percent * num_chunks) / 100;
  1343	
  1344			if (bits_set >= threshold_bits) {
  1345				ret = collapse_huge_page(mm, address, referenced, unmapped, cc,
  1346						mmap_locked, order + MIN_MTHP_ORDER, offset * MIN_MTHP_NR);
  1347				if (ret == SCAN_SUCCEED)
  1348					collapsed += (1 << (order + MIN_MTHP_ORDER));
  1349				continue;
  1350			}
  1351	
  1352	next:
  1353			if (order > 0) {
  1354				next_order = order - 1;
  1355				mid_offset = offset + (num_chunks / 2);
  1356				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1357					{ next_order, mid_offset };
  1358				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1359					{ next_order, offset };
  1360				}
  1361		}
  1362		return collapsed;
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
