Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982F5698;
	Sat, 18 Nov 2023 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCqScrQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700304536; x=1731840536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4EzpXfuSPXqGqQnHd1XRC1/iEZEE6TxSB289ZJM1Ds=;
  b=QCqScrQ2RPbnR7RqDzFUOyfqUOkBi6Jg943QuuOzjJ95sfV4d442tCs7
   TeJdL32DoTfcEVnxGR/xfayADUrvKLOOqffKLwqJaIIgWg3sQJyHxUUFd
   9Ofd0pOHhl4pI5idDlnfNoLLD+qmJGDNELblMRLUjlCQ9OIID4A7wMbMY
   erQHJFf63VP/x5M0dEjjzg103VKKP9f3GAyx0XVzDR35Mwwsnj6q1CnWb
   wFIA2wdnvPhjMgMfzkpfvWWxfGKL6/4l17O5LWza+ug3IPZ/QGNpnlfT6
   hjs4SwDRPV/kr4aQ/kXORMa1Up/+M42raefMSvi33PBh+cqM8hdEo84Kt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371597401"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="371597401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 02:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="7263530"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2023 02:48:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Isd-0003pD-35;
	Sat, 18 Nov 2023 10:48:51 +0000
Date: Sat, 18 Nov 2023 18:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:write-pipelining 9/19] drivers/scsi/sd_test.c:34:13:
 warning: stack frame size (2688) exceeds limit (1024) in
 'test_sd_cmp_sector'
Message-ID: <202311181859.GE5EFaE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux write-pipelining
head:   f409a1d5e3ab8709f7ee3147de97200d455003e8
commit: 53da08715927f5be1d68ad383bb7a419c834ea47 [9/19] scsi: sd: Add a unit test for sd_cmp_sector()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311181859.GE5EFaE5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181859.GE5EFaE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181859.GE5EFaE5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/sd.c:40:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/scsi/sd.c:40:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/scsi/sd.c:40:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/scsi/sd.c:4146:
>> drivers/scsi/sd_test.c:34:13: warning: stack frame size (2688) exceeds limit (1024) in 'test_sd_cmp_sector' [-Wframe-larger-than]
      34 | static void test_sd_cmp_sector(struct kunit *test)
         |             ^
   7 warnings generated.


vim +/test_sd_cmp_sector +34 drivers/scsi/sd_test.c

    30	
    31	/*
    32	 * Verify that sd_cmp_sector() does what it is expected to do.
    33	 */
  > 34	static void test_sd_cmp_sector(struct kunit *test)
    35	{
    36		struct request_queue *q1 __free(kfree) =
    37			ALLOC_Q(.limits.use_zone_write_lock = true);
    38		struct request_queue *q2 __free(kfree) =
    39			ALLOC_Q(.limits.use_zone_write_lock = false);
    40		struct rq_and_cmd *cmd1 __free(kfree) = ALLOC_CMD(.rq = {
    41									  .q = q1,
    42									  .__sector = 7,
    43								  });
    44		struct rq_and_cmd *cmd2 __free(kfree) = ALLOC_CMD(.rq = {
    45									  .q = q1,
    46									  .__sector = 5,
    47								  });
    48		struct rq_and_cmd *cmd3 __free(kfree) = ALLOC_CMD(.rq = {
    49									  .q = q2,
    50									  .__sector = 7,
    51								  });
    52		struct rq_and_cmd *cmd4 __free(kfree) = ALLOC_CMD(.rq = {
    53									  .q = q2,
    54									  .__sector = 5,
    55								  });
    56		LIST_HEAD(cmd_list);
    57	
    58		list_add_tail(&cmd1->cmd.eh_entry, &cmd_list);
    59		list_add_tail(&cmd2->cmd.eh_entry, &cmd_list);
    60		list_add_tail(&cmd3->cmd.eh_entry, &cmd_list);
    61		list_add_tail(&cmd4->cmd.eh_entry, &cmd_list);
    62		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 4);
    63		list_sort(NULL, &cmd_list, sd_cmp_sector);
    64		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 4);
    65		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next, &cmd4->cmd.eh_entry);
    66		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next, &cmd3->cmd.eh_entry);
    67		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next,
    68				    &cmd1->cmd.eh_entry);
    69		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next,
    70				    &cmd2->cmd.eh_entry);
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
