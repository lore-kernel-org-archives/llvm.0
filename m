Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E92F37;
	Thu,  4 Apr 2024 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712192783; cv=none; b=nCVwf5FNsGiTWp0nXXwbf6rcE04eh1Rb2FxK7vehxKj1lwu37TuHvLy2eYh0Jiq+e7Bu8IiizJ0wVXb5Dpb+D0X/TpbFGfAQ7t5S/KBkvwOXx+V1UOMyzGRitxzL4GxWgr7qe/tsOgT6HwkeI9lXkV3kG4pOWv85IxmNfR2nYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712192783; c=relaxed/simple;
	bh=0GC/Qw8hWRbjNNS1/hj8iSQFATAoxPnNUkI+y/vTRyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8gLD2rNuFEBpQrnVzBx7+Xa5fLf28VYFCgAn1xKbqEtH06cSY0TIkOyUEsw6BYUhf3PBYAeX1CuG0fML5AMEc788YTehDkY6BBUoGdxYmEcsrT+HLCByfGe1Y6X1WW24NIWUtxpgnOWCea8QbcTyzrYNhKBP7RHs9QWDJKkl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkqFTxD9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkqFTxD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712192782; x=1743728782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GC/Qw8hWRbjNNS1/hj8iSQFATAoxPnNUkI+y/vTRyc=;
  b=kkqFTxD9YLJ+TA5sGkZaFx83qIHEEtsCTABmlDeVdUFa66NcOhhXzW7a
   +/WpUgT5nhx10T2CIQiHr4Tgsz2cdreZSiJy/2twg5pVxuo5ZjccRK77y
   nxM0zlJFC97AU0VTVT0ekMZ91bLUXqIH1HTYv2GCllrH0QHRSFk1YDg6W
   u5v44ybnZlYdG/Y8Z1Ozai+eaCQdias3j3DPze5vX1TM18v+g/epUjMY0
   sfrK3hmJIW4iPmZ67jfb9xaIggYhYSRu6hlmOVOTyCxwyH8hl6265OD7P
   6dvDgnNchpBsAFHsVZiEGL9hDJOyMQ3qtnNCPR/bHZt1LfDStPiHQ3z0z
   w==;
X-CSE-ConnectionGUID: QpMG7+JTSf2FDTt8R5Zi3A==
X-CSE-MsgGUID: PJUhBMKgTAGLS3peIxnroA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11231697"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11231697"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:06:21 -0700
X-CSE-ConnectionGUID: UcqdzYGeQO6hDLzLNOYPzw==
X-CSE-MsgGUID: xtsFhUwZRvSoPNR+Tn1uzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56071612"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 18:06:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsBYX-0000QC-0r;
	Thu, 04 Apr 2024 01:06:17 +0000
Date: Thu, 4 Apr 2024 09:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 11/14] kernel/panic.c:757:1: error: use of
 undeclared identifier 'debugfs_attr_read_iter'; did you mean
 'debugfs_attr_read'?
Message-ID: <202404040851.yUb7lBNV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1c5b8f0f389d0dbf8dcba694d17e2915059b8043
commit: e70895a95ab70c8ce8c28b7358dcbe587ce7b834 [11/14] libfs: switch to read iter and add copy helpers
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240404/202404040851.yUb7lBNV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040851.yUb7lBNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040851.yUb7lBNV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/panic.c:15:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
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
>> kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
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
>> kernel/panic.c:757:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
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
>> kernel/panic.c:757:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'int (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'int (struct file *, char *, unsigned int, long long *)') [-Wincompatible-function-pointer-types]
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
>> kernel/panic.c:757:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'int (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'int (*)(struct file *, const char *, unsigned int, long long *)') [-Wincompatible-function-pointer-types]
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
   1 warning and 5 errors generated.


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
