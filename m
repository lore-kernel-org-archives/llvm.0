Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831E4E1BC;
	Sat,  6 Apr 2024 23:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712445657; cv=none; b=diRMDy2MDM9OTmKd23EdZz0RlruBm00H7gpCeh3wrZCGeUdsR2kQAKSKinIir3T1VtWgxa+lGU8pN1l2EPkWvaCWRqwqq182mGCX9MNQ9hp2OegZt4UH6iaacPQEmM2249htSkZ/7WeYYKKoTwOSOhbkTZz85EpNSXdoMsbVhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712445657; c=relaxed/simple;
	bh=P8vUFA5vjSy7BTRrLgiVzjR/Xcoa7aOmYkB2kbDF/wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXa1AUwHOPxhx53ggPIkpx/rCGY9n2/7N14F4gNpJufhEXENTDi+3gax0I+3h3MIMQ27BTX51OghKpDN2qvj3nWop3XpZOi+4k2i33i8lfH6qTeUOwEk/PfHbdugdRV4I24UAFfW7/2W+MoWyXjC7I1wiATUQGumE//dhb41Bao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djhtn8PN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djhtn8PN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712445655; x=1743981655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8vUFA5vjSy7BTRrLgiVzjR/Xcoa7aOmYkB2kbDF/wE=;
  b=Djhtn8PNUHUpTMumdnfnPF1SKNTHFqg08nqK6frSHDO+pSwejUjfx9gW
   nNKdWmqD4YBcS+KCmWszcJ8hesk7mCYBXab3VVug0im6jZpgscwq0rWUK
   s4mtlTW1ebHCqeIlI2CXib8Zb+xVa9WXySmevGMwSvDrp3cMM27RWyNJF
   uP6CibzxjAkTUe3nXnzrUKeLf/n/vZvo0IfcLxXot9qJCKqZkHLuIMXCx
   BzwFtx9n1A5E4KK4tiJeaix2mRkb9vu19Z79R25XR2Pf9+jMW1k3NVeC4
   4hu5dEffI2zV2T8X6b5RBDB41jBZg9LOb/Iz/cp2pqEjwoSYshDTHzjRE
   Q==;
X-CSE-ConnectionGUID: EF4G23S8Rc+w5kHadNoxIA==
X-CSE-MsgGUID: AiFHVpudQDuAVde2T4ampA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="10720439"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="10720439"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 16:20:54 -0700
X-CSE-ConnectionGUID: BPdPr+PPTn25OVnEQIhtGQ==
X-CSE-MsgGUID: mTePqGlLT2OZINFtOHIzsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="24180541"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2024 16:20:53 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtFL8-0003xe-1D;
	Sat, 06 Apr 2024 23:20:50 +0000
Date: Sun, 7 Apr 2024 07:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 10/133] mm/hwpoison-inject.c:63:1: error: use
 of undeclared identifier 'debugfs_attr_read_iter'; did you mean
 'debugfs_attr_read'?
Message-ID: <202404070742.qmfvDpAw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: c8683d55c177756d4a8bcffdd3dc2271e61405c1 [10/133] libfs: switch to read iter and add copy helpers
config: x86_64-buildonly-randconfig-004-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070742.qmfvDpAw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070742.qmfvDpAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070742.qmfvDpAw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hwpoison-inject.c:63:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
      63 | DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
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
>> mm/hwpoison-inject.c:63:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
      63 | DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
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
>> mm/hwpoison-inject.c:63:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
      63 | DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
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
>> mm/hwpoison-inject.c:63:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      63 | DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   mm/hwpoison-inject.c:63:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      63 | DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hwpoison-inject.c:64:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
      64 | DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
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
   mm/hwpoison-inject.c:64:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
      64 | DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
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
   mm/hwpoison-inject.c:64:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
      64 | DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
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
   mm/hwpoison-inject.c:64:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      64 | DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   mm/hwpoison-inject.c:64:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      64 | DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
>> lib/test_fpu.c:66:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
      66 | DEFINE_DEBUGFS_ATTRIBUTE(test_fpu_fops, test_fpu_get, NULL, "%lld\n");
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
>> lib/test_fpu.c:66:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
      66 | DEFINE_DEBUGFS_ATTRIBUTE(test_fpu_fops, test_fpu_get, NULL, "%lld\n");
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
>> lib/test_fpu.c:66:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
      66 | DEFINE_DEBUGFS_ATTRIBUTE(test_fpu_fops, test_fpu_get, NULL, "%lld\n");
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
>> lib/test_fpu.c:66:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      66 | DEFINE_DEBUGFS_ATTRIBUTE(test_fpu_fops, test_fpu_get, NULL, "%lld\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
>> lib/test_fpu.c:66:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
      66 | DEFINE_DEBUGFS_ATTRIBUTE(test_fpu_fops, test_fpu_get, NULL, "%lld\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
   drivers/memory/tegra/tegra124-emc.c:1207:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
    1207 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
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
   drivers/memory/tegra/tegra124-emc.c:1207:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
    1207 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
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
   drivers/memory/tegra/tegra124-emc.c:1207:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
    1207 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
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
>> drivers/memory/tegra/tegra124-emc.c:1207:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
    1207 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1208 |                         tegra_emc_debug_min_rate_get,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1209 |                         tegra_emc_debug_min_rate_set, "%llu\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra124-emc.c:1207:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
    1207 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1208 |                         tegra_emc_debug_min_rate_get,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1209 |                         tegra_emc_debug_min_rate_set, "%llu\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra124-emc.c:1237:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
    1237 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
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
   drivers/memory/tegra/tegra124-emc.c:1237:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
    1237 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
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
   drivers/memory/tegra/tegra124-emc.c:1237:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
    1237 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
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
   drivers/memory/tegra/tegra124-emc.c:1237:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
    1237 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1238 |                         tegra_emc_debug_max_rate_get,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1239 |                         tegra_emc_debug_max_rate_set, "%llu\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra124-emc.c:1237:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
    1237 | DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1238 |                         tegra_emc_debug_max_rate_get,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1239 |                         tegra_emc_debug_max_rate_set, "%llu\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
>> drivers/i2c/busses/i2c-gpio.c:101:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
     101 | WIRE_ATTRIBUTE(scl);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^
   include/linux/debugfs.h:271:23: note: 'debugfs_attr_read' declared here
     271 | static inline ssize_t debugfs_attr_read(struct file *file, char __user *buf,
         |                       ^
>> drivers/i2c/busses/i2c-gpio.c:101:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
     101 | WIRE_ATTRIBUTE(scl);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:31: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                      ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
>> drivers/i2c/busses/i2c-gpio.c:101:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
     101 | WIRE_ATTRIBUTE(scl);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:64: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                                                       ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
>> drivers/i2c/busses/i2c-gpio.c:101:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     101 | WIRE_ATTRIBUTE(scl);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
      99 | DEFINE_DEBUGFS_ATTRIBUTE(fops_##wire, fops_##wire##_get, fops_##wire##_set, "%llu\n")
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:101:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     101 | WIRE_ATTRIBUTE(scl);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
      99 | DEFINE_DEBUGFS_ATTRIBUTE(fops_##wire, fops_##wire##_get, fops_##wire##_set, "%llu\n")
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:59:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:102:1: error: use of undeclared identifier 'debugfs_attr_read_iter'; did you mean 'debugfs_attr_read'?
     102 | WIRE_ATTRIBUTE(sda);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^
   include/linux/debugfs.h:271:23: note: 'debugfs_attr_read' declared here
     271 | static inline ssize_t debugfs_attr_read(struct file *file, char __user *buf,
         |                       ^
   drivers/i2c/busses/i2c-gpio.c:102:1: error: use of undeclared identifier 'debugfs_attr_write_iter_signed'; did you mean 'debugfs_attr_write_signed'?
     102 | WIRE_ATTRIBUTE(sda);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:31: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                      ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
   drivers/i2c/busses/i2c-gpio.c:102:1: error: use of undeclared identifier 'debugfs_attr_write_iter'; did you mean 'debugfs_attr_write_signed'?
     102 | WIRE_ATTRIBUTE(sda);
         | ^
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^
   include/linux/debugfs.h:59:64: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      59 |         .write_iter= (__is_signed) ? debugfs_attr_write_iter_signed : debugfs_attr_write_iter,  \
         |                                                                       ^
   include/linux/debugfs.h:284:23: note: 'debugfs_attr_write_signed' declared here
     284 | static inline ssize_t debugfs_attr_write_signed(struct file *file,
         |                       ^
   drivers/i2c/busses/i2c-gpio.c:102:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     102 | WIRE_ATTRIBUTE(sda);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
      99 | DEFINE_DEBUGFS_ATTRIBUTE(fops_##wire, fops_##wire##_get, fops_##wire##_set, "%llu\n")
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:64:2: note: expanded from macro '\
   DEFINE_DEBUGFS_ATTRIBUTE'
      64 |         DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:58:15: note: expanded from macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      58 |         .read_iter = debugfs_attr_read_iter,                            \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:102:1: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (*)(struct file *, const char *, size_t, loff_t *)' (aka 'long (*)(struct file *, const char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     102 | WIRE_ATTRIBUTE(sda);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-gpio.c:98:10: note: expanded from macro 'WIRE_ATTRIBUTE'
      98 | }                                                               \
         |                                                                 ^
      99 | DEFINE_DEBUGFS_ATTRIBUTE(fops_##wire, fops_##wire##_get, fops_##wire##_set, "%llu\n")
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +63 mm/hwpoison-inject.c

847ce401df392b Wu Fengguang 2009-12-16  62  
35e3d566df5ff8 zhong jiang  2019-11-30 @63  DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
35e3d566df5ff8 zhong jiang  2019-11-30  64  DEFINE_DEBUGFS_ATTRIBUTE(unpoison_fops, NULL, hwpoison_unpoison, "%lli\n");
cae681fc12a824 Andi Kleen   2009-09-16  65  

:::::: The code at line 63 was first introduced by commit
:::::: 35e3d566df5ff86d19488d2cd9b49b2d9389780e mm/hwpoison-inject: use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs fops

:::::: TO: zhong jiang <zhongjiang@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
