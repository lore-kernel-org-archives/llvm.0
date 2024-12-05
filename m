Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53A217F41;
	Thu,  5 Dec 2024 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733401582; cv=none; b=Fv1rGyVLOkimfxvPJQiPrvOCHYFbEtNFWfSalzyE4lFCV1JLSrNEhi9FDBSF9+pfHmNOcxo7P1394EnStlE4ThTWPbrNOr6ZSVjK1aeU9g4u4EeyQ540DflvGzHOUzXHB5OZDJGaKJeYDnCnlA6BtgHU3RHIyTJo9Wn5Df9ucAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733401582; c=relaxed/simple;
	bh=SF23idMWCTa57wDLSdfCvMsjJ+F7uXAAQ+MPDqNpFNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWCiOmp/Yn7PEtJoGD8WjNHE/2oCC9IZam3wzVtvVmvDYirVbsglwn1+bhI6KFOEXjsbIKn31677N+AdDcBgfpupa9i+f/4uBwaKxuFbXbg44AZYVtUn2kYHotMjBKL5k7Sw5ZeDAsUPDcdJG84u0KFBkAgZcQ+xUmft8t0Dp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlgO9pgZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlgO9pgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733401581; x=1764937581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SF23idMWCTa57wDLSdfCvMsjJ+F7uXAAQ+MPDqNpFNY=;
  b=jlgO9pgZx/SOswZgPF8C2z5UiDRBQzIDq7OP2kA88H8sSWXkrlj6uEhM
   2BXkKH3Mr+ZJN97SXXd+VjKMXg4qKJEeKUE5gloALD/T1kq7puAVk9CnK
   Jl00bBv9Sqbh+nX+BPLAGZB/ynCAs2+WP6kkRqzRSklyIOXz1qlR7+PoS
   N9OIjfV97sA4DZXF3LPqoznmeQRdycMhkP8Ngc1W4XoAEj3sAuitVE0ud
   gunczKKIgTEdFy1KCIPe1N8At3d0EvyYvLic2Z2uVQ0DW1daoQzTICYtO
   O2p1trfqPFaRdgJ7oiLORaRD8XFUM9M80grRqFXfwzPxACMd/F+LhbkSW
   g==;
X-CSE-ConnectionGUID: /EJZhjorTgGQ0Z5J+RSLhA==
X-CSE-MsgGUID: K4r1gNFpSSulVCwfRnJ2pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37372406"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="37372406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:26:20 -0800
X-CSE-ConnectionGUID: g3mGbodVR0KQns+JXVAHJw==
X-CSE-MsgGUID: Y7IJ0S/dRuW9DlwLGMdqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94555904"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2024 04:26:18 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJAvw-0004Az-0p;
	Thu, 05 Dec 2024 12:26:16 +0000
Date: Thu, 5 Dec 2024 20:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 2/4] include/linux/signal.h:98:11:
 error: array index 3 is past the end of the array (that has type 'unsigned
 long[2]')
Message-ID: <202412052006.2oheycjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   cc3b7ba41f14d666907c81d2b5079170659e37b1
commit: 6576e541fcc39fd4f68ddaf2e4851d7eb30c9791 [2/4] acpi/hmat / cxl: Add extended linear cache support for CXL
config: i386-buildonly-randconfig-004-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052006.2oheycjH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052006.2oheycjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052006.2oheycjH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:1105:19: error: redefinition of 'hmat_get_extended_linear_cache_size'
    1105 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   include/linux/acpi.h:448:19: note: previous definition is here
     448 | static inline int hmat_get_extended_linear_cache_size(struct resource *backing_res,
         |                   ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
>> include/linux/signal.h:98:11: error: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: error: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
>> include/linux/signal.h:114:11: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: error: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: error: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/drm_fbdev_dma.c:3:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: error: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +98 include/linux/signal.h

^1da177e4c3f41 Linus Torvalds  2005-04-16   93  
71fabd5e483530 George Anzinger 2006-01-08   94  static inline int sigisemptyset(sigset_t *set)
71fabd5e483530 George Anzinger 2006-01-08   95  {
71fabd5e483530 George Anzinger 2006-01-08   96  	switch (_NSIG_WORDS) {
71fabd5e483530 George Anzinger 2006-01-08   97  	case 4:
71fabd5e483530 George Anzinger 2006-01-08  @98  		return (set->sig[3] | set->sig[2] |
71fabd5e483530 George Anzinger 2006-01-08   99  			set->sig[1] | set->sig[0]) == 0;
71fabd5e483530 George Anzinger 2006-01-08  100  	case 2:
71fabd5e483530 George Anzinger 2006-01-08  101  		return (set->sig[1] | set->sig[0]) == 0;
71fabd5e483530 George Anzinger 2006-01-08  102  	case 1:
71fabd5e483530 George Anzinger 2006-01-08  103  		return set->sig[0] == 0;
71fabd5e483530 George Anzinger 2006-01-08  104  	default:
1c3bea0e71892e Oleg Nesterov   2014-10-13  105  		BUILD_BUG();
71fabd5e483530 George Anzinger 2006-01-08  106  		return 0;
71fabd5e483530 George Anzinger 2006-01-08  107  	}
71fabd5e483530 George Anzinger 2006-01-08  108  }
71fabd5e483530 George Anzinger 2006-01-08  109  
c7be96af89d4b5 Waiman Long     2016-12-14  110  static inline int sigequalsets(const sigset_t *set1, const sigset_t *set2)
c7be96af89d4b5 Waiman Long     2016-12-14  111  {
c7be96af89d4b5 Waiman Long     2016-12-14  112  	switch (_NSIG_WORDS) {
c7be96af89d4b5 Waiman Long     2016-12-14  113  	case 4:
c7be96af89d4b5 Waiman Long     2016-12-14 @114  		return	(set1->sig[3] == set2->sig[3]) &&
c7be96af89d4b5 Waiman Long     2016-12-14  115  			(set1->sig[2] == set2->sig[2]) &&
c7be96af89d4b5 Waiman Long     2016-12-14  116  			(set1->sig[1] == set2->sig[1]) &&
c7be96af89d4b5 Waiman Long     2016-12-14  117  			(set1->sig[0] == set2->sig[0]);
c7be96af89d4b5 Waiman Long     2016-12-14  118  	case 2:
c7be96af89d4b5 Waiman Long     2016-12-14  119  		return	(set1->sig[1] == set2->sig[1]) &&
c7be96af89d4b5 Waiman Long     2016-12-14  120  			(set1->sig[0] == set2->sig[0]);
c7be96af89d4b5 Waiman Long     2016-12-14  121  	case 1:
c7be96af89d4b5 Waiman Long     2016-12-14  122  		return	set1->sig[0] == set2->sig[0];
c7be96af89d4b5 Waiman Long     2016-12-14  123  	}
c7be96af89d4b5 Waiman Long     2016-12-14  124  	return 0;
c7be96af89d4b5 Waiman Long     2016-12-14  125  }
c7be96af89d4b5 Waiman Long     2016-12-14  126  

:::::: The code at line 98 was first introduced by commit
:::::: 71fabd5e4835309b4feca6209122ce56c595c461 [PATCH] sigaction should clear all signals on SIG_IGN, not just < 32

:::::: TO: George Anzinger <george@mvista.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
