Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1313615F418;
	Fri, 14 Jun 2024 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381628; cv=none; b=WLwS86kX3iralDBLH/l30bqcdF5S7BNXuiemPF1x1Jd9GrasnQzO1+1q2/OjC9yWpxDuPO7oqDRIedfvb+HxpsPkZjmOIek8OdwVJnfBhmNpe+/TBt9qF6VOGfcokYp0FTyR4XEZMSxT7SwdK138bZvdIuj7L/8IxgGV/XKP4vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381628; c=relaxed/simple;
	bh=ROHvjcAId5hEmbP3jDbLllG+xbS+SnZjU7cqDuWWwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohPE7ckCEIlaRgoj9bviqOIblKjaged0YHZOIf5TMdIpVrJWlvjmqKHua/r4lB14lnjzMa4xnfNPiArG0uCD+a8wYZnN54J7o/26gSLD0rN7eNt1hDxNvGsF9BoLlS8kBUKETvsCNXV/tkECpC583VpvCtHqcQXiY4c9aggZQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klahJ4wd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klahJ4wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718381628; x=1749917628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROHvjcAId5hEmbP3jDbLllG+xbS+SnZjU7cqDuWWwaY=;
  b=klahJ4wdWZ8z5SBAXyw3tAxE44QWSNfnLSv2U8Qp3WwEN9mnq9enCuCu
   se8HF4R87YDSm1K///4IBHn7SIWqt1IhBeVeVeCoyO0ds2uxJah06+p3t
   ESqgVV5dfSRHEMSXAkWyuxqC2khA5+JClqV7QT4l/LudGL73jUbH+d3Y5
   RNLUqxku1k1dECDfcFHqjeBeOdK82LhEvqNDXKWdeZd4vGvrs1pABL9Xf
   ZQmHRIWBSEbnvWbOlUFF0OPFQfduwYgnq574APEjGgRLFD1Nu4BQR15C+
   e1VlJoubC7hogqQNbOz/RImwnV3qV+JrPKYnR7VYsk+jcAn8/WMCgWYxk
   g==;
X-CSE-ConnectionGUID: LqKv9lq0TiGGI+Qa1Xnftw==
X-CSE-MsgGUID: IsZ3603MTfCLeK6We/ttNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15109466"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15109466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 09:13:10 -0700
X-CSE-ConnectionGUID: hIeg1GZoRT2Dwnvr4jAf8w==
X-CSE-MsgGUID: g4vtyIBXQ9WMGIxlPbZvDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="41260636"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jun 2024 09:13:07 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI9Y1-0001UL-1B;
	Fri, 14 Jun 2024 16:13:05 +0000
Date: Sat, 15 Jun 2024 00:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.mount.api 1/2] fs/hostfs/hostfs_kern.c:942:8:
 error: initializing 'char *' with an expression of type 'const char *'
 discards qualifiers
Message-ID: <202406150027.UbbG1nAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount.api
head:   104eef133fd9c17e4dc28bf43f592a86f26d8a59
commit: cd140ce9f611a5e9d2a5989a282b75e55c71dab3 [1/2] hostfs: convert hostfs to use the new mount API
config: um-defconfig (https://download.01.org/0day-ci/archive/20240615/202406150027.UbbG1nAi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150027.UbbG1nAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150027.UbbG1nAi-lkp@intel.com/

Note: the brauner-vfs/vfs.mount.api HEAD 104eef133fd9c17e4dc28bf43f592a86f26d8a59 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/hostfs/hostfs_kern.c:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
   In file included from fs/hostfs/hostfs_kern.c:13:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
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
>> fs/hostfs/hostfs_kern.c:942:8: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     942 |         char *host_root = fc->source;
         |               ^           ~~~~~~~~~~
   13 warnings and 1 error generated.


vim +942 fs/hostfs/hostfs_kern.c

   937	
   938	static int hostfs_fill_super(struct super_block *sb, struct fs_context *fc)
   939	{
   940		struct hostfs_fs_info *fsi = sb->s_fs_info;
   941		struct inode *root_inode;
 > 942		char *host_root = fc->source;
   943		int err;
   944	
   945		sb->s_blocksize = 1024;
   946		sb->s_blocksize_bits = 10;
   947		sb->s_magic = HOSTFS_SUPER_MAGIC;
   948		sb->s_op = &hostfs_sbops;
   949		sb->s_d_op = &simple_dentry_operations;
   950		sb->s_maxbytes = MAX_LFS_FILESIZE;
   951		err = super_setup_bdi(sb);
   952		if (err)
   953			return err;
   954	
   955		/* NULL is printed as '(null)' by printf(): avoid that. */
   956		if (fc->source == NULL)
   957			host_root = "";
   958	
   959		fsi->host_root_path =
   960			kasprintf(GFP_KERNEL, "%s/%s", root_ino, host_root);
   961		if (fsi->host_root_path == NULL)
   962			return -ENOMEM;
   963	
   964		root_inode = hostfs_iget(sb, fsi->host_root_path);
   965		if (IS_ERR(root_inode))
   966			return PTR_ERR(root_inode);
   967	
   968		if (S_ISLNK(root_inode->i_mode)) {
   969			char *name;
   970	
   971			iput(root_inode);
   972			name = follow_link(fsi->host_root_path);
   973			if (IS_ERR(name))
   974				return PTR_ERR(name);
   975	
   976			root_inode = hostfs_iget(sb, name);
   977			kfree(name);
   978			if (IS_ERR(root_inode))
   979				return PTR_ERR(root_inode);
   980		}
   981	
   982		sb->s_root = d_make_root(root_inode);
   983		if (sb->s_root == NULL)
   984			return -ENOMEM;
   985	
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
