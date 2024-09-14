Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BA238B;
	Sat, 14 Sep 2024 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726301573; cv=none; b=iec+d3tQ843hB3038ny4iHtM5n6jtiqSafdZ/GDihwShp0++9NkMPFjY0q7GTaYEea4/sDPOd757q5z+A4YsEmHv2kVKgnmfq84rKXatJiWNLuuuymCniDAxTFWBTsJXw6HG5BC7PEo8hgxtb76k2pznIkNxupJlN/cOvKQ0t6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726301573; c=relaxed/simple;
	bh=r38S6sw4RXheW+otD1Y4ZlGL5AJbeYMbhsl4q4FoDu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krIWJnJvIj13CQOVfH0OzS8+cQx4WiARF5cd/e5O6R6IcdoVc7KowX7oKnrmHwocUr76r9POKmewACChnQkng1EPXXrBeevGHdA9FW2YHqaZTzEleN5OIvdDRFu+vdwtrFfU4EX+SFz94AVndxWGe4UU6LTvvb9gMwJ89UZIQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5t4XdBi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5t4XdBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726301572; x=1757837572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r38S6sw4RXheW+otD1Y4ZlGL5AJbeYMbhsl4q4FoDu8=;
  b=A5t4XdBil38IAe8LNpCP1j9ueCksbTP+otpL/A+GKU3Az2CbxJnEpvNZ
   QL8KBj0OftGo/TrVDUxCrLgEtPzJGv9MdQrIAniBasAQ5Khs7qRNwHBVw
   SpMNVEdVE10numFUGcDgeiKWaHGry7uinPIIfymooG7SnVFHaHa2hA9Ij
   juk+8Um4iBKfCZmvyOezd87zEnDoc3NgG3p2BpcNYM1rbP8JAawLfsnAz
   5L26IUkUuA4HySYjT0n7YMJMs6ELlFTGstMxrFxVZs3qvnRXlUJbmmez9
   Iljjbqw1eI9zEnyo6A2ZuVORQwq7AcDH2MfPXbaWCvN0Z8A7tl1PrvA24
   Q==;
X-CSE-ConnectionGUID: zTjpX4LrSbSdg6j8GkU3rw==
X-CSE-MsgGUID: MoDeCy78S2SqVaRHfDvIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="42717147"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="42717147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:12:51 -0700
X-CSE-ConnectionGUID: bQ/xg6XmQ3GAXonkwzoNNw==
X-CSE-MsgGUID: f5irCxNJTbGVzKz+pw1qGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68290648"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2024 01:12:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNtf-0007Wa-0L;
	Sat, 14 Sep 2024 08:12:47 +0000
Date: Sat, 14 Sep 2024 16:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 03/11] unwind: Introduce SFrame user space unwinding
Message-ID: <202409141653.JlQG6bQS-lkp@intel.com>
References: <ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc7 next-20240913]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 03/11] unwind: Introduce SFrame user space unwinding
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240914/202409141653.JlQG6bQS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141653.JlQG6bQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141653.JlQG6bQS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/init-mm.c:48:26: error: expected expression
      48 |         INIT_MM_CONTEXT(init_mm),
         |                                 ^
   mm/init-mm.c:49:16: error: expected expression
      49 |         INIT_MM_SFRAME,
         |                       ^
   1 warning and 2 errors generated.


vim +48 mm/init-mm.c

    22	
    23	/*
    24	 * For dynamically allocated mm_structs, there is a dynamically sized cpumask
    25	 * at the end of the structure, the size of which depends on the maximum CPU
    26	 * number the system can see. That way we allocate only as much memory for
    27	 * mm_cpumask() as needed for the hundreds, or thousands of processes that
    28	 * a system typically runs.
    29	 *
    30	 * Since there is only one init_mm in the entire system, keep it simple
    31	 * and size this cpu_bitmask to NR_CPUS.
    32	 */
    33	struct mm_struct init_mm = {
    34		.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
    35		.pgd		= swapper_pg_dir,
    36		.mm_users	= ATOMIC_INIT(2),
    37		.mm_count	= ATOMIC_INIT(1),
    38		.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
    39		MMAP_LOCK_INITIALIZER(init_mm)
    40		.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
    41		.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
    42		.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
    43	#ifdef CONFIG_PER_VMA_LOCK
    44		.mm_lock_seq	= 0,
    45	#endif
    46		.user_ns	= &init_user_ns,
    47		.cpu_bitmap	= CPU_BITS_NONE,
  > 48		INIT_MM_CONTEXT(init_mm),
    49		INIT_MM_SFRAME,
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
