Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4708D286D73;
	Fri, 12 Sep 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672757; cv=none; b=ZqJ4fYo3BJp9/svITGwnqHcyqJABjPhPl73VstGQt73CwXPC0imP5kjKOteEcDVoJmh/7KMv1ke2M+5ekweRJdKcW2padUgAUzE3+PAYwtQXxYQfejiIIB+wRxgN37YOYcyXfM3MXir3EdpYXkllpnrj6y34LLGmPlj7zBzcs6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672757; c=relaxed/simple;
	bh=8QI+t/emV3KKiCi2m0R6qI07rQ+E75YRrrNmVz+GEn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOxhogkxcYJjP4KtkGeYhpWA/1IqOupYl0cx1H15ZYh12qcA9jhhYzqUPPuEiCweEckq+pKw/TvMXC/qyzWVWE/+6c/KCrgMw2VKjob6qO/vs2TTNHEuaQFS29kV3awQuSo4Rls8zuCPpeCcCCiw+XtzSABK+C261Wi1AZLCqCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpBcARyt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpBcARyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757672755; x=1789208755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8QI+t/emV3KKiCi2m0R6qI07rQ+E75YRrrNmVz+GEn4=;
  b=LpBcARytFD9OGnn4Tj+dE168dmt1xW2fysLNqPT5ABzyrbC6RXzUHiQv
   5IQTGQEHadmliJUgbqtr55VX27f+o7F5L43tqv2++hq1vFXyE8uqYeZZR
   u8NnHxvWuEvPsQNEmoCQrAJqg5yNgKyjmgUu7P6E0PxfiqWXyDRbIlIoT
   alnqmdKqdirnojeREWoXIsUo4pWjqim6Exs//Y2CN7pgNUseX23QoGLlX
   XNN5TxgOLQYKKR20wy+LQGcm+zvihxBDSEUHu9ZVMEpftPHT1Tsg0fw9o
   eQZzF41KvGEhm5UwPdi7W2ysMzvY4jn2njPhCX812T53wr8Cd0RCAS7RP
   g==;
X-CSE-ConnectionGUID: A+x9WDyiRVWQQtpGEFGwZw==
X-CSE-MsgGUID: gjn3xO4RQX2wHxsEtfHbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59876797"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59876797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 03:25:55 -0700
X-CSE-ConnectionGUID: D54g7u5bQNi3fF3uOjVgPg==
X-CSE-MsgGUID: XsLUvO5nSq6b0T8soicwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="197621271"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2025 03:25:53 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux0yV-0000xY-01;
	Fri, 12 Sep 2025 10:25:51 +0000
Date: Fri, 12 Sep 2025 18:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:slab/for-6.18/kmalloc_nolock 14/14] mm/slub.c:3866:2:
 warning: variable 'flags' is used uninitialized whenever '&&' condition is
 false
Message-ID: <202509121822.aOV6H1ts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-6.18/kmalloc_nolock
head:   8014922e0e72dde7684abebeab3404720401679f
commit: 8014922e0e72dde7684abebeab3404720401679f [14/14] slab: Introduce kmalloc_nolock() and kfree_nolock().
config: x86_64-buildonly-randconfig-004-20250912 (https://download.01.org/0day-ci/archive/20250912/202509121822.aOV6H1ts-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121822.aOV6H1ts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509121822.aOV6H1ts-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:3866:2: warning: variable 'flags' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    3866 |         local_lock_cpu_slab(s, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
    3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                      ^~~~~~~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3891:27: note: uninitialized use occurs here
    3891 |         local_unlock_cpu_slab(s, flags);
         |                                  ^~~~~
   mm/slub.c:3780:48: note: expanded from macro 'local_unlock_cpu_slab'
    3780 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |                                                       ^~~~~
   include/linux/local_lock.h:52:48: note: expanded from macro 'local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(this_cpu_ptr(lock), flags)
         |                                                       ^~~~~
   include/linux/local_lock_internal.h:202:21: note: expanded from macro '__local_unlock_irqrestore'
     202 |                 local_irq_restore(flags);                       \
         |                                   ^~~~~
   include/linux/irqflags.h:240:61: note: expanded from macro 'local_irq_restore'
     240 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                                             ^~~~~
   include/linux/irqflags.h:179:26: note: expanded from macro 'raw_local_irq_restore'
     179 |                 arch_local_irq_restore(flags);          \
         |                                        ^~~~~
   mm/slub.c:3866:2: note: remove the '&&' if its condition is always true
    3866 |         local_lock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
    3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
         |         ^
   include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                      ^
   mm/slub.c:3863:21: note: initialize the variable 'flags' to silence this warning
    3863 |         unsigned long flags;
         |                            ^
         |                             = 0
   1 warning generated.


vim +3866 mm/slub.c

  3852	
  3853	/*
  3854	 * Put a slab into a partial slab slot if available.
  3855	 *
  3856	 * If we did not find a slot then simply move all the partials to the
  3857	 * per node partial list.
  3858	 */
  3859	static void put_cpu_partial(struct kmem_cache *s, struct slab *slab, int drain)
  3860	{
  3861		struct slab *oldslab;
  3862		struct slab *slab_to_put = NULL;
  3863		unsigned long flags;
  3864		int slabs = 0;
  3865	
> 3866		local_lock_cpu_slab(s, flags);
  3867	
  3868		oldslab = this_cpu_read(s->cpu_slab->partial);
  3869	
  3870		if (oldslab) {
  3871			if (drain && oldslab->slabs >= s->cpu_partial_slabs) {
  3872				/*
  3873				 * Partial array is full. Move the existing set to the
  3874				 * per node partial list. Postpone the actual unfreezing
  3875				 * outside of the critical section.
  3876				 */
  3877				slab_to_put = oldslab;
  3878				oldslab = NULL;
  3879			} else {
  3880				slabs = oldslab->slabs;
  3881			}
  3882		}
  3883	
  3884		slabs++;
  3885	
  3886		slab->slabs = slabs;
  3887		slab->next = oldslab;
  3888	
  3889		this_cpu_write(s->cpu_slab->partial, slab);
  3890	
  3891		local_unlock_cpu_slab(s, flags);
  3892	
  3893		if (slab_to_put) {
  3894			__put_partials(s, slab_to_put);
  3895			stat(s, CPU_PARTIAL_DRAIN);
  3896		}
  3897	}
  3898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
