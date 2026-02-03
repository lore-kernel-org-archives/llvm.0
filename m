Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D5396B85;
	Tue,  3 Feb 2026 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111545; cv=none; b=icwsd9ci/KJyLy2jjKaf2rj59tbZ3IcF+hNsRPxasxrZDkwUyXItDRa2y/wNkc2RFYWdlvnRxI9wRGPq8Wlz4PIAkkmKfGLLrOdeSDIXGETOjBdKuN5dVGeiuRqLvS8SFWp0LoOkEG1iqulLcUoDo+PKKsVSS0o2CZ7M0eBOoPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111545; c=relaxed/simple;
	bh=YyjVHcEAKeMwQzUB0Q3StU0iVpf8HRLPctKwHV2f+T0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c0EsrE4h4Ut+cBtUV4GXPJ7lfGQnOyDeeCU8VxrgMmixMtgiYPndiX+fJ+0gHACFO2+me1LOq0MRCp/p7HxdQX8Bl//sbB5h/ktu/nyixLOq0Q7V+zV9UAhATFMLmCQtzlXScDAxRmeQ24cWOPHuAtpcwdg1QVuOWqgjxMWvy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQYmjmMI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQYmjmMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770111544; x=1801647544;
  h=date:from:to:cc:subject:message-id;
  bh=YyjVHcEAKeMwQzUB0Q3StU0iVpf8HRLPctKwHV2f+T0=;
  b=HQYmjmMIMyl9In7UTcAWkbLV+1Dr0JTzFYuGy6DURcFM33So58ry6Mkm
   m6LTOG0TkCbg6egHpEIW8JczcQkgcwbHiVf6JHmawIfxfAuylM0jE4rr3
   mm3YqUTO7a1+WxfVYYB2FNKzsuzyM7lVpLZkEIJsiyWe45oQEX73CEuxs
   Ni3s7V9/OL5r/C7cy//AI9Y0kXMxyD+6E19PG7sPT7exDkuoj4tqsxXB+
   V8YLWPA7k86/duIZYD1NPg15iv1PC2YaEJ05IQgk2nY8HN5LuHX7wPiOM
   SyP+bm3Dd/0JtA0Uw8MsEOcNTgHmN/TqxW2lRaw1r03KThvcBWnRlbS4t
   A==;
X-CSE-ConnectionGUID: ym4+Jdy7RWecZneIBUvY7w==
X-CSE-MsgGUID: V6srVftUQoK0n4DE0GSm5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="93931299"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="93931299"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:39:01 -0800
X-CSE-ConnectionGUID: jFUPhhHqSQm3SuvzicjMHQ==
X-CSE-MsgGUID: BH9oiZOeTiKI0GlbgjD10A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209230214"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 01:38:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnCs4-00000000gVG-15lS;
	Tue, 03 Feb 2026 09:38:56 +0000
Date: Tue, 03 Feb 2026 17:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 16/18]
 include/linux/spinlock_api_smp.h:163:2: warning: raw_spinlock 'lock' is not
 held on every path through here
Message-ID: <202602031729.MQ9qJ1OX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   04c35250bb394d7bc867e1527c3250e49d486025
commit: c54b183eeade43270288ca1fa71cb4731bc78e8e [16/18] irq & spin_lock: Add counted interrupt disabling/enabling
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602031729.MQ9qJ1OX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031729.MQ9qJ1OX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031729.MQ9qJ1OX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/api.c:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:311:
>> include/linux/spinlock_api_smp.h:163:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     163 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/spinlock_api_smp.h:163:44: note: raw_spinlock acquired here
     163 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
>> include/linux/spinlock_api_smp.h:214:2: warning: releasing raw_spinlock 'lock' that was not held [-Wthread-safety-analysis]
     214 |         do_raw_spin_unlock(lock);
         |         ^
   In file included from crypto/api.c:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
>> include/linux/spinlock.h:387:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
     387 | }
         | ^
   include/linux/spinlock.h:386:2: note: raw_spinlock acquired here
     386 |         raw_spin_lock_irq_disable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:276:41: note: expanded from macro 'raw_spin_lock_irq_disable'
     276 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
         |                                         ^
>> include/linux/spinlock.h:421:2: warning: releasing raw_spinlock 'lock->.rlock' that was not held [-Wthread-safety-analysis]
     421 |         raw_spin_unlock_irq_enable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:280:42: note: expanded from macro 'raw_spin_unlock_irq_enable'
     280 | #define raw_spin_unlock_irq_enable(lock)        _raw_spin_unlock_irq_enable(lock)
         |                                                 ^
   4 warnings generated.


vim +/lock +163 include/linux/spinlock_api_smp.h

   158	
   159	static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
   160	{
   161		local_interrupt_disable();
   162		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
 > 163		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
   164	}
   165	
   166	static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
   167		__acquires(lock) __no_context_analysis
   168	{
   169		__local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
   170		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
   171		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
   172	}
   173	
   174	static inline void __raw_spin_lock(raw_spinlock_t *lock)
   175		__acquires(lock) __no_context_analysis
   176	{
   177		preempt_disable();
   178		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
   179		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
   180	}
   181	
   182	#endif /* !CONFIG_GENERIC_LOCKBREAK || CONFIG_DEBUG_LOCK_ALLOC */
   183	
   184	static inline void __raw_spin_unlock(raw_spinlock_t *lock)
   185		__releases(lock)
   186	{
   187		spin_release(&lock->dep_map, _RET_IP_);
   188		do_raw_spin_unlock(lock);
   189		preempt_enable();
   190	}
   191	
   192	static inline void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
   193						    unsigned long flags)
   194		__releases(lock)
   195	{
   196		spin_release(&lock->dep_map, _RET_IP_);
   197		do_raw_spin_unlock(lock);
   198		local_irq_restore(flags);
   199		preempt_enable();
   200	}
   201	
   202	static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
   203		__releases(lock)
   204	{
   205		spin_release(&lock->dep_map, _RET_IP_);
   206		do_raw_spin_unlock(lock);
   207		local_irq_enable();
   208		preempt_enable();
   209	}
   210	
   211	static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
   212	{
   213		spin_release(&lock->dep_map, _RET_IP_);
 > 214		do_raw_spin_unlock(lock);
   215		local_interrupt_enable();
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
