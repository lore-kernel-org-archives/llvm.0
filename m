Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E559192D86;
	Sat, 19 Oct 2024 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729378809; cv=none; b=sUhkhenQzb8P+GP/9yIcZnX8rakuUxX4R7hZJE2/q4qdomWA6p2gNwHmKLLQjufiy/wzah8c6e+zuCZh1BNesr82wzfutq5koU9ySCuIxqyQ60lSZTR2wpwLq14RzTVbKZ1U9jXSFjyXT3eR4IBpF/rkUAB4ifXRPuJdp2l5Ifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729378809; c=relaxed/simple;
	bh=BBUpTi77s7170OaD5UfdpSZrh7iJNbpO/p67H//Gwik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRJNtv97QljjPhK81GwckVKVs0WUI1cnZT8a8oNd8sdzKAJ/rQ3ghd9/1NjcjGbyyxiY4nIJSmnroRPGHb4vH7n1mZRsBsTX4GhaPutcrpa0N7Vg/3+9gFUCk8mTR0+8XhJW9oD/Usj/9ltL+0joIxvrxd5l63QLZ7xkAmelx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/oEh7i7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/oEh7i7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729378807; x=1760914807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BBUpTi77s7170OaD5UfdpSZrh7iJNbpO/p67H//Gwik=;
  b=d/oEh7i7FEpWCJhNRNBd9xOmQC8JvFdkRvkkFS0WKGDv04BeCP+RnBte
   F2yIIiB2lwN6jrv+eqf9E3BX7ysKS+PdPOGao3Mc2VSWmY5COwyB2O/KJ
   uJpbjWuB/SrRbsSemmU0D5ImkRXktorGXHU6xSwUZiEDP9TUTQ5Jje58P
   gX969RyNH3DzrcQW+Jyy0zItSmxlXavP27riGSPQoxgKRBiqvnBWFLS1j
   jeIVDqspvMoANAX0IleVmGP6VYJsjDJDegwCnkVKQh2qoHYYhNxJcoY51
   e8nwpni+uTBXgIe+wMtWTMgVgqjR5fYoTgIJjYlVPm40b7dUPl7xe11nE
   Q==;
X-CSE-ConnectionGUID: CEMd91BaSEeiKB4bzzl+xw==
X-CSE-MsgGUID: gBiKhEc1TrK/nrj9QB/MSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40282441"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40282441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 16:00:06 -0700
X-CSE-ConnectionGUID: Ke+qa/zOQCu8MUENMjs55w==
X-CSE-MsgGUID: aciwN74QRZakdM2qjI29Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83966229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 16:00:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2IQT-000PdB-2s;
	Sat, 19 Oct 2024 23:00:01 +0000
Date: Sun, 20 Oct 2024 06:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: lizhe.67@bytedance.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] rwsem: introduce upgrade_read interface
Message-ID: <202410200646.zcyZ4KjG-lkp@intel.com>
References: <20241016043600.35139-2-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016043600.35139-2-lizhe.67@bytedance.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/rwsem-introduce-upgrade_read-interface/20241016-123810
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20241016043600.35139-2-lizhe.67%40bytedance.com
patch subject: [RFC 1/2] rwsem: introduce upgrade_read interface
config: i386-buildonly-randconfig-003-20241020 (https://download.01.org/0day-ci/archive/20241020/202410200646.zcyZ4KjG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200646.zcyZ4KjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200646.zcyZ4KjG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1662:52: error: no member named 'count' in 'struct rw_semaphore'
    1662 |         atomic_long_andnot(RWSEM_FLAG_UPGRADE_READ, &sem->count);
         |                                                      ~~~  ^
>> kernel/locking/rwsem.c:1662:21: error: use of undeclared identifier 'RWSEM_FLAG_UPGRADE_READ'
    1662 |         atomic_long_andnot(RWSEM_FLAG_UPGRADE_READ, &sem->count);
         |                            ^
   kernel/locking/rwsem.c:1674:31: error: no member named 'count' in 'struct rw_semaphore'
    1674 |         tmp = atomic_long_read(&sem->count);
         |                                 ~~~  ^
>> kernel/locking/rwsem.c:1676:14: error: use of undeclared identifier 'RWSEM_WRITER_MASK'
    1676 |                 if (tmp & (RWSEM_WRITER_MASK | RWSEM_FLAG_UPGRADE_READ)) {
         |                            ^
   kernel/locking/rwsem.c:1676:34: error: use of undeclared identifier 'RWSEM_FLAG_UPGRADE_READ'
    1676 |                 if (tmp & (RWSEM_WRITER_MASK | RWSEM_FLAG_UPGRADE_READ)) {
         |                                                ^
   kernel/locking/rwsem.c:1680:42: error: no member named 'count' in 'struct rw_semaphore'
    1680 |         } while (!atomic_long_try_cmpxchg(&sem->count, &tmp,
         |                                            ~~~  ^
   kernel/locking/rwsem.c:1681:9: error: use of undeclared identifier 'RWSEM_FLAG_UPGRADE_READ'
    1681 |                 tmp + RWSEM_FLAG_UPGRADE_READ + RWSEM_WRITER_LOCKED - RWSEM_READER_BIAS));
         |                       ^
>> kernel/locking/rwsem.c:1681:35: error: use of undeclared identifier 'RWSEM_WRITER_LOCKED'
    1681 |                 tmp + RWSEM_FLAG_UPGRADE_READ + RWSEM_WRITER_LOCKED - RWSEM_READER_BIAS));
         |                                                 ^
>> kernel/locking/rwsem.c:1681:57: error: use of undeclared identifier 'RWSEM_READER_BIAS'
    1681 |                 tmp + RWSEM_FLAG_UPGRADE_READ + RWSEM_WRITER_LOCKED - RWSEM_READER_BIAS));
         |                                                                       ^
>> kernel/locking/rwsem.c:1683:13: error: use of undeclared identifier 'RWSEM_READER_MASK'
    1683 |         if ((tmp & RWSEM_READER_MASK) == RWSEM_READER_BIAS) {
         |                    ^
   kernel/locking/rwsem.c:1683:35: error: use of undeclared identifier 'RWSEM_READER_BIAS'
    1683 |         if ((tmp & RWSEM_READER_MASK) == RWSEM_READER_BIAS) {
         |                                          ^
>> kernel/locking/rwsem.c:1687:3: error: call to undeclared function 'rwsem_set_owner'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1687 |                 rwsem_set_owner(sem);
         |                 ^
>> kernel/locking/rwsem.c:1692:26: error: no member named 'wait_lock' in 'struct rw_semaphore'
    1692 |         raw_spin_lock_irq(&sem->wait_lock);
         |                            ~~~  ^
   include/linux/spinlock.h:274:53: note: expanded from macro 'raw_spin_lock_irq'
     274 | #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
         |                                                            ^~~~
>> kernel/locking/rwsem.c:1693:2: error: call to undeclared function 'rwsem_set_owner_upgrade'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1693 |         rwsem_set_owner_upgrade(sem);
         |         ^
   kernel/locking/rwsem.c:1698:32: error: no member named 'count' in 'struct rw_semaphore'
    1698 |                 if (!(atomic_long_read(&sem->count) & RWSEM_READER_MASK))
         |                                         ~~~  ^
   kernel/locking/rwsem.c:1698:41: error: use of undeclared identifier 'RWSEM_READER_MASK'
    1698 |                 if (!(atomic_long_read(&sem->count) & RWSEM_READER_MASK))
         |                                                       ^
   kernel/locking/rwsem.c:1700:29: error: no member named 'wait_lock' in 'struct rw_semaphore'
    1700 |                 raw_spin_unlock_irq(&sem->wait_lock);
         |                                      ~~~  ^
   include/linux/spinlock.h:277:56: note: expanded from macro 'raw_spin_unlock_irq'
     277 | #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_irq(lock)
         |                                                              ^~~~
   kernel/locking/rwsem.c:1703:27: error: no member named 'wait_lock' in 'struct rw_semaphore'
    1703 |                 raw_spin_lock_irq(&sem->wait_lock);
         |                                    ~~~  ^
   include/linux/spinlock.h:274:53: note: expanded from macro 'raw_spin_lock_irq'
     274 | #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
         |                                                            ^~~~
   kernel/locking/rwsem.c:1707:2: error: call to undeclared function 'rwsem_set_owner'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1707 |         rwsem_set_owner(sem);
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1662 kernel/locking/rwsem.c

  1659	
  1660	static inline void rwsem_clear_upgrade_flag(struct rw_semaphore *sem)
  1661	{
> 1662		atomic_long_andnot(RWSEM_FLAG_UPGRADE_READ, &sem->count);
  1663	}
  1664	
  1665	/*
  1666	 * upgrade read lock to write lock
  1667	 */
  1668	static inline int __upgrade_read(struct rw_semaphore *sem)
  1669	{
  1670		long tmp;
  1671	
  1672		preempt_disable();
  1673	
  1674		tmp = atomic_long_read(&sem->count);
  1675		do {
> 1676			if (tmp & (RWSEM_WRITER_MASK | RWSEM_FLAG_UPGRADE_READ)) {
  1677				preempt_enable();
  1678				return -EBUSY;
  1679			}
  1680		} while (!atomic_long_try_cmpxchg(&sem->count, &tmp,
> 1681			tmp + RWSEM_FLAG_UPGRADE_READ + RWSEM_WRITER_LOCKED - RWSEM_READER_BIAS));
  1682	
> 1683		if ((tmp & RWSEM_READER_MASK) == RWSEM_READER_BIAS) {
  1684			/* fast path */
  1685			DEBUG_RWSEMS_WARN_ON(sem->magic != sem, sem);
  1686			rwsem_clear_upgrade_flag(sem);
> 1687			rwsem_set_owner(sem);
  1688			preempt_enable();
  1689			return 0;
  1690		}
  1691		/* slow path */
> 1692		raw_spin_lock_irq(&sem->wait_lock);
> 1693		rwsem_set_owner_upgrade(sem);
  1694	
  1695		set_current_state(TASK_UNINTERRUPTIBLE);
  1696	
  1697		for (;;) {
  1698			if (!(atomic_long_read(&sem->count) & RWSEM_READER_MASK))
  1699				break;
  1700			raw_spin_unlock_irq(&sem->wait_lock);
  1701			schedule_preempt_disabled();
  1702			set_current_state(TASK_UNINTERRUPTIBLE);
  1703			raw_spin_lock_irq(&sem->wait_lock);
  1704		}
  1705	
  1706		rwsem_clear_upgrade_flag(sem);
  1707		rwsem_set_owner(sem);
  1708		__set_current_state(TASK_RUNNING);
  1709		raw_spin_unlock_irq(&sem->wait_lock);
  1710		preempt_enable();
  1711		return 0;
  1712	}
  1713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
