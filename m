Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251F1E507;
	Sun,  5 May 2024 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927120; cv=none; b=RXLrX843LbUH6kjgjurJItHiYNwjrxPuz/M8mh/HjcN1jCPkgapPfPVUJStkEO8YkHExYJa5G8ExqfQ4jv3gdg9ybgi97W4ZQngO9UfcREoMmp1ySoZ73Z4THWpIR7tPIir5lOzZe3jplOa7pwdjBCYFA2bkcsMFCafETOyESzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927120; c=relaxed/simple;
	bh=TPc2fVemOKXRbjMq/UOFzk1pMRUuzvj6Vc0GgJsqTIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBQKS9Cvaj74Ko5o4rR7hRDEVSRyqrFjQ3xmVQtMi286DBWHXFg3i0TOb+Afw74D0A5EpTzkwX9vH/ki5mES/qxDRKMbiSkehfxIna3hUcF3wmd6joVI/rnMGfE/tA3QlgTU7ize5poJr3bppe5hmVsJD4pG0EqL+J4mrpwwKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZN3fkIK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZN3fkIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714927119; x=1746463119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPc2fVemOKXRbjMq/UOFzk1pMRUuzvj6Vc0GgJsqTIk=;
  b=BZN3fkIK7ak1/hnx1ikfmLdr8h0w6HSLvYJO+RshSCFxMu6w9M9HvPLC
   EDaqcUGNQX/zAh+72t9PVSOBPpjEMGvUn8+4r6DREnPxPvMaodkDsDwIW
   0pIeBZA+ImzrGmxmlbdFv149jmyjWTaHTUpJFsuHn/ZXzm6Nbs5e5VYjs
   EQyJvnYTaK+XQoz1zapPfx5qSGTPeLF2D+dlxHuXmc/1hvDfUBQ5QSUlA
   rnqlgJc67mk6YJ63o53v6ZCs+GLYxBbtrSAf5Qqq4xBgFnvBkij7lmdjZ
   vVOK5CLkOtlFbJWM3U+VHYgL0+/GHWWFUz+QR/pLrEynIPlp+jPjUBvkV
   Q==;
X-CSE-ConnectionGUID: zq1H0PIVQua7fAww5ElXgA==
X-CSE-MsgGUID: gaNzflfcRDuRJUGuUgESUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10891094"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="10891094"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 09:38:38 -0700
X-CSE-ConnectionGUID: j4gSyj8VS2uZJCSLWCl/vg==
X-CSE-MsgGUID: HYZjCJwCTbe4pc/fXio33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="32746414"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2024 09:38:37 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3esk-00003k-0j;
	Sun, 05 May 2024 16:38:34 +0000
Date: Mon, 6 May 2024 00:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 33/33] fs/f2fs/f2fs.h:3130:17: error: no member
 named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean
 'i_pin_failure'?
Message-ID: <202405060025.1ExsKTY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   d7c9e98caf2285d83bf9e839c7398946bbc7deb3
commit: d7c9e98caf2285d83bf9e839c7398946bbc7deb3 [33/33] f2fs: remove unused GC_FAILURE_PIN
config: i386-buildonly-randconfig-003-20240505 (https://download.01.org/0day-ci/archive/20240506/202405060025.1ExsKTY8-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060025.1ExsKTY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060025.1ExsKTY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/data.c:25:
>> fs/f2fs/f2fs.h:3130:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/data.c:2369:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2369 |         pgoff_t index;
         |                 ^
   1 warning and 1 error generated.
--
   In file included from fs/f2fs/inline.c:13:
>> fs/f2fs/f2fs.h:3130:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   1 error generated.
--
   In file included from fs/f2fs/file.c:29:
>> fs/f2fs/f2fs.h:3130:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
>> fs/f2fs/file.c:3220:39: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3220 |                 f2fs_i_gc_failures_write(inode, fi->i_gc_failures + 1);
         |                                                     ^~~~~~~~~~~~~
         |                                                     i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/file.c:3222:10: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3222 |         if (fi->i_gc_failures > sbi->gc_pin_file_threshold) {
         |                 ^~~~~~~~~~~~~
         |                 i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/file.c:3224:34: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3224 |                           __func__, inode->i_ino, fi->i_gc_failures);
         |                                                       ^~~~~~~~~~~~~
         |                                                       i_pin_failure
   fs/f2fs/f2fs.h:1829:46: note: expanded from macro 'f2fs_warn'
    1829 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                                     ^
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/file.c:3288:23: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3288 |         ret = F2FS_I(inode)->i_gc_failures;
         |                              ^~~~~~~~~~~~~
         |                              i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/file.c:3303:24: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3303 |                 pin = F2FS_I(inode)->i_gc_failures;
         |                                      ^~~~~~~~~~~~~
         |                                      i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   6 errors generated.
--
   In file included from fs/f2fs/inode.c:16:
>> fs/f2fs/f2fs.h:3130:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
>> fs/f2fs/inode.c:418:7: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
     418 |                 fi->i_gc_failures = le16_to_cpu(ri->i_gc_failures);
         |                     ^~~~~~~~~~~~~
         |                     i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   fs/f2fs/inode.c:688:50: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
     688 |                 ri->i_gc_failures = cpu_to_le16(F2FS_I(inode)->i_gc_failures);
         |                                                                ^~~~~~~~~~~~~
         |                                                                i_pin_failure
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_to_le16'
      90 | #define cpu_to_le16 __cpu_to_le16
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   3 errors generated.
--
   In file included from fs/f2fs/recovery.c:12:
>> fs/f2fs/f2fs.h:3130:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
    3130 |         F2FS_I(inode)->i_gc_failures = count;
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
>> fs/f2fs/recovery.c:333:17: error: no member named 'i_gc_failures' in 'struct f2fs_inode_info'; did you mean 'i_pin_failure'?
     333 |         F2FS_I(inode)->i_gc_failures = le16_to_cpu(raw->i_gc_failures);
         |                        ^~~~~~~~~~~~~
         |                        i_pin_failure
   fs/f2fs/f2fs.h:815:15: note: 'i_pin_failure' declared here
     815 |         unsigned int i_pin_failure;     /* for gc failure statistic */
         |                      ^
   2 errors generated.


vim +3130 fs/f2fs/f2fs.h

  3126	
  3127	static inline void f2fs_i_gc_failures_write(struct inode *inode,
  3128						unsigned int count)
  3129	{
> 3130		F2FS_I(inode)->i_gc_failures = count;
  3131		f2fs_mark_inode_dirty_sync(inode, true);
  3132	}
  3133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
