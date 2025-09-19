Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE96255F52;
	Fri, 19 Sep 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290452; cv=none; b=S2CwL0I3y3Ya2yTdAoMUJyv0iUEhJOFnZb4Ok/GbXxV35HMw9T12SSJTrFCBXlhEmGwGA2XWQNJyH8RLSGEP3JLndsff2X3cwKnmuVQmY7ps6MC7tmSnlnDL49iUTYG+BmBFHyf3hygVdNrJhdBaa338dCjh+BYRPmApgm4Deg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290452; c=relaxed/simple;
	bh=qK72TybXrM891NHVlWO0Qses8Geqb21b9hhqVh3+Dzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdPwZM01k2JPTxRo6ItghYukt9bld8tqk41yn6tc6nSvQ/mRr3X/LQThnV/1/yL5spTNkipGrAR4fi9qON6p/hwyc4V9Xp4+v/QJRv6PJLUlQNApnLrSJkO6opjNNSM+v6wE1DuDoW4aFTEIbHuq1BYxTyhp2aDHcvzHeJ48ueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+7EweCx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+7EweCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758290450; x=1789826450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qK72TybXrM891NHVlWO0Qses8Geqb21b9hhqVh3+Dzw=;
  b=l+7EweCx4Z4yVB0y0CCVeEkoipy2DEDlwQDWs6rGHKsan+93bpDG1RYB
   UllZg+HIynWnJNOYyjHB9mem35SLfkbs7IWZ5Ew0P2bnYIJzCtQvzSnLH
   c8AWac8M16lOjwcJ11T7DlSdS1Zx0KHs1wITTwuyGAT0FVZ++xSOtGeci
   8mpqJhcvm1Fe2i/jYeSGWE4toTMZFTVH/xBJh7VdmpxCzACL/B2Z36ml4
   NsMCzi2yOngmrNHMZ3SN1BkxiHFV+2tYI2fLs/+nbcxwYSIVCRL551RT+
   GpQCuRw0Mf93J10a4YreRvGRIQBw0U18N7Et3HTpyVS/4VLGj0UD+l9F5
   Q==;
X-CSE-ConnectionGUID: a9eE13D0RQuGTudztUL7Dg==
X-CSE-MsgGUID: vMT1XqGoSYWAGEAKjrRnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="72008867"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="72008867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:00:40 -0700
X-CSE-ConnectionGUID: UHoTrgKOT4iWvqp3yQFcpA==
X-CSE-MsgGUID: DIpeeQ11S2GTWYpFkvkY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176287513"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2025 07:00:39 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzbfB-0004Lp-1Q;
	Fri, 19 Sep 2025 14:00:37 +0000
Date: Fri, 19 Sep 2025 21:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:anna-linux-next-6.18 10/11] fs/nfs/nfstrace.h:1799:1:
 error: incompatible pointer types passing 'const struct nfs_local_dio *' to
 parameter of type 'const struct nfs_local_dio *'
Message-ID: <202509192136.Td3qEZgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git anna-linux-next-6.18
head:   79f4defe4ab1ad7b6bd760e373d8c7392d25f690
commit: f5dbc64124226ba461890dd82fe53730832f5be6 [10/11] nfs/localio: add tracepoints for misaligned DIO READ and WRITE support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509192136.Td3qEZgL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192136.Td3qEZgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192136.Td3qEZgL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/nfs/nfs2xdr.c:26:
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: error: incompatible pointer types passing 'const struct nfs_local_dio *' to parameter of type 'const struct nfs_local_dio *' [-Werror,-Wincompatible-pointer-types]
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfstrace.h:1797:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1797 |         TP_ARGS(inode, offset, count, local_dio))
         |                                       ^~~~~~~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:608:50: note: expanded from macro '\
   DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                                         ^~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:275:34: note: expanded from macro '__DECLARE_TRACE'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                                       ^~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:209:62: note: expanded from macro '__DO_TRACE_CALL'
     209 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   fs/nfs/nfstrace.h:1799:1: note: passing argument to parameter 'local_dio' here
   fs/nfs/nfstrace.h:1796:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                                              ^
>> fs/nfs/nfstrace.h:1799:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
>> fs/nfs/nfstrace.h:1799:1: error: incompatible pointer types passing 'const struct nfs_local_dio *' to parameter of type 'const struct nfs_local_dio *' [-Werror,-Wincompatible-pointer-types]
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfstrace.h:1797:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1797 |         TP_ARGS(inode, offset, count, local_dio))
         |                                       ^~~~~~~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:608:50: note: expanded from macro '\
   DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                                         ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:481:46: note: expanded from macro 'DECLARE_TRACE_EVENT'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                                     ^~~~
   include/linux/tracepoint.h:139:25: note: expanded from macro 'PARAMS'
     139 | #define PARAMS(args...) args
         |                         ^~~~
   include/linux/tracepoint.h:281:22: note: expanded from macro '__DECLARE_TRACE'
     281 |                         __do_trace_##name(args);                        \
         |                                           ^~~~
   fs/nfs/nfstrace.h:1799:1: note: passing argument to parameter 'local_dio' here
   fs/nfs/nfstrace.h:1796:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                                              ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: error: incompatible pointer types passing 'const struct nfs_local_dio *' to parameter of type 'const struct nfs_local_dio *' [-Werror,-Wincompatible-pointer-types]
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfstrace.h:1797:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1797 |         TP_ARGS(inode, offset, count, local_dio))
         |                                       ^~~~~~~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:608:50: note: expanded from macro '\
   DEFINE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                                         ^~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:275:34: note: expanded from macro '__DECLARE_TRACE'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                                       ^~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:209:62: note: expanded from macro '__DO_TRACE_CALL'
     209 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   fs/nfs/nfstrace.h:1800:1: note: passing argument to parameter 'local_dio' here
   fs/nfs/nfstrace.h:1796:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                                              ^
   fs/nfs/nfstrace.h:1800:1: warning: declaration of 'struct nfs_local_dio' will not be visible outside of this function [-Wvisibility]
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^
   fs/nfs/nfstrace.h:1796:17: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^
   fs/nfs/nfstrace.h:1800:1: error: incompatible pointer types passing 'const struct nfs_local_dio *' to parameter of type 'const struct nfs_local_dio *' [-Werror,-Wincompatible-pointer-types]
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfstrace.h:1797:32: note: expanded from macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1797 |         TP_ARGS(inode, offset, count, local_dio))
         |                                       ^~~~~~~~~
   include/linux/tracepoint.h:180:26: note: expanded from macro 'TP_ARGS'
     180 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:608:50: note: expanded from macro '\
   DEFINE_EVENT'


vim +1799 fs/nfs/nfstrace.h

  1790	
  1791	#define DEFINE_NFS_LOCAL_DIO_EVENT(name)		\
  1792	DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name,	\
  1793		TP_PROTO(const struct inode *inode,		\
  1794			 loff_t offset,				\
  1795			 ssize_t count,				\
  1796			 const struct nfs_local_dio *local_dio),\
  1797		TP_ARGS(inode, offset, count, local_dio))
  1798	
> 1799	DEFINE_NFS_LOCAL_DIO_EVENT(read);
  1800	DEFINE_NFS_LOCAL_DIO_EVENT(write);
  1801	DEFINE_NFS_LOCAL_DIO_EVENT(misaligned);
  1802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
