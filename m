Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1E79F3;
	Wed, 24 Jul 2024 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721785324; cv=none; b=hn4HqqivDWMR/SwLTz3ENkzlxn10wxH6pFttVJ+xCJIFITk5gqQuTikp68CfXFeiL/m3oLYKu1SAarOB60yL9GBcfDSEVFjb1XAHoNbp3edziUCL3lLVn8QLrmuXkmbljr42fkrQvRcJo2ELUz2YypcDqqiYeZEc1uMXU5WwS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721785324; c=relaxed/simple;
	bh=6iDBbKaWSr+xTmXZWXNHBqukQgY+T0PXsUqcwlXFh4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOsI40KwjhRhsKzZkG+hpV7h+VRf1VtvOZVTLNfE5UKpX68/TKh4gR+ws7vOhFzEQhDGi62AVLF1mgci/nd3O52HU33FsM8PMW7SH+HJXb8Qzciwc3Z5Bcf7E9tsUUUwLLJqOEgA7sVZzaEX+lygWUE0EL88l9DRVVCvSHVNULc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2XXUkpm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2XXUkpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721785322; x=1753321322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6iDBbKaWSr+xTmXZWXNHBqukQgY+T0PXsUqcwlXFh4A=;
  b=P2XXUkpmPnQtYwmapPCS6wjfnYvkLlfHqB/5BqRiS8qskTwLVTqGCYid
   XmDEq7RObU4auEY8gDsvWbMtvmRNcvrS+bOL30eEFkPidhZuDwIv2Vhi0
   yJP6P2q5DFBxUJjDjmVf7+dwa/aeWf/tB2Dm3VhdjsxOBE5Ah9V9+BHzL
   gw1MNqhgXcE0zOEoWWsIoi4l2hicOVvNEZKrgblqjf06mrSCWpW5Q6MXk
   fyTT1XUHcexzjnLYooFrT9lATifPf6jQjGaqIiiXLducCJlYnPoqFxB2Q
   15aI8Yi6qONgnDbjQlMBhQNGnmo30ULU1jtMANFtW0ZT221SWPIyo3ngh
   Q==;
X-CSE-ConnectionGUID: tZAUrrlgRLyOK21beTv0Dw==
X-CSE-MsgGUID: MxvzoDl4SryhUsrwApPkbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="36886754"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="36886754"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 18:42:02 -0700
X-CSE-ConnectionGUID: 74zJ9a8PQl2mutOrfgAfCQ==
X-CSE-MsgGUID: +acuf8jdRn2Ex97ARx0eFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56579101"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jul 2024 18:42:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWR0w-000mXk-0N;
	Wed, 24 Jul 2024 01:41:58 +0000
Date: Wed, 24 Jul 2024 09:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-unstable 17/30] mm/vma_internal.h:46:10: fatal error:
 'asm/page_types.h' file not found
Message-ID: <202407240947.x904ix8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cecb3db438d76f7c1005fd52689809696a330474
commit: b102945dd5b200efff9e8458946006770a513710 [17/30] mm: move internal core VMA manipulation functions to own file
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407240947.x904ix8E-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240947.x904ix8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240947.x904ix8E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vma.c:7:
   In file included from mm/vma_internal.h:12:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2206:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/vma.c:7:
   In file included from mm/vma_internal.h:28:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vma.c:7:
>> mm/vma_internal.h:46:10: fatal error: 'asm/page_types.h' file not found
      46 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +46 mm/vma_internal.h

    44	
    45	#include <asm/current.h>
  > 46	#include <asm/page_types.h>
    47	#include <asm/pgtable_types.h>
    48	#include <asm/tlb.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
