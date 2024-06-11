Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5A8C04;
	Tue, 11 Jun 2024 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718083436; cv=none; b=GwLWwN18o3DjmTRItDe9XNJL0SH4cq9LtCahbWfUYvJWqPLmLWmFNJlx4giluXR6QhnMIMjPpaXpqDNC3zGPhhlk5HNtGj9nY+DinRfTiVy8F0FKtf4rvGaVvUZUtentf+h9AMWdTFMSdXiKKWihyPepqq4EpzgZfE9FkGwiul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718083436; c=relaxed/simple;
	bh=Iyk5paYUZG9gt3j9n3UR0pIFY3ic/iw2UpKQhwyPMm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srOKJNqBUSg+nrQu93PbxC2LAXdoO3qBK9Xrn4vb4kz7CRyiN7Pv8BrhPdJNJtQA6dCVzPdaEVnNUs1zRBEyiKLxDc2uagpYFFrIlcISAlhi79Q3EnUHc1R2g9AAyVPikr5R90tM9yDl3Zvy5X3HBQffSnb1bom83GEIzDVk3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+HdqtUH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+HdqtUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718083435; x=1749619435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iyk5paYUZG9gt3j9n3UR0pIFY3ic/iw2UpKQhwyPMm4=;
  b=Z+HdqtUHaabqdbjeYRBt2+YepHOnAfcuhZYLenFPvk1E18TXpysFTRNE
   z2aETClV4IhlbTdYZkeORaoSJgJaviIjc6ZtRjgWs5gKpdAV6y4/Ycls5
   YmJlvZ08ApDZwn1qtWrsiRv1yx6+iWI4QT8pInaEciJJ3ZMwzb9dspInC
   v90UVYdvVYUMRTKvId7A5sCTYdVnLoX/RrhsnHz2VW3bSVO25/cau9PSb
   Fij8uAZC1jasBE0CMsoWGFi6VWEiHLQcxqqdpW61ab98nHOhQUTWi5RT+
   z+eXeaGyFcyxDp6Psfa7zqAWOt1MIcd/QCuyOlOBKfjeRHh7KVf0JGHbZ
   w==;
X-CSE-ConnectionGUID: mtuXDR81S/ajgPu/vQvjuw==
X-CSE-MsgGUID: 5Y1eGqiORC+omkySjzGRjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="37295152"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="37295152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 22:23:52 -0700
X-CSE-ConnectionGUID: aMPBUeC7RPu/xlQIfIdJ1g==
X-CSE-MsgGUID: R0lsKXBeR4O13aIWA5p+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39206935"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2024 22:23:50 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGtz2-00004a-0a;
	Tue, 11 Jun 2024 05:23:48 +0000
Date: Tue, 11 Jun 2024 13:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 7/11] fs/inode.c:2618:35: error: incompatible
 integer to pointer conversion passing 'ktime_t' (aka 'long long') to
 parameter of type 'ktime_t *' (aka 'long long *'); take the address with &
Message-ID: <202406111332.045vFl25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   be51a9b4d34b1383cf39064988562665bed1b954
commit: 748dc0feb518a69ac526fedfc5436478d68320d3 [7/11] fs: add tracepoints around multigrain timestamp changes
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406111332.045vFl25-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111332.045vFl25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111332.045vFl25-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/inode.c:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/inode.c:15:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
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
>> fs/inode.c:2618:35: error: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                 ^~~~~
         |                                                 &
   include/trace/events/timestamp.h:13:13: note: passing argument to parameter 'old' here
      13 |                  ktime_t *old,
         |                           ^
   fs/inode.c:2618:42: error: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                        ^~~
         |                                                        &
   include/trace/events/timestamp.h:14:13: note: passing argument to parameter 'new' here
      14 |                  ktime_t *new,
         |                           ^
   fs/inode.c:2618:47: error: incompatible integer to pointer conversion passing 'ktime_t' (aka 'long long') to parameter of type 'ktime_t *' (aka 'long long *'); take the address with & [-Wint-conversion]
    2618 |                 trace_ctime_floor_update(inode, floor, now, old);
         |                                                             ^~~
         |                                                             &
   include/trace/events/timestamp.h:15:13: note: passing argument to parameter 'cur' here
      15 |                  ktime_t *cur),
         |                           ^
>> fs/inode.c:2630:49: error: too few arguments to function call, expected 6, have 4
    2630 |         trace_ctime_inode_update(inode, ctime, sav, now);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                       ^
   include/trace/events/timestamp.h:47:1: note: 'trace_ctime_inode_update' declared here
      47 | TRACE_EVENT(ctime_inode_update,
         | ^
      48 |         TP_PROTO(struct inode *inode,
         |                  ~~~~~~~~~~~~~~~~~~~~
      49 |                  ktime_t old,
         |                  ~~~~~~~~~~~~
      50 |                  ktime_t new,
         |                  ~~~~~~~~~~~~
      51 |                  ktime_t cur,
         |                  ~~~~~~~~~~~~
      52 |                  ktime_t coarse,
         |                  ~~~~~~~~~~~~~~~
      53 |                  ktime_t floor),
         |                  ~~~~~~~~~~~~~
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^                          ~~~~~
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^                            ~~~~~
   include/linux/tracepoint.h:357:21: note: expanded from macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                            ^            ~~~~~
   <scratch space>:86:1: note: expanded from here
      86 | trace_ctime_inode_update
         | ^
   16 warnings and 4 errors generated.


vim +2618 fs/inode.c

  2573	
  2574	/**
  2575	 * inode_set_ctime_current - set the ctime to current_time
  2576	 * @inode: inode
  2577	 *
  2578	 * Set the inode->i_ctime to the current value for the inode. Returns
  2579	 * the current value that was assigned to i_ctime. If this is a not
  2580	 * multigrain inode, then we just set it to whatever the coarse time is.
  2581	 *
  2582	 * If it is multigrain, then we first see if the coarse-grained
  2583	 * timestamp is distinct from what we have. If so, then we'll just use
  2584	 * that. If we have to get a fine-grained timestamp, then do so, and
  2585	 * try to swap it into the floor. We accept the new floor value
  2586	 * regardless of the outcome of the cmpxchg. After that, we try to
  2587	 * swap the new value into __i_ctime. Again, we take the resulting
  2588	 * ctime, regardless of the outcome of the swap.
  2589	 */
  2590	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2591	{
  2592		ktime_t ctime, now, sav, floor = smp_load_acquire(&ctime_floor);
  2593	
  2594		now = coarse_ctime(floor);
  2595	
  2596		/* Just return that if this is not a multigrain fs */
  2597		if (!is_mgtime(inode)) {
  2598			inode->__i_ctime = now;
  2599			goto out;
  2600		}
  2601	
  2602		/*
  2603		 * We only need a fine-grained time if someone has queried it,
  2604		 * and the current coarse grained time isn't later than what's
  2605		 * already there.
  2606		 */
  2607		ctime = smp_load_acquire(&inode->__i_ctime);
  2608		if ((ctime & I_CTIME_QUERIED) && !ktime_after(now, ctime & ~I_CTIME_QUERIED)) {
  2609			ktime_t old, now = ktime_get_real() & ~I_CTIME_QUERIED;
  2610	
  2611			/*
  2612			 * If the cmpxchg works, we take the new floor value. If
  2613			 * not, then that means that someone else changed it after we
  2614			 * fetched it but before we got here. That value is just
  2615			 * as good, so keep it.
  2616			 */
  2617			old = cmpxchg(&ctime_floor, floor, now);
> 2618			trace_ctime_floor_update(inode, floor, now, old);
  2619			if (old != floor)
  2620				now = old;
  2621		}
  2622	
  2623		/*
  2624		 * Swap the ctime into place. If it has changed in the interim,
  2625		 * then we'll just take whatever the current value is under the
  2626		 * assumption that it's new enough.
  2627		 */
  2628		sav = now;
  2629		now = cmpxchg(&inode->__i_ctime, ctime, sav);
> 2630		trace_ctime_inode_update(inode, ctime, sav, now);
  2631		if (now == ctime)
  2632			now = sav;
  2633	out:
  2634		return timestamp_truncate(ktime_to_timespec64(now), inode);
  2635	}
  2636	EXPORT_SYMBOL(inode_set_ctime_current);
  2637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
