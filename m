Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668A812A17F;
	Tue, 23 Jan 2024 00:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968798; cv=none; b=mhap43W5e69Ywo/iTtz4D6iyTdOb+6CmJZJjjfG3TkmEz8urCKmPc3jRfcCVeC3d/aId/H23EBDqCkvNDfKQ27t8Th2NuncJv6zcJs6aNzd6NhCuBkdA9P2dpaAsxdPCuBK0nKLvH1Q5GRIsdTDrsaYpkr74Dg7ay8sAS5yao/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968798; c=relaxed/simple;
	bh=LmmMrDXqgps9gOW6XRF0ppgcTlve6gknBdpHOqHkSvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQ07+FVYWK6t7LubFCBWuTgHtFWekb+12lsQK2SlGdF0v8dT+StUGMqV6o3K9s9sUeL0PqgJeNhEaEvKIhVJCyLx587/6J9pljd9FbT2R4m6NETV3mepj5JL8wcFb25MpFE86AT7SOtitokBe8tAdg9+elLgBFNDDqvjfkrIjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G77jeskz; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G77jeskz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705968796; x=1737504796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmmMrDXqgps9gOW6XRF0ppgcTlve6gknBdpHOqHkSvk=;
  b=G77jeskz3jw/lpc7r/Gd79efGDS5SbdaZmeWxDT/o0sZ0KjwQ7A1OWjL
   uXNdPLJGq7sb409oAs/oxX5XkZBdSGs/DuOaxYRJ6zJ6H50RYeDwyxjUj
   S2+Z0BtNPj4eEWfzvX6RXNNxVQ9G9ix6JGewMtXRZ/87W3ItS3RxuDahA
   tEbLWHE9rqJdTjZpH/qeFPIaaVAly8knBCZtsdvUd/xYJYATWWMEFlA2D
   Ai0hlTayMFrf01p82dgG+/QYtsk80C0QcMLNBEAfR+afALefBvBWC3Wy1
   2kEbLq3dNofy/beFYcFcH76IWLCPqVnxgZmD2sT9KLOxYHjx2ZSA3rinD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400224276"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="400224276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 16:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1473904"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 16:13:14 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS4Pf-00070M-2y;
	Tue, 23 Jan 2024 00:13:11 +0000
Date: Tue, 23 Jan 2024 08:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Baokun Li <libaokun1@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error: call
 to '__compiletime_assert_207' declared with 'error' attribute: Need native
 word sized stores/loads for atomicity.
Message-ID: <202401230837.TXro0PHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   297983dc9011461cba6278bfe03f4305c4a2caa0
commit: 4bbd51d0f0ad709c0f02c100439d6c9ba6811d4b [12/13] fs: make the i_size_read/write helpers be smp_load_acquire/store_release()
config: i386-randconfig-015-20240123 (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230837.TXro0PHi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/netfs/buffered_read.c:10:
   In file included from fs/netfs/internal.h:9:
   In file included from include/linux/seq_file.h:12:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     911 |         return smp_load_acquire(&inode->i_size);
         |                ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:38:1: note: expanded from here
      38 | __compiletime_assert_207
         | ^
   1 error generated.
--
   In file included from fs/netfs/buffered_write.c:9:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     911 |         return smp_load_acquire(&inode->i_size);
         |                ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:253:1: note: expanded from here
     253 | __compiletime_assert_207
         | ^
   In file included from fs/netfs/buffered_write.c:9:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:253:1: note: expanded from here
     253 | __compiletime_assert_207
         | ^
   In file included from fs/netfs/buffered_write.c:9:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:253:1: note: expanded from here
     253 | __compiletime_assert_207
         | ^
   In file included from fs/netfs/buffered_write.c:9:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:253:1: note: expanded from here
     253 | __compiletime_assert_207
         | ^
   4 errors generated.
--
   In file included from fs/netfs/misc.c:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     911 |         return smp_load_acquire(&inode->i_size);
         |                ^
   include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
     206 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
     438 |         compiletime_assert(__native_word(t),                            \
         |         ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:251:1: note: expanded from here
     251 | __compiletime_assert_207
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +911 include/linux/fs.h

   874	
   875	void filemap_invalidate_lock_two(struct address_space *mapping1,
   876					 struct address_space *mapping2);
   877	void filemap_invalidate_unlock_two(struct address_space *mapping1,
   878					   struct address_space *mapping2);
   879	
   880	
   881	/*
   882	 * NOTE: in a 32bit arch with a preemptable kernel and
   883	 * an UP compile the i_size_read/write must be atomic
   884	 * with respect to the local cpu (unlike with preempt disabled),
   885	 * but they don't need to be atomic with respect to other cpus like in
   886	 * true SMP (so they need either to either locally disable irq around
   887	 * the read or for example on x86 they can be still implemented as a
   888	 * cmpxchg8b without the need of the lock prefix). For SMP compiles
   889	 * and 64bit archs it makes no difference if preempt is enabled or not.
   890	 */
   891	static inline loff_t i_size_read(const struct inode *inode)
   892	{
   893	#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
   894		loff_t i_size;
   895		unsigned int seq;
   896	
   897		do {
   898			seq = read_seqcount_begin(&inode->i_size_seqcount);
   899			i_size = inode->i_size;
   900		} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
   901		return i_size;
   902	#elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
   903		loff_t i_size;
   904	
   905		preempt_disable();
   906		i_size = inode->i_size;
   907		preempt_enable();
   908		return i_size;
   909	#else
   910		/* Pairs with smp_store_release() in i_size_write() */
 > 911		return smp_load_acquire(&inode->i_size);
   912	#endif
   913	}
   914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
