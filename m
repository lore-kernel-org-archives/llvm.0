Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D82E040D;
	Mon,  4 May 2026 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881986; cv=none; b=qZdyRF7854nHxMXmuot7hOgz7PXBTY/Vtoph5QkAlsilGr2sHmycMwcLQWK1Es2O3OuRnyIePB796JZZ+LYt1kd8JA7X8bT6S6KKKbw/b/62ytFSmma8QcPQ9o+VhyKgeJWsDZZY72ffewaKCCC5lcrkCsL4y5hWvgapiCi2Ge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881986; c=relaxed/simple;
	bh=20Spegg/tCow4yuRRErv9E1hcbblwDh0FuFq2aWTwk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i4mBRLXLf+wBPc9UV/Vk22gQh+aVYZEAkvDjQwfRlSLP+4qCNq984rfhLGNVL9iqQWn5tASPXxVxOKhvYv7MZiwg4laBG2h/ilpkeaWqPbu6GhMdpdGXAtF452vvfEx3A5ee+PRrGHt/rKgvDz5gFFciiGErwA6upwag6xHtnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok0+CBLN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok0+CBLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777881984; x=1809417984;
  h=date:from:to:cc:subject:message-id;
  bh=20Spegg/tCow4yuRRErv9E1hcbblwDh0FuFq2aWTwk0=;
  b=Ok0+CBLNtHnYazOn456yp5VvN05urbTp2c6niIrKoiHTWR/aDL674Pq9
   hFAZZZatuH7wHYkfZMqDaNUxK37PoJuJW4xncMKCHvn4OgxfWOkT3OD2u
   n7aPuOzPUqShw7MNO2X0Iw+xlVSdbw9iSVgfCBrfJrZRPhMRC6vvGWUbU
   9dBEwvu0A1lqYSdn2uuWUikEFa1Wj0r+KdTW/gmgvZdQlbV2dIOn76n2j
   /W3DDOgn3/iqrMIgKQ8kDZORCzFET/ApCSnBbxqgRVIwx2TY6ui8gzAXO
   DLNr5dRZAh8wp/CNUVlMnPxdJWawffwF7lBBewtk4gpdnJH9Jc+MiDwWz
   Q==;
X-CSE-ConnectionGUID: mj0bEDwmTUyxNeLV4WLneA==
X-CSE-MsgGUID: PbPQd6SZT7S+wfDtuaNYBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78929461"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78929461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:06:24 -0700
X-CSE-ConnectionGUID: eAQ34XcfR2mIIZvrJy2EKA==
X-CSE-MsgGUID: 87j9jb3rTjWKX8tgmsnB/g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 May 2026 01:06:21 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJoJK-000000003c1-21CB;
	Mon, 04 May 2026 08:05:59 +0000
Date: Mon, 04 May 2026 16:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 6/12]
 include/linux/spinlock_api_smp.h:164:1: warning: raw_spinlock 'lock' is still
 held at the end of function
Message-ID: <202605041555.6gPRUiF4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   25f8ae3956f6e747f0eedaca70ed975a79068ec4
commit: 90ca6e15e07decdc384ce96c1e3bdf0be60f5085 [6/12] irq & spin_lock: Add counted interrupt disabling/enabling
config: powerpc64-randconfig-002-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041555.6gPRUiF4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041555.6gPRUiF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041555.6gPRUiF4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/crc32.c:12:
   In file included from include/crypto/internal/hash.h:11:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
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
   In file included from crypto/crc32.c:12:
   In file included from include/crypto/internal/hash.h:11:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
>> include/linux/spinlock.h:388:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
     388 | }
         | ^
   include/linux/spinlock.h:387:2: note: raw_spinlock acquired here
     387 |         raw_spin_lock_irq_disable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:277:41: note: expanded from macro 'raw_spin_lock_irq_disable'
     277 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
         |                                         ^
>> include/linux/spinlock.h:422:2: warning: releasing raw_spinlock 'lock->.rlock' that was not held [-Wthread-safety-analysis]
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
