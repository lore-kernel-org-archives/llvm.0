Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1038333123B;
	Thu, 19 Mar 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910475; cv=none; b=FEbe37vlcOoYd2aAb5y7nd6Ed27vlRNEKS2xQD2DE7M1gWzfDEwP0g02xdGQ9r/ixS4PzF1wKn0/0KTUawUnbkuHiv3xHMCPV6/h7Iz5WeDFWS2sjZEmQSGVXtGiaxpbX8qStYzKhcQdDLrTN44FpyfggEVzV33ewlseQEJurss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910475; c=relaxed/simple;
	bh=ICdOYzmwNPkjHQuz+dkdEEtUrayOtPgT8HkMi45Oc2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qldF/KYFTAgJE5tBeShuNh1dAZDmc2EyCg3tS2mAYBhNh6deG1yyJBipxtezMqaZTJTB3X6Hoa3xwO1XLMsxnOub/l1X3n6+928oOnQrOPxFdO2WS0YSSWKNdD/67uNytMr+apm8HpcL/WUe4IlOt+gd96YKk9WsNmIRwmUhcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUix+0rR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUix+0rR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773910473; x=1805446473;
  h=date:from:to:cc:subject:message-id;
  bh=ICdOYzmwNPkjHQuz+dkdEEtUrayOtPgT8HkMi45Oc2g=;
  b=RUix+0rRkeSI5bYBwYf2ekVpMVTiD1/qyQWs5m6YF1va0CK6elHDyhsj
   v7Xic+I2rQZZwLmNCFXY/PJC4L/57MLY23uw0ngGOjMW9Kterr1/hkhUF
   rWvTfsXtb8umSvSopUSBDTENJafGzT0v1P3/XN7RO2EWCho/xwi1hgMri
   XRbdCDYYCcszYnR4XPYtgXyC6/QjT18KIKdXbASMqQ2S4HtKVqK+zu+cv
   vGeKZV4DCQWEsgfKPhxRIwpjXteotJykkpNTrtrBY538LnuT1cFVXOXt5
   8P0QoP8p7plGB97tg6GZNhNxo/iKIAX3m/yJ+PG/329lvB2W60gyyT9+Y
   Q==;
X-CSE-ConnectionGUID: rB4+8NtLSVG9JYhSNLNxEw==
X-CSE-MsgGUID: V8ZpLDiiTQKzgE9McGTdWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75053168"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75053168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:54:32 -0700
X-CSE-ConnectionGUID: oJ4UIA+zSje+WQZgefTaMw==
X-CSE-MsgGUID: Ytv8WMJ+TrenHLO0+Uxt7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260798782"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 01:54:30 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3994-000000000bV-0yjs;
	Thu, 19 Mar 2026 08:54:22 +0000
Date: Thu, 19 Mar 2026 16:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 6/10]
 include/linux/spinlock_api_smp.h:164:1: warning: raw_spinlock 'lock' is still
 held at the end of function
Message-ID: <202603191632.hv1p7osp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   754219dea900fe187e29e8b5ff9fa49238e394c7
commit: b5db14c62254a116585d2620ccee08d1613c25e3 [6/10] irq & spin_lock: Add counted interrupt disabling/enabling
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260319/202603191632.hv1p7osp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191632.hv1p7osp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191632.hv1p7osp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/api.c:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:312:
>> include/linux/spinlock_api_smp.h:164:1: warning: raw_spinlock 'lock' is still held at the end of function [-Wthread-safety-analysis]
     164 | }
         | ^
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
   include/linux/spinlock.h:388:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
     388 | }
         | ^
   include/linux/spinlock.h:387:2: note: raw_spinlock acquired here
     387 |         raw_spin_lock_irq_disable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:277:41: note: expanded from macro 'raw_spin_lock_irq_disable'
     277 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
         |                                         ^
   include/linux/spinlock.h:422:2: warning: releasing raw_spinlock 'lock->.rlock' that was not held [-Wthread-safety-analysis]
     422 |         raw_spin_unlock_irq_enable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:281:42: note: expanded from macro 'raw_spin_unlock_irq_enable'
     281 | #define raw_spin_unlock_irq_enable(lock)        _raw_spin_unlock_irq_enable(lock)
         |                                                 ^
   4 warnings generated.


vim +/lock +164 include/linux/spinlock_api_smp.h

   158	
   159	static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
   160	{
   161		local_interrupt_disable();
   162		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
   163		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 > 164	}
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
