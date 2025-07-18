Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24C3214;
	Fri, 18 Jul 2025 04:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752814344; cv=none; b=ZeuipIPSXxkSXEr0Gpejj+8o0/c+DfCs6TD2i+nCSEOnC23QQFSzeC2neiTqXQOhKnrXYo6Fk79RCkx+LQ6WIM9n0zTSUE/+XK9G1I6v3aNe/c9gF9bB6oeotaZqVBCnsZfYHqMGWpjGcFy3BdImWFbbgZB0ap7pbR0CLMAwj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752814344; c=relaxed/simple;
	bh=LJpqQTK9UYmyB+Au6GLsNTH0EG0q/o+em2AeEvQYfTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4nLBPTNgx5b2LxvqqmHA+Hez1pT2CIk7LwJ4zRF65JFIEQYR6JX8ZTY8ydt3O/tBKrZ3DhNjtmgHBy/Vqnzv9ZfwLcIqPXWN0jfq0wctuIDOyyNcY3pnadZAxWlNh0Y4Pkw0+c4qiZvQH+8rBKZIKKuOZMf4Bl4cBfOaNtixTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWBAaOyv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWBAaOyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752814343; x=1784350343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJpqQTK9UYmyB+Au6GLsNTH0EG0q/o+em2AeEvQYfTo=;
  b=NWBAaOyvx3yiWIHlI2Ox3SU3sAuPoeDXlpnac8g3Qo2IzufuiBsWXc4g
   hoM0cao44EdPHMbBkSnoIQ9/AdnBF+vQiRSjRIdrt0z8XuF0m4cqpupjR
   8+ZlhcwmRyZleVdEfX3OkyWE6/TApxE+AjXvY/rq+nRc8cKhdgUzX0TS5
   OQcGK3VgdYrvW7sBRSj5sn5hmV1DjLEFw9sG5CgHBlvKrtYm8FBwftIXg
   WNUacN+EkLckDK+bC5Hy2IvXKnW8nKJA1elZagvjGpnhO6FcXTDNHQiZ5
   vJaXvEOOg3nOcNoKwqfLsHCL6aR1NakGOpYVb00Gl3qTW5+I8+agaHCWd
   A==;
X-CSE-ConnectionGUID: 9ZKtsALFRZGECaM9FvIq0A==
X-CSE-MsgGUID: sqqg9pu1Qz+P/JyCm1oQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58915128"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="58915128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 21:52:20 -0700
X-CSE-ConnectionGUID: tLhCz53AQlmQOIOcjDL7yw==
X-CSE-MsgGUID: FgB7ZX8GQQiompNsONF3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158443867"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2025 21:52:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucd4y-000EJ1-12;
	Fri, 18 Jul 2025 04:52:16 +0000
Date: Fri, 18 Jul 2025 12:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:kmalloc_nolock 6/7] mm/slub.c:3326:2: warning: variable
 'flags' is used uninitialized whenever '&&' condition is false
Message-ID: <202507181229.QStFKxIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git kmalloc_nolock
head:   de3de6fc810275dad0998ffed42d921690c667ec
commit: 8e58427a2c80d3a9be8b6f2f9ccc4319d1f27906 [6/7] slab: Introduce kmalloc_nolock() and kfree_nolock().
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181229.QStFKxIY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181229.QStFKxIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181229.QStFKxIY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:3326:2: warning: variable 'flags' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    3326 |         local_lock_cpu_slab(s, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3236:2: note: expanded from macro 'local_lock_cpu_slab'
    3236 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                      ^~~~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/slub.c:3351:27: note: uninitialized use occurs here
    3351 |         local_unlock_cpu_slab(s, flags);
         |                                  ^~~~~
   mm/slub.c:3240:48: note: expanded from macro 'local_unlock_cpu_slab'
    3240 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
         |                                                       ^~~~~
   include/linux/local_lock.h:52:34: note: expanded from macro 'local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |                                         ^~~~~
   include/linux/local_lock_internal.h:202:21: note: expanded from macro '__local_unlock_irqrestore'
     202 |                 local_irq_restore(flags);                       \
         |                                   ^~~~~
   include/linux/irqflags.h:240:61: note: expanded from macro 'local_irq_restore'
     240 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                                             ^~~~~
   include/linux/irqflags.h:179:26: note: expanded from macro 'raw_local_irq_restore'
     179 |                 arch_local_irq_restore(flags);          \
         |                                        ^~~~~
   mm/slub.c:3326:2: note: remove the '&&' if its condition is always true
    3326 |         local_lock_cpu_slab(s, flags);
         |         ^
   mm/slub.c:3236:2: note: expanded from macro 'local_lock_cpu_slab'
    3236 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
         |         ^
   include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |                      ^
   mm/slub.c:3323:21: note: initialize the variable 'flags' to silence this warning
    3323 |         unsigned long flags;
         |                            ^
         |                             = 0
   1 warning generated.


vim +3326 mm/slub.c

  3312	
  3313	/*
  3314	 * Put a slab into a partial slab slot if available.
  3315	 *
  3316	 * If we did not find a slot then simply move all the partials to the
  3317	 * per node partial list.
  3318	 */
  3319	static void put_cpu_partial(struct kmem_cache *s, struct slab *slab, int drain)
  3320	{
  3321		struct slab *oldslab;
  3322		struct slab *slab_to_put = NULL;
  3323		unsigned long flags;
  3324		int slabs = 0;
  3325	
> 3326		local_lock_cpu_slab(s, flags);
  3327	
  3328		oldslab = this_cpu_read(s->cpu_slab->partial);
  3329	
  3330		if (oldslab) {
  3331			if (drain && oldslab->slabs >= s->cpu_partial_slabs) {
  3332				/*
  3333				 * Partial array is full. Move the existing set to the
  3334				 * per node partial list. Postpone the actual unfreezing
  3335				 * outside of the critical section.
  3336				 */
  3337				slab_to_put = oldslab;
  3338				oldslab = NULL;
  3339			} else {
  3340				slabs = oldslab->slabs;
  3341			}
  3342		}
  3343	
  3344		slabs++;
  3345	
  3346		slab->slabs = slabs;
  3347		slab->next = oldslab;
  3348	
  3349		this_cpu_write(s->cpu_slab->partial, slab);
  3350	
  3351		local_unlock_cpu_slab(s, flags);
  3352	
  3353		if (slab_to_put) {
  3354			__put_partials(s, slab_to_put);
  3355			stat(s, CPU_PARTIAL_DRAIN);
  3356		}
  3357	}
  3358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
