Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784611171C;
	Tue, 12 Sep 2023 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694561777; x=1726097777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pj5M/8h4gGgd7QikoBwCmb60lGbIlwhkqrdQH/DgIHI=;
  b=dcqfXRTWh5fhxAF7VFmeVfdkvTiaGl77r8sF2hfew0J3deNtyhmQNm/1
   /LLVIAngfrFuDZXBAyuhfsiH8q6WJKcNPy21J5r2JCpiRArJ9/L8Gml62
   EB4qzqt9nzdM3FWH9okmMhQs0icfT4QjXalemR0GUMbUcq1OEzqMIvcWu
   mcO/zv5P4ZNOyKSqkmDZDAq1hyRiVul6NaIf9e9AAA9f1D5hrQS1YRLIh
   ZCkISzsGHEdMbyrSpRoytQNH9vdydeQt5XNTxUYu/l5CNLH+EzvPliwzF
   2h37GYr5Pyb4vFB2uBm8FEZkjAcRYWatLFT5qtg38Btka5U/1nCdgV/L2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363555894"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="363555894"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720606279"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="720606279"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 16:36:15 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgCvV-0000Sv-1a;
	Tue, 12 Sep 2023 23:36:13 +0000
Date: Wed, 13 Sep 2023 07:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:noumask 10/10] fs/namei.c:3120:40: error: no member named
 's_i_flags' in 'struct super_block'; did you mean 's_iflags'?
Message-ID: <202309130756.hnDzyEvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git noumask
head:   b003e37dfced8ac4df1f4a16200e02f15ab7bff7
commit: b003e37dfced8ac4df1f4a16200e02f15ab7bff7 [10/10] fs: add a new SB_NOUMASK flag
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230913/202309130756.hnDzyEvC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130756.hnDzyEvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130756.hnDzyEvC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> fs/namei.c:3120:40: error: no member named 's_i_flags' in 'struct super_block'; did you mean 's_iflags'?
    3120 |         if (!IS_POSIXACL(dir) && !(dir->i_sb->s_i_flags & SB_I_NOUMASK))
         |                                               ^~~~~~~~~
         |                                               s_iflags
   include/linux/fs.h:1201:17: note: 's_iflags' declared here
    1201 |         unsigned long           s_iflags;       /* internal SB_I_* flags */
         |                                 ^
   12 warnings and 1 error generated.
--
>> fs/init.c:156:2: error: call to undeclared function 'mode_strip_umask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |         mode_strip_umask(d_inode(path.dentry), mode);
         |         ^
   fs/init.c:156:2: note: did you mean 'mode_strip_sgid'?
   include/linux/fs.h:1812:9: note: 'mode_strip_sgid' declared here
    1812 | umode_t mode_strip_sgid(struct mnt_idmap *idmap,
         |         ^
   fs/init.c:232:2: error: call to undeclared function 'mode_strip_umask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |         mode_strip_umask(d_inode(path.dentry), mode);
         |         ^
   fs/init.c:225:16: warning: unused variable 'inode' [-Wunused-variable]
     225 |         struct inode *inode;
         |                       ^
   1 warning and 2 errors generated.


vim +3120 fs/namei.c

  3105	
  3106	/**
  3107	 * mode_strip_umask - handle vfs umask stripping
  3108	 * @dir:	parent directory of the new inode
  3109	 * @mode:	mode of the new inode to be created in @dir
  3110	 *
  3111	 * Umask stripping depends on whether or not the filesystem supports POSIX
  3112	 * ACLs. If the filesystem doesn't support it umask stripping is done directly
  3113	 * in here. If the filesystem does support POSIX ACLs umask stripping is
  3114	 * deferred until the filesystem calls posix_acl_create().
  3115	 *
  3116	 * Returns: mode
  3117	 */
  3118	static inline umode_t mode_strip_umask(const struct inode *dir, umode_t mode)
  3119	{
> 3120		if (!IS_POSIXACL(dir) && !(dir->i_sb->s_i_flags & SB_I_NOUMASK))
  3121			mode &= ~current_umask();
  3122		return mode;
  3123	}
  3124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
