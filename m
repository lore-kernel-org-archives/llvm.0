Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB91DF75D;
	Fri,  6 Mar 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800420; cv=none; b=e3eSMeVkRME6ROFZB/JJlVnjkP6QIEg8WgGT4legd6lrUlv2zdPy599UIN9EN0DnSf680Jy0WbT+qNNG42WQyPyJ2CFuMtm7pR7L3Itv0QsNb0LhI2VtjcpMXVE3+r4gM3eCc3QBdzCiiWqcdfO0SRJjHXcdFEWdgz9XIJ1AYSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800420; c=relaxed/simple;
	bh=+BF6e1zPA/LZxnkJoXl6NnIbK79GIGHqa+bupAhz3Xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qEZpdM5gpIYeoDeB3ztaFsyOyTM3DZjndvBqLgFzMFfT2FgYZnJW/uglmCb6OVldWib4WHpnYJRyrxUEpN1qBCImSW4Qe1KZY3NK556jgeUMDrOoB+vF1AtpRfxASnJsIAptWwUdMsjSGW+2TQXGsW1VxZBvkH3lO9f34KMzaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye/i9Sxl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye/i9Sxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772800418; x=1804336418;
  h=date:from:to:cc:subject:message-id;
  bh=+BF6e1zPA/LZxnkJoXl6NnIbK79GIGHqa+bupAhz3Xs=;
  b=Ye/i9Sxl31OEAnLGHx4vZGfmXReoqYfEBmFTP38HqdK1ckUGrAdAsppA
   lkNE4OO4IoTE9XHg3T2mz25VaJX0O3Mq8sqALzuOrSXHlVA2CP1Z5gqvT
   FzduS2E6Ak6RDDEtAL3EwDbwlRadbRKBvMAY8Sju4gp1oHIdoYHaPlTEj
   mslGRm4waXzUCBdIfaLRzQLiZmQGdDhVOzhsUmSsl7x1mg5hULLue4XrN
   Wcw2/b5fZSYEE9YaKZfp1Ksqd/saQ7ewwBjSJDwgNhh4JhRdaMT5Vh9PV
   LSpS0XUe6c0Q31chxmCe3+QUAuKTHSaMrYw148HlxywCoolOjNEbFyFez
   Q==;
X-CSE-ConnectionGUID: dzkGBXgQRlu+zVHxYby9Ng==
X-CSE-MsgGUID: FWD5m4fzRlmD9Yiatbf/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73809193"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73809193"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:33:38 -0800
X-CSE-ConnectionGUID: dSGD43jMSAWvd5XqMx8oRw==
X-CSE-MsgGUID: WqlJrTbfQVetAkmvhPD+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216136803"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 04:33:35 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyUN3-000000000qN-0N4Z;
	Fri, 06 Mar 2026 12:33:33 +0000
Date: Fri, 06 Mar 2026 20:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.kthread.nullfs.split 19/24]
 include/linux/mount.h:109:11: error: expected ';' after top level declarator
Message-ID: <202603062013.BDL00yoG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.kthread.nullfs.split
head:   e510f1a052643c804811b9ff87f571987ee24477
commit: aca200641ae3560c5471d9ded56c3bb7ea9c5c58 [19/24] fs: add kthread_mntns()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603062013.BDL00yoG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062013.BDL00yoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062013.BDL00yoG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/pnode.c:9:
>> include/linux/mount.h:109:11: error: expected ';' after top level declarator
     109 | int __init kthread_mntns(void);
         |           ^
         |           ;
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/pnode.c:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:


vim +109 include/linux/mount.h

    99	
   100	extern struct vfsmount *kern_mount(struct file_system_type *);
   101	extern void kern_unmount(struct vfsmount *mnt);
   102	extern int may_umount_tree(struct vfsmount *);
   103	extern int may_umount(struct vfsmount *);
   104	int do_mount(const char *, const char __user *,
   105			     const char *, unsigned long, void *);
   106	extern const struct path *collect_paths(const struct path *, struct path *, unsigned);
   107	extern void drop_collected_paths(const struct path *, const struct path *);
   108	extern void kern_unmount_array(struct vfsmount *mnt[], unsigned int num);
 > 109	int __init kthread_mntns(void);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
