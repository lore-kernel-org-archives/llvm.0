Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142822B5B9;
	Thu, 27 Feb 2025 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740680684; cv=none; b=ayqN4/QT2XoeDX0FBnr/GVwl0ryz0Vv7YGHdMqD+O8xDLTwqc5RofvGjZ7kSSiCWc6n/qSV7IVRVf7vo+XknslxLwfVhDvTGuTrb7Qc51p/NF9LinQeNQnNtHYYhq7bzyT7jbYFTBWptHTMFLgKbB+WqGsp9PecKwhqftbv8pq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740680684; c=relaxed/simple;
	bh=lPJfANm//PFLRscat0+SkC7KrFsy45HYSa3uyyWbfDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5d/U53OAVKBomJOl83hd1L6izbn5p+pbjdOu3IUozYCUi91cGQw3xewXGZIQkG+iL30VmaDj4bpr/u3gaEj5oaVD9pjqlpwXdBXJT4tBW5/gdtG/TGtdQyvhTc0LS3NoRQMkCXmxBgVviuSZv7EF07kFv3Qr1uURtw2qvs/FfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdoY6oZ6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdoY6oZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740680683; x=1772216683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lPJfANm//PFLRscat0+SkC7KrFsy45HYSa3uyyWbfDA=;
  b=fdoY6oZ6A4jWxe6Hf1ljWrReJ4nV9Uapj4PgTHAroEmqQDb467cJRG++
   sF7jBlKhA7rvSTb4GmA8SMCTruxFFoY7xQhMGB3Pp45kx8VNuVHrSnWu0
   sN4AdNAv9n1aLTOlvslbnM0pV2cJ5OrkWXDI0zyI2j1R3sf0CRdBYmCmP
   SNeeWNSbWMQD2i+JpQVM/IvYe1a9Mo9hE9MQ0XDH/dRWgX6Pt9SFP0KVO
   uG1OhGT5sgAJzmH0iGfsQ/hsKnL4EkkJuOyPQlKBMgyYzMIxODLLLa27t
   Yf1IpF0/6TCVMXaNamOsPIS79Nx/r2eebRH9XSmSahHUTYP9ViLwc8ZLo
   g==;
X-CSE-ConnectionGUID: kSvR9zBCSm63IGvGhlo9Kw==
X-CSE-MsgGUID: V4/UFP7URKKtmxUP/Wnodg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41471301"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41471301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:24:42 -0800
X-CSE-ConnectionGUID: 76AqPYziQdmZa7k3I643vg==
X-CSE-MsgGUID: HrQy19BfTQKcKQkm5RV84g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117102575"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2025 10:24:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tniYo-000Dqs-2U;
	Thu, 27 Feb 2025 18:24:38 +0000
Date: Fri, 28 Feb 2025 02:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Haifeng Xu <haifeng.xu@shopee.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] io_uring: fix the dead lock between io_uring and core dump
Message-ID: <202502280245.WT5bW0xf-lkp@intel.com>
References: <20250226113936.385747-1-haifeng.xu@shopee.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226113936.385747-1-haifeng.xu@shopee.com>

Hi Haifeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haifeng-Xu/io_uring-fix-the-dead-lock-between-io_uring-and-core-dump/20250226-194045
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250226113936.385747-1-haifeng.xu%40shopee.com
patch subject: [RFC] io_uring: fix the dead lock between io_uring and core dump
config: i386-buildonly-randconfig-003-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280245.WT5bW0xf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280245.WT5bW0xf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280245.WT5bW0xf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
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
>> kernel/sched/core.c:6791:40: error: no member named 'io_uring' in 'struct task_struct'
    6791 |         struct io_uring_task *io_uring = tsk->io_uring;
         |                                          ~~~  ^
   2 warnings and 1 error generated.


vim +6791 kernel/sched/core.c

  6786	
  6787	static inline void sched_submit_work(struct task_struct *tsk)
  6788	{
  6789		static DEFINE_WAIT_OVERRIDE_MAP(sched_map, LD_WAIT_CONFIG);
  6790		unsigned int task_flags;
> 6791		struct io_uring_task *io_uring = tsk->io_uring;
  6792	
  6793		/*
  6794		 * Establish LD_WAIT_CONFIG context to ensure none of the code called
  6795		 * will use a blocking primitive -- which would lead to recursion.
  6796		 */
  6797		lock_map_acquire_try(&sched_map);
  6798	
  6799		task_flags = tsk->flags;
  6800		/*
  6801		 * If a worker goes to sleep, notify and ask workqueue whether it
  6802		 * wants to wake up a task to maintain concurrency.
  6803		 */
  6804		if (task_flags & PF_WQ_WORKER)
  6805			wq_worker_sleeping(tsk);
  6806		else if (task_flags & PF_IO_WORKER)
  6807			io_wq_worker_sleeping(tsk);
  6808		else if ((task_flags & PF_DUMPCORE) && io_uring) {
  6809			struct io_wq *wq = io_uring->io_wq;
  6810	
  6811			io_wq_cancel_tw_create(wq);
  6812		}
  6813	
  6814		/*
  6815		 * spinlock and rwlock must not flush block requests.  This will
  6816		 * deadlock if the callback attempts to acquire a lock which is
  6817		 * already acquired.
  6818		 */
  6819		SCHED_WARN_ON(current->__state & TASK_RTLOCK_WAIT);
  6820	
  6821		/*
  6822		 * If we are going to sleep and we have plugged IO queued,
  6823		 * make sure to submit it to avoid deadlocks.
  6824		 */
  6825		blk_flush_plug(tsk->plug, true);
  6826	
  6827		lock_map_release(&sched_map);
  6828	}
  6829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
