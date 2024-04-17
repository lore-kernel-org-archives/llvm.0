Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF813CFB7;
	Wed, 17 Apr 2024 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713357752; cv=none; b=sxqx14I07lPolNYEZLImSA68prEX8KOI3TK414smXbcR8ZRKiNx3YqxgHIao1USmx2fW15ItlinkGBQbzvkdd4W5K0guJYb3AS11x2v84PCWEX/m2VNHOHxDW8EKydXumLDAyqZslpA+Zc7ThMLSB+z0ufZ77u2SzERKZfK/zno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713357752; c=relaxed/simple;
	bh=fY1cADs3Qk6OZmo7rnfEDaY0MjNYg3MkCJsjnHGkB74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuMYKHAH1sqew7kVdT9Qvdf9eW0Zn4ASuT8F7U2fIhnLJUL0BMab4MJajqANX3ji5+OIqtIGfct9teQXXXz+vngCBRPRhbua+ArpcznF2DqqrI72G1SMoG06gvx2df5EaE2FG6RQVgYm994IVh/AgqUIMgKwyELlcZQEz+8FPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJEDbKwC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJEDbKwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713357751; x=1744893751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fY1cADs3Qk6OZmo7rnfEDaY0MjNYg3MkCJsjnHGkB74=;
  b=YJEDbKwCjwWfOG+UvtOApZgzISOHYXHTbWiwPnQ5FpnYI0KbR6ADxchP
   IRt2bIYY5XQ+E+LWFzFCuucINW09s2L44vaB97OOeozGnMRovvktmpU1b
   GU2JukAgdIKYKJJkXIjDahJyR1x1renI6zKxp88dquEZK4s9Ssx7EguO/
   d3SHXyo7y0PSSgExR0e7xCpc9accjRxUihV41nKJ8efKVv3lXl7C60OEB
   +PgWrkBnKe/Xug2XzERVjQkrpm2nXrXoo8wwfj3zCMxBLVGiVnyURgWbW
   OSoMcCgoU6790PefXXTlcsByeruNjdr3aubh31ES4SnkXcWaJvtFCZFxW
   A==;
X-CSE-ConnectionGUID: SUBt/wHzT6GWTfSM7iO++w==
X-CSE-MsgGUID: bdEKv7akRV6CGYVCaCAl8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9013922"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9013922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:42:28 -0700
X-CSE-ConnectionGUID: qXBa9LBtSJGzux1CFiVROQ==
X-CSE-MsgGUID: LE1Yn3XMRYShyNvn/gBdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22674089"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 05:42:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx4c9-0006aE-2L;
	Wed, 17 Apr 2024 12:42:13 +0000
Date: Wed, 17 Apr 2024 20:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 16/55]
 security/integrity/ima/ima_appraise.c:821:9: error: call to undeclared
 function 'imap_inode_set_fscaps'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202404172055.Ln27Febe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   67b9a93c9bb8c7cc4697fa1f9d0635a07fd51c83
commit: 944d62714adf41b791227b444d0d1abb05bd1f78 [16/55] ima: add hooks for fscaps operations
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240417/202404172055.Ln27Febe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172055.Ln27Febe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172055.Ln27Febe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/integrity/ima/ima_appraise.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from security/integrity/ima/ima_appraise.c:14:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:20:
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
   In file included from security/integrity/ima/ima_appraise.c:14:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:20:
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
   In file included from security/integrity/ima/ima_appraise.c:14:
   In file included from include/linux/ima.h:13:
   In file included from include/linux/kexec.h:20:
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
>> security/integrity/ima/ima_appraise.c:821:9: error: call to undeclared function 'imap_inode_set_fscaps'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     821 |         return imap_inode_set_fscaps(idmap, dentry);
         |                ^
   security/integrity/ima/ima_appraise.c:821:9: note: did you mean 'ima_inode_set_fscaps'?
   security/integrity/ima/ima_appraise.c:810:12: note: 'ima_inode_set_fscaps' declared here
     810 | static int ima_inode_set_fscaps(struct mnt_idmap *idmap, struct dentry *dentry,
         |            ^
     811 |                                 const struct vfs_caps *caps, int flags)
     812 | {
     813 |         if (evm_revalidate_status(XATTR_NAME_CAPS))
     814 |                 ima_reset_appraise_flags(d_backing_inode(dentry), false);
     815 |         return 0;
     816 | }
     817 | 
     818 | static int ima_inode_remove_fscaps(struct mnt_idmap *idmap,
     819 |                                    struct dentry *dentry)
     820 | {
     821 |         return imap_inode_set_fscaps(idmap, dentry);
         |                ~~~~~~~~~~~~~~~~~~~~~
         |                ima_inode_set_fscaps
   17 warnings and 1 error generated.


vim +/imap_inode_set_fscaps +821 security/integrity/ima/ima_appraise.c

   817	
   818	static int ima_inode_remove_fscaps(struct mnt_idmap *idmap,
   819					   struct dentry *dentry)
   820	{
 > 821		return imap_inode_set_fscaps(idmap, dentry);
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
