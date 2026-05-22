Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151DF5CDF1;
	Fri, 22 May 2026 04:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779422595; cv=none; b=Ye4Wg7/xOaiMLXWxP+apJPVbmE6WrC3UHSTjTcw6I75Ij2II/u46BQuXB0sv2oQiAnbTNGGuET04k3QubARJjb+H7kP3XumF9ZeiEKZGpDA3i3/tB/1lju3SXb+2e1kEcaeDgZ7Pf1JryYGddgCkzMfinbzd8fdL1rZls0sc0xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779422595; c=relaxed/simple;
	bh=7VJUpht+UtUGFBzcW8/8AxGGmmtZ4WC1VNqVR1sOJK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkR0AE+/NBcZEroraAkPj08I0fwn0MlUk9V3kcO+DO9DCzRU0LAOEPAw+m+M0e1YtTCDiHgQO3dqqnQhkI8rCcALm+pTWjA62pJ0hMPXL7T9+woPyZfSwkO6tExsAk5kdPqsWJwolACMtASsgP4Oeq4Wmc1YDKUM+iYd3LHBIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxZXI5Bi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxZXI5Bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779422594; x=1810958594;
  h=date:from:to:cc:subject:message-id;
  bh=7VJUpht+UtUGFBzcW8/8AxGGmmtZ4WC1VNqVR1sOJK0=;
  b=jxZXI5Bihc6arhCMixKFp0sQkz6j80xvgiiGKbWhU6m8p0fYUFRVffug
   f/VRVS3bzw73XkwkDCTecM+6lNXVPm6SoW4GtVMDKKIULn8wrP1FN9bVs
   LJySghKlEILNrUZY2Q3xQwqGYlg60L64M9xcjheGv1oK6e7Pnjtz2iD4m
   6zQm8mKX5YfqSJx7q0s3WvcSKJPRDH07lFdCYtiXYJQeG+bhaFYVO+tlo
   0Hx5HmCc0KpQEaeEXcwl2C6sZVXE3xZYT4zSqBDa0p94LkBbSoqfzyPYP
   AZxq1ZlPiG7Suqh7ZDu1L4aMgqf0SUOncdatBhbVe4o6KaXprQrraMXCz
   g==;
X-CSE-ConnectionGUID: PF2IIzL6QQ+p2TH5JIreXA==
X-CSE-MsgGUID: /87Gcd6VTiCeBlbSQmp1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103027359"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="103027359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 21:03:13 -0700
X-CSE-ConnectionGUID: FzHNBGIZTKehokUCXKiNwA==
X-CSE-MsgGUID: z7k9V9kfQVy40kNPMzBocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240823052"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 21:03:11 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQH6J-000000001fh-3uyn;
	Fri, 22 May 2026 04:03:07 +0000
Date: Fri, 22 May 2026 12:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 1184/1197]
 include/uapi/asm-generic/posix_types.h:20:2: error: "In the kernel include
 linux/types.h before UAPI headers!"
Message-ID: <202605221249.AStzwtX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 2c4db0b2e9fd993cf8da62b269f7c255ef6a9237 [1184/1197] cheri: Make sure UAPI headers are included in the correct order
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605221249.AStzwtX8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221249.AStzwtX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221249.AStzwtX8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/drivers/stdio_console.c:6:
   In file included from include/uapi/linux/posix_types.h:36:
   In file included from arch/x86/include/asm/posix_types.h:3:
   In file included from arch/x86/include/uapi/asm/posix_types_32.h:24:
>> include/uapi/asm-generic/posix_types.h:20:2: error: "In the kernel include linux/types.h before UAPI headers!"
      20 | #error "In the kernel include linux/types.h before UAPI headers!"
         |  ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     100 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     100 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     116 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     116 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:117:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     117 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:117:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     117 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/um/drivers/stdio_console.c:7:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:159:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     159 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:8: note: expanded from macro '_SIG_SET_BINOP'
     140 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~


vim +20 include/uapi/asm-generic/posix_types.h

    18	
    19	#if defined(__KERNEL__) && !defined(_LINUX_TYPES_H)
  > 20	#error "In the kernel include linux/types.h before UAPI headers!"
    21	#endif
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
