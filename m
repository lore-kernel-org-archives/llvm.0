Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727377F498;
	Wed, 31 Jan 2024 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706708185; cv=none; b=RGD3Hr49PAdTbRz4E9AHeOHxtCuNqeGdHgMpN07dIpjvyrlARda16l5jjTiARB+19VbgD4xs2rnfPLqM+TEuaOZmqht87ikvsrv+w8no4QNiKYDZ9cNkSIS03IL5H0C6A+166EupiMOxm7A6U0BQnJzrWi72Os2Eyzw+oaYr6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706708185; c=relaxed/simple;
	bh=RHRg3W4m/A8IW94dB8Cafoagd16nWVjEP2V606vfc6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVOmFglAgfDKmBtehhYkBUxNG6DXIkKEgxWoo1lB/nCT6dDBuxQnIXNWbTvI5nXj1iaxQID1yr+63d7/7xlKkZ85Gjm2ouBRZvCUatGnSIhp+lWz+EeizkDDxhqnpnRulzA9vV8aA2iydSyXGWXf+JHPUYavmLT7InUkQQfUeWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxgc1BTg; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxgc1BTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706708183; x=1738244183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHRg3W4m/A8IW94dB8Cafoagd16nWVjEP2V606vfc6k=;
  b=Mxgc1BTgxQmZRe7QYyQyTfrr8WDpwcLx2VdbR/U6Zv9HCdcs/bGeKnFk
   7dxQcL4ZDybWVrrBQ5aBuXhfrafc7yXlUiTw7un4FG+kpksM5K0ON7w8Z
   HNBT/Y7KLIBss/u7fWAwYZGJBdlc41Ch0wDXBqw/jVRg1iiAu/bQ35V20
   pPwk5mIsM6mYg3ekOhRLDU75FRUkwQBwfx5gc5BO6VgrKlv3lNiFgCVRh
   iIcfEVskaFlPeHJa/wpqkLnTaSpAmQnuDo8egtabNGoCMdDIjsz29zOlI
   sQSjjaxloHODcYJepXun0n1KhJDEvvtJP+1kihW2xalYFiEoJ9aw/32Dj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434775445"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="434775445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 05:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36869944"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 05:36:19 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVAlD-0001bY-0Y;
	Wed, 31 Jan 2024 13:36:15 +0000
Date: Wed, 31 Jan 2024 21:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:flsplit3 24/46] fs/locks.c:854:20: error: incompatible
 pointer types passing 'struct file_lock_core *' to parameter of type 'struct
 file_lock *'
Message-ID: <202401312131.5WAt9FDJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git flsplit3
head:   7b201bdd5fd1c026a0981f12d494c9dde47e54d6
commit: d948928b8f833a1b4fcf0aadc722616aabec7271 [24/46] filelock: convert __locks_insert_block, conflict and deadlock checks to use file_lock_core
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401312131.5WAt9FDJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401312131.5WAt9FDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401312131.5WAt9FDJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/locks.c:59:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/locks.c:59:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/locks.c:59:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/locks.c:854:20: error: incompatible pointer types passing 'struct file_lock_core *' to parameter of type 'struct file_lock *' [-Werror,-Wincompatible-pointer-types]
     854 |         if (lock_is_write(sys_fl))
         |                           ^~~~~~
   include/linux/filelock.h:181:52: note: passing argument to parameter 'fl' here
     181 | static inline bool lock_is_write(struct file_lock *fl)
         |                                                    ^
   fs/locks.c:856:20: error: incompatible pointer types passing 'struct file_lock_core *' to parameter of type 'struct file_lock *' [-Werror,-Wincompatible-pointer-types]
     856 |         if (lock_is_write(caller_fl))
         |                           ^~~~~~~~~
   include/linux/filelock.h:181:52: note: passing argument to parameter 'fl' here
     181 | static inline bool lock_is_write(struct file_lock *fl)
         |                                                    ^
   12 warnings and 2 errors generated.


vim +854 fs/locks.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  847  
^1da177e4c3f41 Linus Torvalds 2005-04-16  848  /* Determine if lock sys_fl blocks lock caller_fl. Common functionality
^1da177e4c3f41 Linus Torvalds 2005-04-16  849   * checks for shared/exclusive status of overlapping locks.
^1da177e4c3f41 Linus Torvalds 2005-04-16  850   */
d948928b8f833a Jeff Layton    2024-01-10  851  static bool locks_conflict(struct file_lock_core *caller_fl,
d948928b8f833a Jeff Layton    2024-01-10  852  			   struct file_lock_core *sys_fl)
^1da177e4c3f41 Linus Torvalds 2005-04-16  853  {
71da64e67d8074 Jeff Layton    2024-01-30 @854  	if (lock_is_write(sys_fl))
c0e15908979d26 NeilBrown      2018-11-30  855  		return true;
71da64e67d8074 Jeff Layton    2024-01-30  856  	if (lock_is_write(caller_fl))
c0e15908979d26 NeilBrown      2018-11-30  857  		return true;
c0e15908979d26 NeilBrown      2018-11-30  858  	return false;
^1da177e4c3f41 Linus Torvalds 2005-04-16  859  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  860  

:::::: The code at line 854 was first introduced by commit
:::::: 71da64e67d8074520462a1bcdd7965afc82ba692 filelock: add file_lock type comparison helpers

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Jeff Layton <jlayton@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
