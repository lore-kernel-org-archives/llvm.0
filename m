Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6C611C;
	Tue,  6 Jun 2023 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686038048; x=1717574048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFGLkQ+60lCqkwJj9y8BNFJ8rW0fTU2LpxRuPg7zmYU=;
  b=B3JuLl8AUiVpfT6hC81TWaBi9/FYyUzl5Z2Ww/qaGwV3rlBYGd7ctwAm
   q7ziuTiDC5OkpDF6SCV2UY4c+3jOJxDpCuZupWmrJEPTSzS/0rHxNBnhF
   2QiO1irjnH9rX+0mSSC9nNyozFnITRiz4q9cWSw7FBJMFdBe3bNDjHxVj
   5nyLpSAybZi/kvqkTRTQYo8n6BwFzfJJxYRFKPKL7KV/I3GRs7hN+o2xM
   5vP+c/q++hTGztANI7YMJoOGMJBf/MEEg5Q+j9vbw0M4KUcFttAiukZis
   1zW+swOKpm6+pTz4J0drNK+UT/WAT5AhEY98+UKiQ08AU79ogjtSfbQhr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346192931"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="346192931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 00:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778882648"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="778882648"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2023 00:54:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6RW1-000509-2I;
	Tue, 06 Jun 2023 07:54:05 +0000
Date: Tue, 6 Jun 2023 15:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Foster <bfoster@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:dm-6.5-thin-reserve-throwaway 10/10] drivers/md/dm.c:592:6:
 error: call to undeclared function 'dm_table_get_num_targets'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202306061525.6meUZ8rw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git dm-6.5-thin-reserve-throwaway
head:   71cbdb2ba4c52501e72d5738c0beea4a43bba53e
commit: 71cbdb2ba4c52501e72d5738c0beea4a43bba53e [10/10] xfs, block, dm-thin: dynamic block reservation support
config: hexagon-randconfig-r036-20230605 (https://download.01.org/0day-ci/archive/20230606/202306061525.6meUZ8rw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git/commit/?id=71cbdb2ba4c52501e72d5738c0beea4a43bba53e
        git remote add snitzer https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git
        git fetch --no-tags snitzer dm-6.5-thin-reserve-throwaway
        git checkout 71cbdb2ba4c52501e72d5738c0beea4a43bba53e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061525.6meUZ8rw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/dm.c:9:
   In file included from drivers/md/dm-core.h:15:
   In file included from include/linux/blk-mq.h:5:
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
   In file included from drivers/md/dm.c:9:
   In file included from drivers/md/dm-core.h:15:
   In file included from include/linux/blk-mq.h:5:
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
   In file included from drivers/md/dm.c:9:
   In file included from drivers/md/dm-core.h:15:
   In file included from include/linux/blk-mq.h:5:
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
>> drivers/md/dm.c:592:6: error: call to undeclared function 'dm_table_get_num_targets'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     592 |         if (dm_table_get_num_targets(map) != 1)
         |             ^
   6 warnings and 1 error generated.


vim +/dm_table_get_num_targets +592 drivers/md/dm.c

   570	
   571	/*
   572	 * FIXME: factor out common helper that can be used by
   573	 * multiple block_device_operations -> target methods
   574	 * (including dm_blk_ioctl above)
   575	 */
   576	
   577	static int dm_blk_reserve_space(struct block_device *bdev, int mode,
   578					sector_t offset, sector_t len, sector_t *res)
   579	{
   580		struct mapped_device *md = bdev->bd_disk->private_data;
   581		int srcu_idx;
   582		struct dm_table *map;
   583		struct dm_target *tgt;
   584		int r = -EINVAL;
   585	
   586		map = dm_get_live_table(md, &srcu_idx);
   587	
   588		if (!map || !dm_table_get_size(map))
   589			goto out;
   590	
   591		/* We only support devices that have a single target */
 > 592		if (dm_table_get_num_targets(map) != 1)
   593			goto out;
   594	
   595		tgt = dm_table_get_target(map, 0);
   596		if (!tgt->type->reserve_space)
   597			goto out;
   598	
   599		if (dm_suspended_md(md)) {
   600			r = -EAGAIN;
   601			goto out;
   602		}
   603	
   604		r = tgt->type->reserve_space(tgt, mode, offset, len, res);
   605	out:
   606		dm_put_live_table(md, srcu_idx);
   607	
   608		return r;
   609	}
   610	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
