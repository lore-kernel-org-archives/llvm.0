Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0026E1BC4F;
	Mon, 17 Jun 2024 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718601525; cv=none; b=XiHO23W7SYBC4I1KHw0slil951TUpQW6+DPqOHGRyYcc2GYYwTZhUYvo83oBRu8fQArZsxuHBizjmbxPgZowZ5pp1Vp/shfhWOzark1L9+nejcJq8o1IK81OjodksXzM9sQKT/sqaULhC4r4e6ofdr06ISBPVvNsWZec6Z7TZw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718601525; c=relaxed/simple;
	bh=dqNmKCGW4RKLnspcLEZV+AXUXnHfY22e/SxKquKJBjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X9ye1vrBX5kxx8nWNQTnqY0doZeAPcilbnTiIJYOjY2ROea5BAAgS0dqalUxCmRA1wZvcClppKx7zHMye8fJBHPYnWNT5s2Hi/Os2y9AU4J93mMckXzAReHUbTLe6KLdZ+FxKXLh0h3eW/VmxEB6XOj2yPUikpcspJ97wQInX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7mkyJEl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7mkyJEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718601523; x=1750137523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqNmKCGW4RKLnspcLEZV+AXUXnHfY22e/SxKquKJBjY=;
  b=n7mkyJElP3QXi2eiybaFgaHSzclMBpNfxGrBjIs1BbAaZEFueo1X+yz2
   5C/b+sibDENDoSELAKqvOk3vM0ZFueJY2qR0MVDQQ6/mbSarocfyrDPRc
   H7yCYZ3otAh6eCNjNM+cLeEu5CK5BxqR7LJU2dIheGmjPRM7DzplzIuxw
   q514EVdDWlZI5SrDrDy7G/DLexBVspbyt1t3LDZLsROZavEc7wWWco8ez
   hWSxRackXMwf79Tx8alfAwe9ORb7kStmgZK0aNj7ZXApu3BOOzkadkWTr
   nYUJ2ZAEMIFwbphAGjPsZLdPYttZ5bpgF6QxvX+3xaqMXLYmAwYdPqwz3
   A==;
X-CSE-ConnectionGUID: kEwXpHUSQsqEhEmw1oYDag==
X-CSE-MsgGUID: QWamgHI3Tr6PWPnL8o23PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26045400"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26045400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 22:17:56 -0700
X-CSE-ConnectionGUID: sSwzKq0pQBSft2v7cpX29g==
X-CSE-MsgGUID: gBh68YztRlO5EA68BusajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41019955"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 22:17:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ4ka-0003qI-2d;
	Mon, 17 Jun 2024 05:17:52 +0000
Date: Mon, 17 Jun 2024 13:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 4/10] fs/inode.c:2623:9: error: invalid output size
 for constraint '=a'
Message-ID: <202406171358.yIauGf0w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   0418364991ef20583c19f070a31c0bfd69e6ff2d
commit: 11d2d363e0caf8bdb9191c0c1c5aa6f37207ccbd [4/10] fs: add infrastructure for multigrain timestamps
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240617/202406171358.yIauGf0w-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171358.yIauGf0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171358.yIauGf0w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/inode.c:10:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/inode.c:10:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   fs/inode.c:2127:7: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2127 |                 if ((now | I_CTIME_QUERIED) == ctime) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2133:28: note: uninitialized use occurs here
    2133 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2127:3: note: remove the 'if' if its condition is always true
    2127 |                 if ((now | I_CTIME_QUERIED) == ctime) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2122:6: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2122 |         if (ctime & I_CTIME_QUERIED) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2133:28: note: uninitialized use occurs here
    2133 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2122:2: note: remove the 'if' if its condition is always true
    2122 |         if (ctime & I_CTIME_QUERIED) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2117:6: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2117 |         if (!is_mgtime(inode))
         |             ^~~~~~~~~~~~~~~~~
   fs/inode.c:2133:28: note: uninitialized use occurs here
    2133 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2117:2: note: remove the 'if' if its condition is always false
    2117 |         if (!is_mgtime(inode))
         |         ^~~~~~~~~~~~~~~~~~~~~~
    2118 |                 goto out;
         |                 ~~~~~~~~
   fs/inode.c:2113:2: note: variable 'now_ts' is declared here
    2113 |         struct timespec64 now_ts;
         |         ^
>> fs/inode.c:2623:9: error: invalid output size for constraint '=a'
    2623 |                 old = cmpxchg(&ctime_floor, floor, now);
         |                       ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:95:17: note: expanded from macro '__raw_cmpxchg'
      95 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
>> fs/inode.c:2623:9: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:104:17: note: expanded from macro '__raw_cmpxchg'
     104 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
>> fs/inode.c:2623:9: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:113:17: note: expanded from macro '__raw_cmpxchg'
     113 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
>> fs/inode.c:2623:9: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:122:17: note: expanded from macro '__raw_cmpxchg'
     122 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
   fs/inode.c:2635:8: error: invalid output size for constraint '=a'
    2635 |         now = cmpxchg(&inode->__i_ctime, ctime, sav);
         |               ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:95:17: note: expanded from macro '__raw_cmpxchg'
      95 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
   fs/inode.c:2635:8: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:104:17: note: expanded from macro '__raw_cmpxchg'
     104 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
   fs/inode.c:2635:8: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:113:17: note: expanded from macro '__raw_cmpxchg'
     113 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
   fs/inode.c:2635:8: error: invalid output size for constraint '=a'
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^
   arch/x86/include/asm/cmpxchg.h:149:2: note: expanded from macro 'arch_cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^
   arch/x86/include/asm/cmpxchg.h:134:2: note: expanded from macro '__cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^
   arch/x86/include/asm/cmpxchg.h:122:17: note: expanded from macro '__raw_cmpxchg'
     122 |                              : "=a" (__ret), "+m" (*__ptr)              \
         |                                      ^
   15 warnings and 8 errors generated.


vim +2623 fs/inode.c

  2576	
  2577	/**
  2578	 * inode_set_ctime_current - set the ctime to current_time
  2579	 * @inode: inode
  2580	 *
  2581	 * Set the inode->i_ctime to the current value for the inode. Returns
  2582	 * the current value that was assigned to i_ctime. If this is a not
  2583	 * multigrain inode, then we just set it to whatever the coarse time is.
  2584	 *
  2585	 * If it is multigrain, then we first see if the coarse-grained
  2586	 * timestamp is distinct from what we have. If so, then we'll just use
  2587	 * that. If we have to get a fine-grained timestamp, then do so, and
  2588	 * try to swap it into the floor. We accept the new floor value
  2589	 * regardless of the outcome of the cmpxchg. After that, we try to
  2590	 * swap the new value into __i_ctime. Again, we take the resulting
  2591	 * ctime, regardless of the outcome of the swap.
  2592	 */
  2593	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2594	{
  2595		ktime_t ctime, now, sav, floor = smp_load_acquire(&ctime_floor);
  2596	
  2597		now = coarse_ctime(floor);
  2598	
  2599		/* Just return that if this is not a multigrain fs */
  2600		if (!is_mgtime(inode)) {
  2601			inode->__i_ctime = now;
  2602			goto out;
  2603		}
  2604	
  2605		/*
  2606		 * We only need a fine-grained time if someone has queried it,
  2607		 * and the current coarse grained time isn't later than what's
  2608		 * already there.
  2609		 */
  2610		ctime = smp_load_acquire(&inode->__i_ctime);
  2611		if ((ctime & I_CTIME_QUERIED) && !ktime_after(now, ctime & ~I_CTIME_QUERIED)) {
  2612			ktime_t old;
  2613	
  2614			/* Get a fine-grained time */
  2615			now = ktime_get_real() & ~I_CTIME_QUERIED;
  2616	
  2617			/*
  2618			 * If the cmpxchg works, we take the new floor value. If
  2619			 * not, then that means that someone else changed it after we
  2620			 * fetched it but before we got here. That value is just
  2621			 * as good, so keep it.
  2622			 */
> 2623			old = cmpxchg(&ctime_floor, floor, now);
  2624			trace_ctime_floor_update(inode, floor, now, old);
  2625			if (old != floor)
  2626				now = old;
  2627		}
  2628	
  2629		/*
  2630		 * Swap the ctime into place. If it has changed in the interim,
  2631		 * then we'll just take whatever the current value is under the
  2632		 * assumption that it's new enough.
  2633		 */
  2634		sav = now;
  2635		now = cmpxchg(&inode->__i_ctime, ctime, sav);
  2636		trace_ctime_inode_update(inode, ctime, sav, now);
  2637		if (now == ctime)
  2638			now = sav;
  2639	out:
  2640		return timestamp_truncate(ktime_to_timespec64(now), inode);
  2641	}
  2642	EXPORT_SYMBOL(inode_set_ctime_current);
  2643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
