Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C354D9FB;
	Sat, 11 May 2024 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715426167; cv=none; b=mYjCpr5exOOueVrXxMv58vKPr2uw2p4btsYgRjgDLYZ20MbM2r2Z+6KZS3fOjTL1CuExD67EE5ogVYDciHZsA+Q+CZjI9xAdoFkg//c8mVO0Le4mRrGLTKgFmbGk4RdzdSVkpo1Whz2Kk5kTCQHtVhaLdtJeVzIarmhugLLiVVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715426167; c=relaxed/simple;
	bh=XY/T6zRegyR5BF4+/iMbBYdVKHSq6LG5/sTLpc26kwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SczDxrvsIULyLOz0XJTHCJ7dggI5t+REfI01ZD8ddm53b/uGvmRztWvzK4XfqoM8Rw+vAdNTA+5OdVFAlEWFDENZ2IlfRAn1PuI1PYnGMDVyHwwpG+UMjvCdI+4woX4BTPpKV58MM0qnqW1I5rVmU37BDjVhLSVKDWhtrSoiPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE2OwRLx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE2OwRLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715426164; x=1746962164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XY/T6zRegyR5BF4+/iMbBYdVKHSq6LG5/sTLpc26kwg=;
  b=NE2OwRLxDFwWzCI0/7OgliYVDZ6yigcc4jV3r5htunKMMYvMm/x5sHXp
   YBBtxfNVyOXxO+fghuGeKrec/r2qYVMOqE0+uw4Y1Sv1DFFUUqSk/3OxX
   5S8qZoWJ+Nm7z2W1LFmXPI5xHmUfJ/hv3okhPGmdJsNO/JJ5R6RT9N2MG
   BNXXs879fzvuX+vDIHCEWh7kUeXp0PsusevgYSVHD5kS6z9TqgKwlIkiE
   4dz0cTNfKH1+zQm6Hev8qSpXETzWbDiVPH8V2PERn2+vgexgTgzvoCLjU
   Nuh3qHMPFymUBV6d7AKxE7bQJY+nKHIHjkoV26HwKdvpoZNizXS/DoB7z
   Q==;
X-CSE-ConnectionGUID: +/prWpxWR7mJ3tNJJmsA3w==
X-CSE-MsgGUID: OYRMAjnxQUCwgGHTHpUomw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11588697"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11588697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 04:16:03 -0700
X-CSE-ConnectionGUID: CCtbc0SuQIS8QxNHDhHwpQ==
X-CSE-MsgGUID: 6ByOP/1kStegtafsVVFHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="30274623"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2024 04:16:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5khr-0007IT-11;
	Sat, 11 May 2024 11:15:59 +0000
Date: Sat, 11 May 2024 19:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] block: introduce helper function to calculate
 bps budgt
Message-ID: <202405111926.ww1PplNP-lkp@intel.com>
References: <20240509023937.1090421-2-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509023937.1090421-2-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.9-rc7]
[cannot apply to next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/block-introduce-helper-function-to-calculate-bps-budgt/20240509-104233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240509023937.1090421-2-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH 1/2] block: introduce helper function to calculate bps budgt
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240511/202405111926.ww1PplNP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111926.ww1PplNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111926.ww1PplNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/readahead.c:116:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/readahead.c:127:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/readahead.c:128:
>> include/linux/blk-cgroup.h:55:9: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
      55 |         return U64_MAX;
         |         ~~~~~~ ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   4 warnings generated.
--
   In file included from mm/backing-dev.c:3:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/backing-dev.c:8:
>> include/linux/blk-cgroup.h:55:9: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
      55 |         return U64_MAX;
         |         ~~~~~~ ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
   2 warnings generated.


vim +55 include/linux/blk-cgroup.h

    49	
    50	#ifdef CONFIG_BLK_DEV_THROTTLING
    51	unsigned long blk_throttle_budgt(struct block_device *bdev);
    52	#else
    53	static inline unsigned long blk_throttle_budgt(struct block_device *bdev)
    54	{
  > 55		return U64_MAX;
    56	}
    57	#endif
    58	int blkcg_set_fc_appid(char *app_id, u64 cgrp_id, size_t app_id_len);
    59	char *blkcg_get_fc_appid(struct bio *bio);
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
