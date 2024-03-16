Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A21094E;
	Sat, 16 Mar 2024 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710585348; cv=none; b=sL1bclHQDnP3WsSfnonwPbqdRZVC+IoqZvnimg8vRFm0ROZeKc7xXGubQBNq57DcdOritMu6b2dP5Rr9mClfQrWn2yeM+tbUQc52PwhzgAC9fqdzWpqCKXWxW5zzIexWY3SFJM2ygNx5GIX1/ZtKxEOuL46QuR10af3UrLOvGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710585348; c=relaxed/simple;
	bh=K0REUZyDWv7v8IVD7tyHBmVQR0asv36y0akj2o6aV0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMqVkkcO3fDhm4B+pAv2AuoVXCDEeXXmkLQZvmrUR+y2zuzsc8ijNCyzBBvyDyOfDAjMWg0Cxi500RoREV4p7C9CYQRDX2/zjt/3Y6wa+OjWnbttW4I3nNlGdASm4TO2R5P/v5HKdgqSvghdk65eg+CQn2Uhv5KGWWJI6uCViGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvQtQsqx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvQtQsqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710585345; x=1742121345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K0REUZyDWv7v8IVD7tyHBmVQR0asv36y0akj2o6aV0k=;
  b=WvQtQsqxgQ3mVmdeV7kDstqar6bkzMNryPBTEDa+AUeEr4ZzZa646+/+
   8gygYBbdXIsDVokcO3frj1j2dKQuUoWsPaMkwAeoy+jTyyn3ED8EYN4w1
   qiId4OMeXDQdVBjRTslRImHJ4QPqNRd4Y33KAXXlQ73c4k4RmBo1lVpNe
   l7P0haUNw/L7f+JYD5mFU98/QlHgkBv5+Pw1+1kvKRLX+U1OmHcvWGnqN
   mGq0SwxCg2hoMUnxPpikzRoIsCwZpq2gaWla7tJwtfFUU0ySr4pMSDI6p
   nGk4UVEVvm+2rsAIEJl+zyx3yNr75ZaXlGx4Hoi0Ps1MDfmC7/U9uGEuZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5590390"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="5590390"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 03:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="17413214"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2024 03:35:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlRO8-000FKQ-2i;
	Sat, 16 Mar 2024 10:35:40 +0000
Date: Sat, 16 Mar 2024 18:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity()
 hook
Message-ID: <202403161836.fYVwHSId-lkp@intel.com>
References: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710560151-28904-13-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20240315]
[cannot apply to device-mapper-dm/for-next lwn/docs-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240316-114235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1710560151-28904-13-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v15 12/21] security: add security_bdev_setintegrity() hook
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240316/202403161836.fYVwHSId-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161836.fYVwHSId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161836.fYVwHSId-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:25:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
   In file included from mm/filemap.c:26:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from mm/oom_kill.c:21:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/oom_kill.c:31:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
   2 warnings and 1 error generated.
--
   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:35:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   4 warnings and 1 error generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:53:
   In file included from include/linux/shmem_fs.h:11:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
>> include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
   mm/vmscan.c:381:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     381 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1694:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1694 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2201:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2201 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2202:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2202 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6207:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6207 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings and 1 error generated.
--
   In file included from mm/workingset.c:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset.c:9:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/workingset.c:11:
   In file included from include/linux/shmem_fs.h:11:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
>> include/linux/security.h:1506:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
>> include/linux/security.h:1506:30: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
    1506 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
   4 warnings and 1 error generated.


vim +/int +1506 include/linux/security.h

  1504	
  1505	static inline int security_bdev_setintegrity(struct block_device *bdev,
> 1506						     enum lsm_intgr_type, type,
  1507						     const void *value, size_t size)
  1508	{
  1509		return 0;
  1510	}
  1511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
