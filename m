Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9378BE58;
	Sat,  8 Jun 2024 02:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717813388; cv=none; b=KLf9bzQwJPgGTnXfBqh1fcU+5W03Lou8xEYzn2dTOkCFuYUczOHWoDcsbuBZP14K8U1p4ZQRFrzkoN00AxbcOC8X2tS+hyZgco800fALLY/FXzW17/LSACO6nHxVNV4Z3Y7BjcShgXZ5RsWAxxtjIFfhMpVykjTrbgmcC2LmQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717813388; c=relaxed/simple;
	bh=wunjnGnnortd5mhn5UMUmF7C0uT8M3cHXDEn7RGugGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTyjKxaQzJFaBHmFZRIdJMH/rBC8re+fWESC4bkMMvlJWQI2z8y+23sai3OuNrv1TpwVsFoSwWEIrijuyybhFYDyFcRLHWLUL5PyVTb+uSUsdC7kQXuEaBuFqhte5RdQN3bz1v5nL62cdXV4f1091yyYyqYdMEa2/7+fuVD9ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALO7PhEI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALO7PhEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717813387; x=1749349387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wunjnGnnortd5mhn5UMUmF7C0uT8M3cHXDEn7RGugGg=;
  b=ALO7PhEICuCNfyNISwefoRm2YY4YwnxgMgNfaR0Bz2H/2i6s71+GqykG
   o+Zl4sL2G2OqOLrRg0BhD8bRT4EjReCdY6tu2VsjDae4Yq+4qsdkOJc4t
   FnRzbv+hTU23YffpQzy2f12pJUMWImFrqS0oYp10n0yjvp4pjbUQtyQU7
   TImbSYWx2Z9ahCaORTEKqMvtCk5A8zG5PbdGqMfYzYxIrbozJ+lMVCJP9
   8/4OAcmClJszttU8oUAmfopAQsYvfBtEI+XMXjfPr0pAF/l9roibe+iOh
   t9r1DNTvP2lMzofcEff8IPHb8cvcUz8Pa9iofW8Z5faLVMIwLXyYrbtbD
   A==;
X-CSE-ConnectionGUID: /n2W3oVDQq29XaV6IaLipw==
X-CSE-MsgGUID: Fyk7LH4MQO+/CCGW9/tAdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25967619"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25967619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 19:23:01 -0700
X-CSE-ConnectionGUID: 3YybAvriTtSmkotkDJ67Iw==
X-CSE-MsgGUID: ppg77dq1SiyNqGwSHUMImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43064608"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2024 19:23:00 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFljN-0000r2-23;
	Sat, 08 Jun 2024 02:22:57 +0000
Date: Sat, 8 Jun 2024 10:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 7/7] fs/namei.c:413:36: warning: data argument not
 used by format string
Message-ID: <202406081006.C6QLHnLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   a082d0efc42d3018dd74fdc60c2bd07f87f3603a
commit: ff782da8592fd382cf9399c9436c71905220a7c1 [7/7] NFSD: Layout operations need to operation on files and nothing else
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081006.C6QLHnLV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081006.C6QLHnLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081006.C6QLHnLV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
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
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
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
   In file included from fs/namei.c:41:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
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
>> fs/namei.c:413:36: warning: data argument not used by format string [-Wformat-extra-args]
     413 |                 trace_printk("dir mask=0x08x\n", mask);
         |                              ~~~~~~~~~~~~~~~~~~  ^
>> fs/namei.c:419:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     419 |                         else
         |                         ^
   fs/namei.c:433:36: warning: data argument not used by format string [-Wformat-extra-args]
     433 |         trace_printk("file mask=0x08x\n", mask);
         |                      ~~~~~~~~~~~~~~~~~~~  ^
   fs/namei.c:438:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     438 |                 else
         |                 ^
   fs/namei.c:449:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     449 |                 else
         |                 ^
   18 warnings generated.


vim +413 fs/namei.c

   376	
   377	/**
   378	 * generic_permission -  check for access rights on a Posix-like filesystem
   379	 * @idmap:	idmap of the mount the inode was found from
   380	 * @inode:	inode to check access rights for
   381	 * @mask:	right to check for (%MAY_READ, %MAY_WRITE, %MAY_EXEC,
   382	 *		%MAY_NOT_BLOCK ...)
   383	 *
   384	 * Used to check for read/write/execute permissions on a file.
   385	 * We use "fsuid" for this, letting us set arbitrary permissions
   386	 * for filesystem access without changing the "normal" uids which
   387	 * are used for other things.
   388	 *
   389	 * generic_permission is rcu-walk aware. It returns -ECHILD in case an rcu-walk
   390	 * request cannot be satisfied (eg. requires blocking or too much complexity).
   391	 * It would then be called again in ref-walk mode.
   392	 *
   393	 * If the inode has been found through an idmapped mount the idmap of
   394	 * the vfsmount must be passed through @idmap. This function will then take
   395	 * care to map the inode according to @idmap before checking permissions.
   396	 * On non-idmapped mounts or if permission checking is to be performed on the
   397	 * raw inode simply pass @nop_mnt_idmap.
   398	 */
   399	int generic_permission(struct mnt_idmap *idmap, struct inode *inode,
   400			       int mask)
   401	{
   402		int ret;
   403	
   404		/*
   405		 * Do the basic permission checks.
   406		 */
   407		ret = acl_permission_check(idmap, inode, mask);
   408		trace_printk("acl_permission_check returns %d\n", ret);
   409		if (ret != -EACCES)
   410			return ret;
   411	
   412		if (S_ISDIR(inode->i_mode)) {
 > 413			trace_printk("dir mask=0x08x\n", mask);
   414			/* DACs are overridable for directories */
   415			if (!(mask & MAY_WRITE))
   416				if (capable_wrt_inode_uidgid(idmap, inode,
   417							     CAP_DAC_READ_SEARCH))
   418					return 0;
 > 419				else
   420					trace_printk("capable_wrt_inode_uidgid (dir read search) returns non-zero\n");
   421			if (capable_wrt_inode_uidgid(idmap, inode,
   422						     CAP_DAC_OVERRIDE))
   423				return 0;
   424			else
   425				trace_printk("capable_wrt_inode_uidgid (dir override) returns non-zero\n");
   426			return -EACCES;
   427		}
   428	
   429		/*
   430		 * Searching includes executable on directories, else just read.
   431		 */
   432		mask &= MAY_READ | MAY_WRITE | MAY_EXEC;
   433		trace_printk("file mask=0x08x\n", mask);
   434		if (mask == MAY_READ)
   435			if (capable_wrt_inode_uidgid(idmap, inode,
   436						     CAP_DAC_READ_SEARCH))
   437				return 0;
   438			else
   439				trace_printk("capable_wrt_inode_uidgid (file read search) returns non-zero\n");
   440		/*
   441		 * Read/write DACs are always overridable.
   442		 * Executable DACs are overridable when there is
   443		 * at least one exec bit set.
   444		 */
   445		if (!(mask & MAY_EXEC) || (inode->i_mode & S_IXUGO))
   446			if (capable_wrt_inode_uidgid(idmap, inode,
   447						     CAP_DAC_OVERRIDE))
   448				return 0;
   449			else
   450				trace_printk("capable_wrt_inode_uidgid (file override) returns non-zero\n");
   451	
   452		return -EACCES;
   453	}
   454	EXPORT_SYMBOL(generic_permission);
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
