Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD85F3D68;
	Sat,  4 Nov 2023 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clCpuN26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699068582; x=1730604582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrL6XD/v87U03lGmbdYZ7DzjXs2gNRsoN8C4Dgm9WFs=;
  b=clCpuN26p4T4yD227s4R0lq8kU+X9oBHqyDvaY74K3LfSRfW5aCkEvXG
   f3pIloxdAl7k5ys7wpnbjbQidMVuKdJkMWqSBgKBx1+/1SE3SdmOZbtFG
   q+HxFchFNe67VreHVJOAAJrMiXygm3sl7N5yiHPDFWMrcPUbQkyMc/SQN
   bEf45DmNaC6dwBKXyS5DSALq3JOEpkp2jPSlqMLzVkhYVg95WjL3OUTRi
   wtOa+roXmViTSMHkvetbRxXrH0itUmYx1XoJK9qlO9+H+XXWTBIbNlnez
   XBXfjOAPBdGxQKIm7jsgHdGvtRfGNrP4QbgIW/XHnvMk8lsJeXMj/VpVw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1939519"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1939519"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832205376"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832205376"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 20:29:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7Lr-0003Lk-05;
	Sat, 04 Nov 2023 03:29:35 +0000
Date: Sat, 4 Nov 2023 11:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.dcache 16/16] fs/dcache.c:1081:27: error: passing
 'struct list_head' to parameter of incompatible type 'struct list_head *';
 take the address with &
Message-ID: <202311041152.XK4svsNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.dcache
head:   e565b3bc8b39fae7d3c4093e012df87ba1eed599
commit: e565b3bc8b39fae7d3c4093e012df87ba1eed599 [16/16] d_prune_aliases(): use a shrink list
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311041152.XK4svsNI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041152.XK4svsNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041152.XK4svsNI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/dcache.c:31:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
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
   In file included from fs/dcache.c:31:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/dcache.c:31:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
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
>> fs/dcache.c:1081:27: error: passing 'struct list_head' to parameter of incompatible type 'struct list_head *'; take the address with &
    1081 |                         to_shrink_list(dentry, dispose);
         |                                                ^~~~~~~
         |                                                &
   fs/dcache.c:898:69: note: passing argument to parameter 'list' here
     898 | static void to_shrink_list(struct dentry *dentry, struct list_head *list)
         |                                                                     ^
   fs/dcache.c:1085:21: error: passing 'struct list_head' to parameter of incompatible type 'struct list_head *'; take the address with &
    1085 |         shrink_dentry_list(dispose);
         |                            ^~~~~~~
         |                            &
   fs/internal.h:209:50: note: passing argument to parameter here
     209 | extern void shrink_dentry_list(struct list_head *);
         |                                                  ^
   12 warnings and 2 errors generated.


vim +1081 fs/dcache.c

  1067	
  1068	/*
  1069	 *	Try to kill dentries associated with this inode.
  1070	 * WARNING: you must own a reference to inode.
  1071	 */
  1072	void d_prune_aliases(struct inode *inode)
  1073	{
  1074		LIST_HEAD(dispose);
  1075		struct dentry *dentry;
  1076	
  1077		spin_lock(&inode->i_lock);
  1078		hlist_for_each_entry(dentry, &inode->i_dentry, d_u.d_alias) {
  1079			spin_lock(&dentry->d_lock);
  1080			if (!dentry->d_lockref.count)
> 1081				to_shrink_list(dentry, dispose);
  1082			spin_unlock(&dentry->d_lock);
  1083		}
  1084		spin_unlock(&inode->i_lock);
  1085		shrink_dentry_list(dispose);
  1086	}
  1087	EXPORT_SYMBOL(d_prune_aliases);
  1088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
