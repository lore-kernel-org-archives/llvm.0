Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B2635;
	Fri, 12 Jul 2024 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720773863; cv=none; b=rWZlYuW+mTi3f9XcLN03NJ0/G3rG8z8RYvpK35Q96hPwX4J9n5kIAkapwnLI3Rq2cMqOAZ134nmY5csE27YwMkDt6jBykYaqhfwRQrdYVakkCrqSZXqQ8XlewUcLTr1UOOTxNjp00RmQBMVjJt9oVR8V+9ID4ZsGZjZh3RH+P/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720773863; c=relaxed/simple;
	bh=iKkVlFwmA02e74aasRggopKiM0Jyo2mPYo6/eIBCKZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xknd8hrsBh3cZMWFVXvjdt2N9Wi77PDHIO4lR17nM8euZUR/4KUIKNT8NamkIsCbf+qoW/G+ZYwAJgqd3abIO4LI/Ew9XLzx102CoJAb25ee8LuY7+M9N4SexIFkxo6fUOgYtjdlvw6bSfdIaI+IXJfm6A1BpBLFgAc/x0d+7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkqLp6WK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkqLp6WK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720773858; x=1752309858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKkVlFwmA02e74aasRggopKiM0Jyo2mPYo6/eIBCKZs=;
  b=FkqLp6WK9ppq9sGx4CeSBLmSrJ2AQA6j19M4WRGjMB+KwWgBziS2IbjN
   UFKpHewKKbIitzoXIs58ljgAUngEVAkg2O5DvCpo62wTr59ijx+7wiGOD
   TJ5djYFNxY2Tz+/j16IUe5Kw/OAGmwsCGC3P3bsZgNSWrzlssIfSsjOjY
   2rM6Nsa/jMLmaErsn+bwZOz1hl7vKFv+cNKmg5Y/RW9o3esB2A6Pn5rkJ
   7FDa9NDzKIYZybW4lB4KIRQxns2lwPXGO22oTpwTWIa1cRWWWDhq2rW/6
   B8IhXSpHNA2dwd3OwgsoVFQXREOJNzJlTVGNoPRm8lLSYIkJKpLni23kk
   Q==;
X-CSE-ConnectionGUID: b8/KiybaT1quH12JtQOo2A==
X-CSE-MsgGUID: pWv0m+YGRWuSkhwWWizDTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22074701"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22074701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 01:44:18 -0700
X-CSE-ConnectionGUID: q1zLVVZsShqjO+j5sZKywg==
X-CSE-MsgGUID: AvTb28zvQLa6Y1tvK1q/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="49506848"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jul 2024 01:44:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSBsz-000aYZ-2G;
	Fri, 12 Jul 2024 08:44:13 +0000
Date: Fri, 12 Jul 2024 16:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 29/29] fs/locks.c:1533:32: error: no member named
 'fl_file' in 'struct file_lock_core'; did you mean 'flc_file'?
Message-ID: <202407121619.mxZHIOZi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   1a45dc4f22747fa6674e3d7d4056900a712a88fd
commit: 1a45dc4f22747fa6674e3d7d4056900a712a88fd [29/29] fs: add support for ignoring deleg breaks for dir change events
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240712/202407121619.mxZHIOZi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121619.mxZHIOZi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121619.mxZHIOZi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/locks.c:57:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/locks.c:57:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/locks.c:57:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
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
>> fs/locks.c:1533:32: error: no member named 'fl_file' in 'struct file_lock_core'; did you mean 'flc_file'?
    1533 |         if (!S_ISDIR(file_inode(fl->c.fl_file)->i_mode))
         |                                       ^~~~~~~
         |                                       flc_file
   include/uapi/linux/stat.h:23:23: note: expanded from macro 'S_ISDIR'
      23 | #define S_ISDIR(m)      (((m) & S_IFMT) == S_IFDIR)
         |                            ^
   include/linux/filelock.h:126:15: note: 'flc_file' declared here
     126 |         struct file *flc_file;
         |                      ^
>> fs/locks.c:1536:49: error: no member named 'fl_flags' in 'struct file_lock_core'; did you mean 'flc_flags'?
    1536 |         if ((flags & LEASE_BREAK_DIR_CREATE) && (fl->c.fl_flags & FL_IGN_DIR_CREATE))
         |                                                        ^~~~~~~~
         |                                                        flc_flags
   include/linux/filelock.h:121:15: note: 'flc_flags' declared here
     121 |         unsigned int flc_flags;
         |                      ^
   fs/locks.c:1538:49: error: no member named 'fl_flags' in 'struct file_lock_core'; did you mean 'flc_flags'?
    1538 |         if ((flags & LEASE_BREAK_DIR_DELETE) && (fl->c.fl_flags & FL_IGN_DIR_DELETE))
         |                                                        ^~~~~~~~
         |                                                        flc_flags
   include/linux/filelock.h:121:15: note: 'flc_flags' declared here
     121 |         unsigned int flc_flags;
         |                      ^
   fs/locks.c:1540:49: error: no member named 'fl_flags' in 'struct file_lock_core'; did you mean 'flc_flags'?
    1540 |         if ((flags & LEASE_BREAK_DIR_RENAME) && (fl->c.fl_flags & FL_IGN_DIR_RENAME))
         |                                                        ^~~~~~~~
         |                                                        flc_flags
   include/linux/filelock.h:121:15: note: 'flc_flags' declared here
     121 |         unsigned int flc_flags;
         |                      ^
   12 warnings and 4 errors generated.


vim +1533 fs/locks.c

  1528	
  1529	static bool
  1530	ignore_dir_deleg_break(struct file_lease *fl, unsigned int flags)
  1531	{
  1532		/* Not a directory inode? */
> 1533		if (!S_ISDIR(file_inode(fl->c.fl_file)->i_mode))
  1534			return false;
  1535	
> 1536		if ((flags & LEASE_BREAK_DIR_CREATE) && (fl->c.fl_flags & FL_IGN_DIR_CREATE))
  1537			return true;
  1538		if ((flags & LEASE_BREAK_DIR_DELETE) && (fl->c.fl_flags & FL_IGN_DIR_DELETE))
  1539			return true;
  1540		if ((flags & LEASE_BREAK_DIR_RENAME) && (fl->c.fl_flags & FL_IGN_DIR_RENAME))
  1541			return true;
  1542	
  1543		return false;
  1544	}
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
