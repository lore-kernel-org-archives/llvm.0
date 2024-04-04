Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855A5C89;
	Thu,  4 Apr 2024 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712194766; cv=none; b=oNo8h6JzqhX7G8KiqGeIlJiFdO+1Z2QDzkHz7fTL97ni1zco1k7t3javK287202wbpHrGOo4XoxvVngnDBGxYeQtRS+BfcnTgGXV8ebUkb5ITI/1fufUJAV3MANYFQ9DLSe8Keh5PWNBjscn4yl41DHzxjh3vA83/HG6TsqFMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712194766; c=relaxed/simple;
	bh=MixS7in2mkT8c1l8CaRWTGi44k619b8ngiKk9On/vmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYDj36zykyMUjmVzJzdLiABVR5cNmRPKg/+mIQWAWgg21LjnOQ32t2cS3ZI2GMFQRZHuVOFNdCjNEaMRcq1Q1EoW+Thx8F1WGgAkEs01jAYNhxxDRGTHwdDAHdshtMOILYDW7yw3UQ/EronEBWFFOEZNs8rBrK8kR2iJgn6DyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3aT4She; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3aT4She"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712194765; x=1743730765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MixS7in2mkT8c1l8CaRWTGi44k619b8ngiKk9On/vmM=;
  b=c3aT4She3DAZy0r0yzhbOYDMinqc1wrjeDj/iUFLFRBA0jZgVTwRYRWJ
   hfkNnJh+XxzW3+UHsJTcFPzLrlGKdEWYtxyCS7tN93kvUFP2WxsIghS+c
   uoEfg2Uxs9HviAoPe9U14VCt8v5hfxUNG9V7FcWhUnDcUnphQMXzBxhFZ
   cVGgYCyn2zjPqHAL0WcroCxSQeozqtZq4jdIbmciOOHxomEorjY0WEANW
   e8eHehCnO+tOaLgoIG1leocPPocN6KSsGtPFggsEp/ebkiuV50B1MkWrn
   qQbz3xKjMcESTB1SlHbA42a1kNN7DVzUf0+YWW6JxMGqYx0k8IoiIGZ6q
   A==;
X-CSE-ConnectionGUID: 5yOTmeHqSv6Xx5ktpn4inA==
X-CSE-MsgGUID: YqtLD3YCS7Ws+ogDjyz1oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10426910"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10426910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:39:22 -0700
X-CSE-ConnectionGUID: /yjUzED8R2aDj23eKJ0+MA==
X-CSE-MsgGUID: XxCiVqy4QHyHcqhW6xXR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23380975"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 18:39:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsC4U-0000Rw-0I;
	Thu, 04 Apr 2024 01:39:18 +0000
Date: Thu, 4 Apr 2024 09:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 11/14] kernel/panic.c:757:1: error:
 incompatible function pointer types initializing 'ssize_t (*)(struct kiocb
 *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)')
 with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t
 *...
Message-ID: <202404040949.Oar7h3b6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e8fd62fac9e105d05cfda66070e98a3a255e1a0
commit: e70895a95ab70c8ce8c28b7358dcbe587ce7b834 [11/14] libfs: switch to read iter and add copy helpers
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240404/202404040949.Oar7h3b6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040949.Oar7h3b6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040949.Oar7h3b6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/panic.c:19:
   In file included from include/linux/vt_kern.h:12:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/panic.c:19:
   In file included from include/linux/vt_kern.h:12:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
   kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
     757 | DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
         | ^
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^
   include/linux/debugfs.h:271:23: note: 'debugfs_attr_read' declared here
     271 | static inline ssize_t debugfs_attr_read(struct file *file, char __user *buf,
         |                       ^
   kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
     757 | DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
         | ^
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:31: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                      ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
   kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
     757 | DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
         | ^
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:64: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                                                       ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
>> kernel/panic.c:757:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     757 | DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     758 |                          "%lld\n");
         |                          ~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/panic.c:757:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     757 | DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     758 |                          "%lld\n");
         |                          ~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 5 errors generated.


vim +757 kernel/panic.c

b1fca27d384e84 Andi Kleen 2017-11-17  756  
4169680e9f7cdb YueHaibing 2019-03-07 @757  DEFINE_DEBUGFS_ATTRIBUTE(clear_warn_once_fops, NULL, clear_warn_once_set,
b1fca27d384e84 Andi Kleen 2017-11-17  758  			 "%lld\n");
b1fca27d384e84 Andi Kleen 2017-11-17  759  

:::::: The code at line 757 was first introduced by commit
:::::: 4169680e9f7cdbf893f8885611b3235aeda94224 kernel/panic.c: taint: fix debugfs_simple_attr.cocci warnings

:::::: TO: YueHaibing <yuehaibing@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
