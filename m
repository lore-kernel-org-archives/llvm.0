Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A058728E2;
	Mon,  6 Feb 2023 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675671654; x=1707207654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9p3OLOAhx0vJ3KftHQjv5WIDLvfl7vh3EE3KbEG6T4=;
  b=Z5Ukn/BDm3AuXNogwD1ne3hwj2QfDA4UmFYO1+TfQ2IuUbXUM5RtiZQe
   wXll09wl+dXJtUHlLJOilDOfo82agPSTCI3qErgltKyH3nH0OKVg9Sg45
   AuOZ0Vceosn9BLqyPNIAav3jTeCZXjhPwfBhFG1WurY4wx+QvYKvSDEzT
   SEpVDudQXba4y+WdrjOV2CsXUNEjxuN+rtVYwLBykpgnCUBD0TPD2Owpj
   GbCf5FWKzWg4OmnPwGvLnm1bQKAC63M5g+zLyVzgItsd7TPuAIFYeaR6K
   XTp9kcUPO+wQw/hhXTHkZBZp2+Ey1wuVdgaplTKSUPueOoWO+cVOyVnRF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415374647"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415374647"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 00:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="643929836"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="643929836"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 00:20:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOwk7-0002SG-2D;
	Mon, 06 Feb 2023 08:20:51 +0000
Date: Mon, 6 Feb 2023 16:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandan.babu@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chandanr:dio-inode-completion-chain 1/1] fs/xfs/xfs_aops.c:186:8:
 warning: variable 'nr_entries' set but not used
Message-ID: <202302061659.0AclcU4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chandanr/linux dio-inode-completion-chain
head:   5f08e3ed4dcab37394794c13e3b79402ca05f3ca
commit: 5f08e3ed4dcab37394794c13e3b79402ca05f3ca [1/1] changes
config: hexagon-randconfig-r004-20230205 (https://download.01.org/0day-ci/archive/20230206/202302061659.0AclcU4i-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/chandanr/linux/commit/5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        git remote add chandanr https://github.com/chandanr/linux
        git fetch --no-tags chandanr dio-inode-completion-chain
        git checkout 5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_aops.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/xfs_aops.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/xfs_aops.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   fs/xfs/xfs_aops.c:177:21: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
   void __attribute__((optimize("O0")))
                       ^~~~~~~~~~~~~~
>> fs/xfs/xfs_aops.c:186:8: warning: variable 'nr_entries' set but not used [-Wunused-but-set-variable]
           int                     nr_entries = 0;
                                   ^
   8 warnings generated.


vim +/nr_entries +186 fs/xfs/xfs_aops.c

   176	
   177	void __attribute__((optimize("O0")))
   178	xfs_end_dio(
   179		struct work_struct	*work)
   180	{
   181		struct xfs_inode	*ip =
   182			container_of(work, struct xfs_inode, i_dio_work);
   183		struct iomap_dio	*dio;
   184		struct list_head	tmp;
   185		unsigned long		flags;
 > 186		int			nr_entries = 0;
   187	
   188		spin_lock_irqsave(&ip->i_dio_lock, flags);
   189		list_replace_init(&ip->i_dio_list, &tmp);
   190		spin_unlock_irqrestore(&ip->i_dio_lock, flags);
   191	
   192		/* chandan: do we have to sort dios? */
   193		while ((dio = list_first_entry_or_null(&tmp, struct iomap_dio,
   194								dio_list))) {
   195			struct kiocb *iocb = dio->iocb;
   196	
   197			++nr_entries;
   198			list_del_init(&dio->dio_list);
   199			iocb->ki_complete(iocb, iomap_dio_complete(dio));
   200		}
   201	
   202		return;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
