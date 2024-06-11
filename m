Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299364B;
	Tue, 11 Jun 2024 03:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718077570; cv=none; b=gk73cJ9P/2m27tEPwvRolUiI/cCSGw2mEYsM2xGL4PQLbBoONNt1SRV6FLWAy/swIkHDepoimjTCMcfiNvAQDlxgXxIBNKui+TJ6XP1kEKvyzUQtF51FK2e/ZDiU4oM1bTB79Nv7O86fcur9Uzug/owej7zCg3eEJ3OcgxBeb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718077570; c=relaxed/simple;
	bh=98URkCeryqyl7PILu+inE+fjnACYtF+d/8/rR9ZcppE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBeRdmCi7zcHxVYzMo+cz/YoiCd+gaTTolqQOKkFNI1u5X3ILUVaRGoVLbaDeWB7aimdgPrdUrpZXHoVlQqAQyQMJVjq7ciXUtTn+5aKxDzuc+PakJXKn/+J+YgikNM0r8yv1EXr1janLz5+o8bR1IHbOKA7a+H9zmHEehRBxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brUyQs5c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brUyQs5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718077567; x=1749613567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98URkCeryqyl7PILu+inE+fjnACYtF+d/8/rR9ZcppE=;
  b=brUyQs5c7h2soXFbpXavuvOmtQL5rTgIt8ZUnLKl1UvaPXMJuQO5yTM/
   xB9guVNgBKK2Jcx08cjJdHD3unaR/rixtQo0JG12du5fhmaHHs9DNNw4v
   tHkxLNkds74V2Ng4KHLojUWGTpf5kpmMaPhtBMjwGI2AqxjnWHCQzNsby
   +tO24fsfCvhyfS/roqlYrZ0o1t9U+mLOHi99kNtlz+LLylK4oupeSHgdR
   wmHd9+CqM19CxSUYI8pDPoI2aOPJLrKEku6NE20HTYWWhP3gszXwVgj0s
   92um9vBwctQ7cVtlfOUvYYOhhYYktxV3jKCTqMKMYDohOxHDq9nxM0E75
   A==;
X-CSE-ConnectionGUID: CnCnVsDoTqeYizJSyBiELw==
X-CSE-MsgGUID: 2GGIjgiPThWSxSAD2JU34w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26180253"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26180253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 20:46:07 -0700
X-CSE-ConnectionGUID: 3LoKLCOISf+pF56dICFeww==
X-CSE-MsgGUID: Nmgbo9+uSwudMznKYnv0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43853026"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 20:46:04 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGsSQ-0002ma-1f;
	Tue, 11 Jun 2024 03:46:02 +0000
Date: Tue, 11 Jun 2024 11:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 5/11] fs/inode.c:2125:7: warning: variable 'now_ts'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202406111158.hCpXK8pe-lkp@intel.com>
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
commit: 59dbbd533f4e5bd18ca3815ecd51390099914928 [5/11] SQUASH: rework the floor
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406111158.hCpXK8pe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111158.hCpXK8pe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111158.hCpXK8pe-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> fs/inode.c:2125:7: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2125 |                 if ((now | I_CTIME_QUERIED) == ctime) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2131:28: note: uninitialized use occurs here
    2131 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2125:3: note: remove the 'if' if its condition is always true
    2125 |                 if ((now | I_CTIME_QUERIED) == ctime) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2120:6: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2120 |         if (ctime & I_CTIME_QUERIED) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/inode.c:2131:28: note: uninitialized use occurs here
    2131 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2120:2: note: remove the 'if' if its condition is always true
    2120 |         if (ctime & I_CTIME_QUERIED) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/inode.c:2115:6: warning: variable 'now_ts' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2115 |         if (!is_mgtime(inode))
         |             ^~~~~~~~~~~~~~~~~
   fs/inode.c:2131:28: note: uninitialized use occurs here
    2131 |         return timestamp_truncate(now_ts, inode);
         |                                   ^~~~~~
   fs/inode.c:2115:2: note: remove the 'if' if its condition is always false
    2115 |         if (!is_mgtime(inode))
         |         ^~~~~~~~~~~~~~~~~~~~~~
    2116 |                 goto out;
         |                 ~~~~~~~~
   fs/inode.c:2111:2: note: variable 'now_ts' is declared here
    2111 |         struct timespec64 now_ts;
         |         ^
   16 warnings generated.


vim +2125 fs/inode.c

59dbbd533f4e5b Jeff Layton 2024-06-10  2100  
dc882b7e9784e0 Jeff Layton 2023-08-07  2101  /**
59dbbd533f4e5b Jeff Layton 2024-06-10  2102   * current_time - Return FS time (possibly fine-grained)
dc882b7e9784e0 Jeff Layton 2023-08-07  2103   * @inode: inode.
dc882b7e9784e0 Jeff Layton 2023-08-07  2104   *
dc882b7e9784e0 Jeff Layton 2023-08-07  2105   * Return the current time truncated to the time granularity supported by
dc882b7e9784e0 Jeff Layton 2023-08-07  2106   * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
dc882b7e9784e0 Jeff Layton 2023-08-07  2107   * as having been QUERIED, get a fine-grained timestamp.
dc882b7e9784e0 Jeff Layton 2023-08-07  2108   */
59dbbd533f4e5b Jeff Layton 2024-06-10  2109  struct timespec64 current_time(struct inode *inode)
dc882b7e9784e0 Jeff Layton 2023-08-07  2110  {
dc882b7e9784e0 Jeff Layton 2023-08-07  2111  	struct timespec64 now_ts;
59dbbd533f4e5b Jeff Layton 2024-06-10  2112  	ktime_t ctime, floor = READ_ONCE(ctime_floor);
59dbbd533f4e5b Jeff Layton 2024-06-10  2113  	ktime_t now = coarse_ctime(floor);
dc882b7e9784e0 Jeff Layton 2023-08-07  2114  
dc882b7e9784e0 Jeff Layton 2023-08-07 @2115  	if (!is_mgtime(inode))
dc882b7e9784e0 Jeff Layton 2023-08-07  2116  		goto out;
dc882b7e9784e0 Jeff Layton 2023-08-07  2117  
dc882b7e9784e0 Jeff Layton 2023-08-07  2118  	/* If nothing has queried it, then coarse time is fine */
dc882b7e9784e0 Jeff Layton 2023-08-07  2119  	ctime = smp_load_acquire(&inode->__i_ctime);
dc882b7e9784e0 Jeff Layton 2023-08-07  2120  	if (ctime & I_CTIME_QUERIED) {
dc882b7e9784e0 Jeff Layton 2023-08-07  2121  		/*
dc882b7e9784e0 Jeff Layton 2023-08-07  2122  		 * If there is no apparent change, then
dc882b7e9784e0 Jeff Layton 2023-08-07  2123  		 * get a fine-grained timestamp.
dc882b7e9784e0 Jeff Layton 2023-08-07  2124  		 */
dc882b7e9784e0 Jeff Layton 2023-08-07 @2125  		if ((now | I_CTIME_QUERIED) == ctime) {
dc882b7e9784e0 Jeff Layton 2023-08-07  2126  			ktime_get_real_ts64(&now_ts);
dc882b7e9784e0 Jeff Layton 2023-08-07  2127  			now_ts.tv_nsec &= ~I_CTIME_QUERIED;
dc882b7e9784e0 Jeff Layton 2023-08-07  2128  		}
dc882b7e9784e0 Jeff Layton 2023-08-07  2129  	}
dc882b7e9784e0 Jeff Layton 2023-08-07  2130  out:
dc882b7e9784e0 Jeff Layton 2023-08-07  2131  	return timestamp_truncate(now_ts, inode);
dc882b7e9784e0 Jeff Layton 2023-08-07  2132  }
59dbbd533f4e5b Jeff Layton 2024-06-10  2133  EXPORT_SYMBOL(current_time);
dc882b7e9784e0 Jeff Layton 2023-08-07  2134  

:::::: The code at line 2125 was first introduced by commit
:::::: dc882b7e9784e0ce8e003df1aa87468dcdc7da73 fs: add infrastructure for multigrain timestamps

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Jeff Layton <jlayton@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
