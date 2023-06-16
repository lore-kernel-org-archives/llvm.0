Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB16117;
	Fri, 16 Jun 2023 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686915266; x=1718451266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbr4jm8n4C36LAYiMrKKV2rpEeX5CVWUxcQZtgju0xQ=;
  b=SMvx0Gql5pNULeJrIoL9ntblbQDAiF8t2zA4Jz5vtrHMP0IK5Mk9URIY
   7lyufcF1wyEj7iEOabydyvBaDEZUc6K3fxxARk/wHV03HHa5s+cDJfI6/
   IVG54Fsl7IwfVE29tQLCcNK7lbE29YAvxo8B+NlZrk0D+Yn+2MyOkYzcL
   x5epvbRLkK0YQAVb5uNARS7sh5FrnHjoXV5CILWehlGcJ7d6fCPi1SYFx
   MZeSAvDljBZzCWRhUqEkwV1d4ysLWIFaCOpFqQib5NfG5Nlcw4gxauUQv
   u5r+oCv30zWB9hA1lEafuzdQ3KJtPzr2+edYlr1nO8h+jSX7Qi1SMRBLF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445574688"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="445574688"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 04:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782872186"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="782872186"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 04:34:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA7ih-0001BM-3A;
	Fri, 16 Jun 2023 11:34:23 +0000
Date: Fri, 16 Jun 2023 19:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 19/20]
 fs/quota/dquot.c:2957:9: error: too many arguments to function call,
 expected 2, have 3
Message-ID: <202306161928.Z1SpdBON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: 5e772f5e4567129c1d9e7b0dd05316dcd4ffec6b [19/20] sysctl: Add ARRAY_SIZE to the register_sysctl_init call
config: hexagon-randconfig-r035-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161928.Z1SpdBON-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161928.Z1SpdBON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161928.Z1SpdBON-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/quota/dquot.c:67:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from fs/quota/dquot.c:67:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/quota/dquot.c:67:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
>> fs/quota/dquot.c:2957:9: error: too many arguments to function call, expected 2, have 3
    2957 |         register_sysctl_init("fs/quota", fs_dqstats_table,
         |         ~~~~~~~~~~~~~~~~~~~~
    2958 |                              ARRAY_SIZE(fs_dqstats_table));
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:25: note: expanded from macro 'ARRAY_SIZE'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:248:20: note: 'register_sysctl_init' declared here
     248 | static inline void register_sysctl_init(const char *path, struct ctl_table *table)
         |                    ^
   6 warnings and 1 error generated.


vim +2957 fs/quota/dquot.c

  2948	
  2949	static int __init dquot_init(void)
  2950	{
  2951		int i, ret;
  2952		unsigned long nr_hash, order;
  2953	
  2954		printk(KERN_NOTICE "VFS: Disk quotas %s\n", __DQUOT_VERSION__);
  2955	
  2956		register_sysctl_init("fs/quota", fs_dqstats_table,
> 2957				     ARRAY_SIZE(fs_dqstats_table));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
