Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F519453;
	Thu,  6 Jul 2023 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688658642; x=1720194642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiF3KeVp3UDqE92ZhrZtR8mbeu1qITHICxXZcrK2MDI=;
  b=fZ3pEm3ZPq6AmBVrXH5TLqHiNvSL8f4j4dafxi5dI1hM/d4JOgJTAl9y
   x3zM/5Kg4/25Md8sUKy7c5bjQ2VesOUbPOkJQ6oY5D6oxddN/Ups7hXim
   NuSZHa2/lSGZlqM9KLRZDLkdRog32u3t08ls6S3o6iZdmp03QNGZkbl/8
   tMMERn2Iorg8cpLYMjkFgHA1sxgX7SUN0y++yZgIOmMRQaFJ8WzyxNBea
   Kne3ZBsP6sV2OeaiPo2B3lORZbDndv3w3jeE7hBaHnVepZdBf5A/RX0tU
   29kX0QnlXIVW3518CVEbSrxMuhHa2qG4ESMuNo8Trllq/8jOtERz+ViIQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362507719"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="362507719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 08:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="754805150"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="754805150"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 08:50:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHRFc-0001QO-2C;
	Thu, 06 Jul 2023 15:50:36 +0000
Date: Thu, 6 Jul 2023 23:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 95/101] fs/inode.c:2560:19: error: redefinition of
 'current_time'
Message-ID: <202307062327.K3TU63wX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   8f9d94d69805b4abc24e544ae75e69993a62b76f
commit: 1a4d24a00a8bdb3d5d105e01c6ab83f5a16f6657 [95/101] fs: add infrastructure for multigrain inode i_m/ctime
config: hexagon-randconfig-r013-20230706 (https://download.01.org/0day-ci/archive/20230706/202307062327.K3TU63wX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062327.K3TU63wX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062327.K3TU63wX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/inode.c:10:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/inode.c:2560:19: error: redefinition of 'current_time'
    2560 | struct timespec64 current_time(struct inode *inode)
         |                   ^
   fs/inode.c:2117:19: note: previous definition is here
    2117 | struct timespec64 current_time(struct inode *inode)
         |                   ^
   6 warnings and 1 error generated.


vim +/current_time +2560 fs/inode.c

50e17c000c467f Deepa Dinamani 2018-01-21  2549  
3cd886666ff19e Deepa Dinamani 2016-09-14  2550  /**
3cd886666ff19e Deepa Dinamani 2016-09-14  2551   * current_time - Return FS time
3cd886666ff19e Deepa Dinamani 2016-09-14  2552   * @inode: inode.
3cd886666ff19e Deepa Dinamani 2016-09-14  2553   *
3cd886666ff19e Deepa Dinamani 2016-09-14  2554   * Return the current time truncated to the time granularity supported by
3cd886666ff19e Deepa Dinamani 2016-09-14  2555   * the fs.
3cd886666ff19e Deepa Dinamani 2016-09-14  2556   *
3cd886666ff19e Deepa Dinamani 2016-09-14  2557   * Note that inode and inode->sb cannot be NULL.
3cd886666ff19e Deepa Dinamani 2016-09-14  2558   * Otherwise, the function warns and returns time without truncation.
3cd886666ff19e Deepa Dinamani 2016-09-14  2559   */
95582b00838837 Deepa Dinamani 2018-05-08 @2560  struct timespec64 current_time(struct inode *inode)
3cd886666ff19e Deepa Dinamani 2016-09-14  2561  {
d651d1607f22fd Arnd Bergmann  2018-12-05  2562  	struct timespec64 now;
d651d1607f22fd Arnd Bergmann  2018-12-05  2563  
d651d1607f22fd Arnd Bergmann  2018-12-05  2564  	ktime_get_coarse_real_ts64(&now);
3cd886666ff19e Deepa Dinamani 2016-09-14  2565  
3cd886666ff19e Deepa Dinamani 2016-09-14  2566  	if (unlikely(!inode->i_sb)) {
3cd886666ff19e Deepa Dinamani 2016-09-14  2567  		WARN(1, "current_time() called with uninitialized super_block in the inode");
3cd886666ff19e Deepa Dinamani 2016-09-14  2568  		return now;
3cd886666ff19e Deepa Dinamani 2016-09-14  2569  	}
3cd886666ff19e Deepa Dinamani 2016-09-14  2570  
50e17c000c467f Deepa Dinamani 2018-01-21  2571  	return timestamp_truncate(now, inode);
3cd886666ff19e Deepa Dinamani 2016-09-14  2572  }
3cd886666ff19e Deepa Dinamani 2016-09-14  2573  EXPORT_SYMBOL(current_time);
2b3416ceff5e6b Yang Xu        2022-07-14  2574  

:::::: The code at line 2560 was first introduced by commit
:::::: 95582b00838837fc07e042979320caf917ce3fe6 vfs: change inode times to use struct timespec64

:::::: TO: Deepa Dinamani <deepa.kernel@gmail.com>
:::::: CC: Deepa Dinamani <deepa.kernel@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
