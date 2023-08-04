Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5E1C20;
	Fri,  4 Aug 2023 04:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691122627; x=1722658627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6QGqsUTnjESN8RGHG6sUqDN+4kOZEzzSqvOcsTBuSAw=;
  b=Do/LAeZSVjisZ4WWv3cbPiqpbT9ylY2PC5hFGrpNFA0NWIQYWNGow93D
   sB+H3siCbwboVDqbJCb9BAFGS0mqcSGFLNb9Qq+wERFgQvz5EyUIpdFEi
   IX63KdwzJ7w1S/TYEJ+AfSq9x/LhJQGaHEWa1CImPHMGCR9yQ8ofO5tuR
   9VlUS/+j1HtNCx7MwoP84PuX7gM/AlBlYbnbqeDapovf68H6R4KhWMbdE
   mvL9tZNYgrndHmGeGIo7/9jdDKvekwtc7/MNzVAdPtXdv+2c/dhRdBkUB
   839NIylxxO1CwZC8HgJbhdH/0rwepprFJIdswwfIV6+yFOtFVXxZl+Zx4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368963867"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="368963867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 21:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="764940280"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="764940280"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2023 21:17:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRmFL-0002c0-2c;
	Fri, 04 Aug 2023 04:17:03 +0000
Date: Fri, 4 Aug 2023 12:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] xfs: stabilize fs summary counters for online fsck
Message-ID: <202308041118.zlEnQrbD-lkp@intel.com>
References: <20230803233028.GG11352@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803233028.GG11352@frogsfrogsfrogs>

Hi Darrick,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[cannot apply to dgc-xfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darrick-J-Wong/xfs-stabilize-fs-summary-counters-for-online-fsck/20230804-073132
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230803233028.GG11352%40frogsfrogsfrogs
patch subject: [PATCH v2] xfs: stabilize fs summary counters for online fsck
config: hexagon-randconfig-r022-20230803 (https://download.01.org/0day-ci/archive/20230804/202308041118.zlEnQrbD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041118.zlEnQrbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041118.zlEnQrbD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/fscounters.c:6:
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
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/fscounters.c:6:
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
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/fscounters.c:6:
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
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/xfs/scrub/fscounters.c:136:40: error: use of undeclared identifier 'FREEZE_HOLDER_KERNEL'
     136 |         error = freeze_super(sc->mp->m_super, FREEZE_HOLDER_KERNEL);
         |                                               ^
   fs/xfs/scrub/fscounters.c:148:38: error: use of undeclared identifier 'FREEZE_HOLDER_KERNEL'
     148 |         error = thaw_super(sc->mp->m_super, FREEZE_HOLDER_KERNEL);
         |                                             ^
   6 warnings and 2 errors generated.


vim +/FREEZE_HOLDER_KERNEL +136 fs/xfs/scrub/fscounters.c

   129	
   130	static inline int
   131	xchk_fsfreeze(
   132		struct xfs_scrub	*sc)
   133	{
   134		int			error;
   135	
 > 136		error = freeze_super(sc->mp->m_super, FREEZE_HOLDER_KERNEL);
   137		trace_xchk_fsfreeze(sc, error);
   138		return error;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
