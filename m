Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D929371892;
	Thu, 19 Mar 2026 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911953; cv=none; b=thvH2CYaslzLl+hard6g/ArGAmJko+cTuNzeKtXSrTU0BYcv0VYvuf0guOWYu3Zhi9g71RqvXUyzfSAvnMB2F215t8f98dsosMS/aqKzByvQi5c1ag7UZUUd2NXNjXbHIdB5exXlCqzMoO5j79X9CLFUmc0SwwOwgoKc53mXQ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911953; c=relaxed/simple;
	bh=UhJZcesHkMAeF1u1X9G/RL/Et3pepMVILpCeXtZ2/D4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l08jADrrw1tvmfxGvFoD/4CPmwa4tBaRK8kiLzO1LeTjbpxENbeFckPsZP2dYkHeklhc69uipOHMHQo+BqjM+CCM5oQljED4jYkj8spQPMzAqL1nZb/X33wEEkKK695qjvJswO0PNfYdv8JkKnNsDAVwA1Kco5IVRfWixiBDCYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCBpp5hI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCBpp5hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773911952; x=1805447952;
  h=date:from:to:cc:subject:message-id;
  bh=UhJZcesHkMAeF1u1X9G/RL/Et3pepMVILpCeXtZ2/D4=;
  b=PCBpp5hILokjFvemxY1xtrRp0PaJlD2QKWXIx6e0i4jNqOcakTJRgi86
   2LQCyxPpQnT/mDFqTpWoWcLIaqTDXymQMWRtmj8FRFYv7xqxNCCL5YKxy
   AIqJL6xto9iXbL7yZyCLO2KlYvnaZjE+XcaYAI1K+qxZnsEoc0+5DCHfw
   fO3Hf6SBA0T+Ew1J9Yb3huJ0NeNGg8ftqxcnjYv3woKc5bRBklg66/J+8
   XZYTu8s8uxiKX39l1tzcB+hblbV7UiesUENeOwrg71OjhSvDFx8Azv6Qo
   Alj6ES7ZkgiGoC1Tz6oWxiR2NygqVXC2HfNXX5ML9/4SVGLcsJU2kw0Bn
   g==;
X-CSE-ConnectionGUID: j2ixhbQVQ1iS12PcOVpGGg==
X-CSE-MsgGUID: bQLxpvMOTr6t32VfnTS4KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78837182"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78837182"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:19:11 -0700
X-CSE-ConnectionGUID: axA+hBOTSombJdSpVOeeMw==
X-CSE-MsgGUID: M2hF/pOnQkuje5yUwKQ7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227604984"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 02:19:08 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39W2-000000000eN-27kx;
	Thu, 19 Mar 2026 09:18:11 +0000
Date: Thu, 19 Mar 2026 17:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 6/10] include/linux/spinlock.h:388:1:
 warning: raw_spinlock 'lock->.rlock' is still held at the end of function
Message-ID: <202603191712.uxBdFAep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   754219dea900fe187e29e8b5ff9fa49238e394c7
commit: b5db14c62254a116585d2620ccee08d1613c25e3 [6/10] irq & spin_lock: Add counted interrupt disabling/enabling
config: hexagon-randconfig-001-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191712.uxBdFAep-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191712.uxBdFAep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191712.uxBdFAep-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/rsa.c:9:
   In file included from include/linux/module.h:18:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
>> include/linux/spinlock.h:388:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
     388 | }
         | ^
   include/linux/spinlock.h:387:2: note: raw_spinlock acquired here
     387 |         raw_spin_lock_irq_disable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:277:41: note: expanded from macro 'raw_spin_lock_irq_disable'
     277 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
         |                                         ^
   include/linux/spinlock_api_up.h:80:42: note: expanded from macro '_raw_spin_lock_irq_disable'
      80 | #define _raw_spin_lock_irq_disable(lock)        __LOCK_IRQ_DISABLE(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:46:35: note: expanded from macro '__LOCK_IRQ_DISABLE'
      46 |   do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
         |                                   ^
   include/linux/spinlock_api_up.h:34:27: note: expanded from macro '__LOCK'
      34 |   do { preempt_disable(); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK_'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-context-analysis.h:361:23: note: expanded from macro '__acquire'
     361 | #define __acquire(x)            __acquire_ctx_lock(x)
         |                                 ^
   In file included from crypto/rsa.c:9:
   In file included from include/linux/module.h:18:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
>> include/linux/spinlock.h:422:2: warning: releasing raw_spinlock 'lock->.rlock' that was not held [-Wthread-safety-analysis]
     422 |         raw_spin_unlock_irq_enable(&lock->rlock);
         |         ^
   include/linux/spinlock.h:281:42: note: expanded from macro 'raw_spin_unlock_irq_enable'
     281 | #define raw_spin_unlock_irq_enable(lock)        _raw_spin_unlock_irq_enable(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:143:43: note: expanded from macro '_raw_spin_unlock_irq_enable'
     143 | #define _raw_spin_unlock_irq_enable(lock)       __UNLOCK_IRQ_ENABLE(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:68:8: note: expanded from macro '__UNLOCK_IRQ_ENABLE'
      68 |   do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
         |        ^
   include/linux/spinlock_api_up.h:55:26: note: expanded from macro '__UNLOCK'
      55 |   do { preempt_enable(); ___UNLOCK_##__VA_ARGS__(lock); } while (0)
         |                          ^
   include/linux/spinlock_api_up.h:49:8: note: expanded from macro '___UNLOCK_'
      49 |   do { __release(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-context-analysis.h:369:23: note: expanded from macro '__release'
     369 | #define __release(x)            __release_ctx_lock(x)
         |                                 ^
   2 warnings generated.


vim +388 include/linux/spinlock.h

   384	
   385	static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
   386	{
   387		raw_spin_lock_irq_disable(&lock->rlock);
 > 388	}
   389	
   390	#define spin_lock_irqsave(lock, flags)				\
   391	do {								\
   392		raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
   393		__release(spinlock_check(lock)); __acquire(lock);	\
   394	} while (0)
   395	
   396	#define spin_lock_irqsave_nested(lock, flags, subclass)			\
   397	do {									\
   398		raw_spin_lock_irqsave_nested(spinlock_check(lock), flags, subclass); \
   399		__release(spinlock_check(lock)); __acquire(lock);		\
   400	} while (0)
   401	
   402	static __always_inline void spin_unlock(spinlock_t *lock)
   403		__releases(lock) __no_context_analysis
   404	{
   405		raw_spin_unlock(&lock->rlock);
   406	}
   407	
   408	static __always_inline void spin_unlock_bh(spinlock_t *lock)
   409		__releases(lock) __no_context_analysis
   410	{
   411		raw_spin_unlock_bh(&lock->rlock);
   412	}
   413	
   414	static __always_inline void spin_unlock_irq(spinlock_t *lock)
   415		__releases(lock) __no_context_analysis
   416	{
   417		raw_spin_unlock_irq(&lock->rlock);
   418	}
   419	
   420	static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
   421	{
 > 422		raw_spin_unlock_irq_enable(&lock->rlock);
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
