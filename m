Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1215697A;
	Fri,  1 Nov 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455477; cv=none; b=HFYybFxSflORO1QeJcoxSkX7IWcx/zLehX9ZbBaGKNyF7b423N4S8za0iNISO+13YIS8aROZjXzS52cihKpOWSg2oe3AftvaLv7lOoI02BWf1TB/lNwkXliZB2PG1Ra5DueMqRjMShLJBtI6NJPmrDlG36o9dUwhNkyEcOouI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455477; c=relaxed/simple;
	bh=A9Z557mzzih6Td+ON5PDB5O9ll2TCHfWjWR+HHfOfYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MqipuegqkLM01Mhx+udxz1+osXD0mfc1jj6rS1P0vVv9k54RndH3BLoHIZBx3D116g6k9d1G8zsgDv+PzwqKsX0+4dWT6KMzaThfrrzWoxx9T1R5loHvBapyU01rnex7lZp4jiQo8n/vRhbmdhTUoOOznitfMt8sjcodE6V9o8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXo8RnX4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXo8RnX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730455474; x=1761991474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9Z557mzzih6Td+ON5PDB5O9ll2TCHfWjWR+HHfOfYQ=;
  b=OXo8RnX4i67xTBwYNkQU6vtEU6AQpUTkWbfDtHhUpbtKCH8jQY3fKtbi
   bCByOkX615RkumwpBzV2l8M/QiA7XgWteJYDPuNis0Fvq8/wlljNkiy+t
   yKOkYfRLvKcndUgPpbwfvVqALD8qcfrF3+sVXkPz6BkYHkxLMIm2wsxPg
   yitLI4hsM/8Bi7yh6XZ3ktddG3TMW8n0fc3dyD7aYRUprvKi32IDS1KAE
   EORmX4bWTDvhZ+x9BfpsnT6TxttnQgATRstKNyvI1UAR+C4adWKUAcDfg
   15eDZdgDhZ47g8LWA4nOVxcdujgonFFJuDdkEr5PHxXkBmt0uPXpBQxjZ
   g==;
X-CSE-ConnectionGUID: 1fvBotlWQo6HQzJePI7Ivg==
X-CSE-MsgGUID: u4U/3shNSO2JE5St2u6QdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34153877"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="34153877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:04:33 -0700
X-CSE-ConnectionGUID: 9A09Mo36QwCb8ebwyvWfUg==
X-CSE-MsgGUID: u87QX1RvTFq3H8XGLH77HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87734179"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 03:04:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6oW5-000hOJ-0n;
	Fri, 01 Nov 2024 10:04:29 +0000
Date: Fri, 1 Nov 2024 18:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 59/60] io_uring/filetable.h:44:38:
 warning: shift count >= width of type
Message-ID: <202411011746.BkMtEc0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   208960febed8e8a2deaadfc0135e934373b16532
commit: 3f048388f63bf3e751c0eca2a55db050c558da61 [59/60] io_uring: extend io_uring_sqe flags bits
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241101/202411011746.BkMtEc0T-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011746.BkMtEc0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011746.BkMtEc0T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io_uring.c:83:
   In file included from io_uring/io_uring.h:13:
>> io_uring/filetable.h:44:38: warning: shift count >= width of type [-Wshift-count-overflow]
      44 |         return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
         |                                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from io_uring/uring_cmd.c:5:
   In file included from include/linux/io_uring/cmd.h:6:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/uring_cmd.c:14:
   In file included from io_uring/io_uring.h:13:
>> io_uring/filetable.h:44:38: warning: shift count >= width of type [-Wshift-count-overflow]
      44 |         return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
         |                                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/uring_cmd.c:295:19: warning: unused function 'io_uring_cmd_getsockopt' [-Wunused-function]
     295 | static inline int io_uring_cmd_getsockopt(struct socket *sock,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/uring_cmd.c:321:19: warning: unused function 'io_uring_cmd_setsockopt' [-Wunused-function]
     321 | static inline int io_uring_cmd_setsockopt(struct socket *sock,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
--
   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/register.c:21:
   In file included from io_uring/io_uring.h:13:
>> io_uring/filetable.h:44:38: warning: shift count >= width of type [-Wshift-count-overflow]
      44 |         return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
         |                                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/register.c:122:24: warning: arithmetic between different enumeration types ('enum io_uring_register_restriction_op' and 'enum io_uring_register_op') [-Wenum-enum-conversion]
     122 |         if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/register.c:34:58: note: expanded from macro 'IORING_MAX_RESTRICTIONS'
      34 | #define IORING_MAX_RESTRICTIONS (IORING_RESTRICTION_LAST + \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~ ^
      35 |                                  IORING_REGISTER_LAST + IORING_OP_LAST)
         |                                  ~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +44 io_uring/filetable.h

3f1a546444738b Jens Axboe        2024-10-25  43  
3f1a546444738b Jens Axboe        2024-10-25 @44  	return (node->file_ptr & ~FFS_MASK) << REQ_F_SUPPORT_NOWAIT_BIT;
4bfb0c9af832a1 Christoph Hellwig 2023-06-20  45  }
a4ad4f748ea962 Jens Axboe        2022-05-25  46  

:::::: The code at line 44 was first introduced by commit
:::::: 3f1a546444738b21a8c312a4b49dc168b65c8706 io_uring/rsrc: get rid of per-ring io_rsrc_node list

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
