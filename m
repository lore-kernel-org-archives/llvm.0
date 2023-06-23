Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3553A38;
	Fri, 23 Jun 2023 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687490578; x=1719026578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=solkhqMpo5XNrKA1PPRv8uEUZc3lgINAUv4/pQtrONk=;
  b=MeQGGsEHLpPnOR1zBZh04q/xnyujupD7ApQSjHNls5Nf7BwJhjId4llP
   N9QKnqNRwy1rP8RH8gXJjxGOfbygk2VsnBtGEa544NpEHHrrUTnhnn0Md
   uI0q/Rwf2gJbhTWu9DphiSPwwmooVCvFp3cY24oiLBBsuu+dr2z3yQzFv
   CYXQaaURB+ZjRTlk0NI0G9Cce2YTuiQipDh8nx6d94g9qymLka7zZUjOM
   2GvkhzRFCar4mVWzVBdrzCM8rQOi91rsJMCvywK4NwJVmOgZeYA4edgBF
   wIVogyhYxT4eq+mLe2X8iz+CVF/ekpN0j6nZLE4ilI9CfeNyvTqJdL2l+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350440068"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="350440068"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 20:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="744849072"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="744849072"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jun 2023 20:22:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCXNu-0007xN-2o;
	Fri, 23 Jun 2023 03:22:54 +0000
Date: Fri, 23 Jun 2023 11:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [device-mapper-dm:for-next 19/24] drivers/md/dm-ioctl.c:1402:15:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202306231121.8VDClqLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   7d8bae011ec676d6c0a6ea18f2b74c9c32d57849
commit: 5df1daff2cc63af7971c0643134f3372aa3b33a1 [19/24] dm ioctl: Check dm_target_spec is sufficiently aligned
config: hexagon-randconfig-r041-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231121.8VDClqLC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231121.8VDClqLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231121.8VDClqLC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-ioctl.c:9:
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
   In file included from drivers/md/dm-ioctl.c:9:
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
   In file included from drivers/md/dm-ioctl.c:9:
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
>> drivers/md/dm-ioctl.c:1402:15: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1402 |                 DMERR("Next dm_target_spec (offset %u) is not %lu-byte aligned",
         |                                                               ~~~
         |                                                               %u
    1403 |                       next, __alignof__(struct dm_target_spec));
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device-mapper.h:626:47: note: expanded from macro 'DMERR'
     626 | #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
         |                                       ~~~     ^~~~~~~~~~~
   include/linux/printk.h:498:33: note: expanded from macro 'pr_err'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   7 warnings generated.


vim +1402 drivers/md/dm-ioctl.c

  1393	
  1394	static int next_target(struct dm_target_spec *last, uint32_t next, void *end,
  1395			       struct dm_target_spec **spec, char **target_params)
  1396	{
  1397		static_assert(__alignof__(struct dm_target_spec) <= 8,
  1398			"struct dm_target_spec must not require more than 8-byte alignment");
  1399	
  1400		if (next % __alignof__(struct dm_target_spec)) {
  1401			DMERR("Next dm_target_spec (offset %u) is not %lu-byte aligned",
> 1402			      next, __alignof__(struct dm_target_spec));
  1403			return -EINVAL;
  1404		}
  1405	
  1406		*spec = (struct dm_target_spec *) ((unsigned char *) last + next);
  1407		*target_params = (char *) (*spec + 1);
  1408	
  1409		if (*spec < (last + 1))
  1410			return -EINVAL;
  1411	
  1412		return invalid_str(*target_params, end);
  1413	}
  1414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
