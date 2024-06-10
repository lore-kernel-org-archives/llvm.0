Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369EC1514F3;
	Mon, 10 Jun 2024 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060861; cv=none; b=XN6QjiAQkOsRPzobBCT7cJuqZWGgUwaYf4dTJy7xzbiN4Et/CiPB+YX60KZHkSsNZ+LyULzzEx/YnuxFwjYzzbDJZ3IplDrTp8LbNyQD4zO5u7T9zkFxwwa+jnyOhOent0jsAzKyj1tvS4iiKfLPS3qbvKCVvxP3TqX3SZjGpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060861; c=relaxed/simple;
	bh=77N9SiSohnJLZj6kD0Vt+Rh20SRq0gCY/wDkeI8yz4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjgJyv7TUjG+PeEqr+QVpjjQkmqoW2Cif/k7YDr80UQUbZVEQd9dD8X/8S3PoWTHY/HFogfcmvF17VaWwTTq5FTXqhCLGfek5SAQbB8hEIH6280vbj3nhIUyGImWnvoYSdjVlsWxKZO1U/1uvDyml8DGqEqzU1lm5lw4m8A+krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqJ+MaGC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqJ+MaGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718060858; x=1749596858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77N9SiSohnJLZj6kD0Vt+Rh20SRq0gCY/wDkeI8yz4Q=;
  b=KqJ+MaGCjZrrRlTBLcg4O3ZySclaQlq80cHbBqztuOMFcKB4qeL9AWdS
   6uNewa9FYl9zVvbo8wiiyl2xB0qsaXqGReWsTLp3jYV3aTPIOGGRPIxHy
   QkcUfoS5tM2gzbnJLt3T0X3aAOQgt47IpvxhnBEheznZ26dAKnd028rx6
   7Bqc9h749Be4jzbOPsHyZKL01oVj3V7uYmT0Qe2I4EW+zidSaX4UrbjyJ
   2nUlmo+L8U1PCE7f9fgkiLkQWSIDpxgqEVzeiUkadjUMmNhBFjdr9iwmj
   HoriOgLynIBJN45zPgSq3s+Vh6SmIUkgmMphrGiYwoVi2Mgibrtru6vjG
   g==;
X-CSE-ConnectionGUID: TXlgjkRfS3C0g+16SuPSGQ==
X-CSE-MsgGUID: TCoJXfCgTlaDwGDAYW9i2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14472013"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14472013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 16:07:38 -0700
X-CSE-ConnectionGUID: W6Sr6ZGOQ5aN51dTBf407w==
X-CSE-MsgGUID: s99FDZPzSn+igl7x5bUAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39057888"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2024 16:07:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGo6w-0002Z9-1p;
	Mon, 10 Jun 2024 23:07:34 +0000
Date: Tue, 11 Jun 2024 07:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix2 39/51] kernel/signal.c:3413:9: error: no
 member named 'su_sys_privptr' in 'struct kernel_siginfo'
Message-ID: <202406110600.LnvcB0VZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix2
head:   a4a0ffeb374e0ecc63c2ed15c2dbb191ddcb0744
commit: 32c975fa86f74632844c21efea82d3b30f356c61 [39/51] signal: Add sys_private_ptr to siginfo::_sifields::_timer
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110600.LnvcB0VZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110600.LnvcB0VZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110600.LnvcB0VZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/signal.c:25:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/signal.c:27:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from kernel/signal.c:27:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from kernel/signal.c:27:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
>> kernel/signal.c:3413:9: error: no member named 'su_sys_privptr' in 'struct kernel_siginfo'
    3413 |                 info->su_sys_privptr = NULL;
         |                 ~~~~  ^
   13 warnings and 1 error generated.


vim +3413 kernel/signal.c

  3402	
  3403	static int post_copy_siginfo_from_user(kernel_siginfo_t *info,
  3404					       const siginfo_t __user *from)
  3405	{
  3406		/*
  3407		 * Clear the si_sys_priv* fields for timer signals as that's the
  3408		 * indicator for rearming a posix timer. User space submitted
  3409		 * signals are not allowed to inject that.
  3410		 */
  3411		if (info->si_code == SI_TIMER) {
  3412			info->si_sys_private = 0;
> 3413			info->su_sys_privptr = NULL;
  3414		}
  3415	
  3416		if (unlikely(!known_siginfo_layout(info->si_signo, info->si_code))) {
  3417			char __user *expansion = si_expansion(from);
  3418			char buf[SI_EXPANSION_SIZE];
  3419			int i;
  3420			/*
  3421			 * An unknown si_code might need more than
  3422			 * sizeof(struct kernel_siginfo) bytes.  Verify all of the
  3423			 * extra bytes are 0.  This guarantees copy_siginfo_to_user
  3424			 * will return this data to userspace exactly.
  3425			 */
  3426			if (copy_from_user(&buf, expansion, SI_EXPANSION_SIZE))
  3427				return -EFAULT;
  3428			for (i = 0; i < SI_EXPANSION_SIZE; i++) {
  3429				if (buf[i] != 0)
  3430					return -E2BIG;
  3431			}
  3432		}
  3433		return 0;
  3434	}
  3435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
