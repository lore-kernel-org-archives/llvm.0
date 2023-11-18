Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9EF5382;
	Sat, 18 Nov 2023 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjYzT44N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700273285; x=1731809285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crpn32dMwjJpTBwt/La0O2h3HWNXbRrUYHI4f6Xx7TQ=;
  b=SjYzT44NUEApFihaDArzM//y2PXItE839yZHJUPMhkEQtWOKEla52aQu
   iCCIS/sVMCBuVFwcWbqADc9gY5fLkLQ2ly4K9o2oDoQdqJffsdRehL9Cd
   9051e3Kz/o9nhd/wve4e2POUigUfh5EqdvaIJnj0ltf1GsNP1mJs35zbY
   C/zq0P94O2emAVZIRdScGn0h4R/U/DwsJ/ShQmH0W1u+LOblMDypaWD5o
   SRQH+jlNarTOq4rpCG8mnpOcJ0DWcDBwaF3ZcwLvb/MOfwt+VTrG6vq7o
   IGOWSi7v5msVj/WyY06negTp4CCpkwVqX/u5ShGli9+djbSvL5CGaB+kJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390260116"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390260116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 18:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="800652499"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="800652499"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Nov 2023 18:08:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4AkZ-0003Q6-2k;
	Sat, 18 Nov 2023 02:08:00 +0000
Date: Sat, 18 Nov 2023 10:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:write-pipelining 7/19]
 drivers/scsi/scsi_error_test.c:145:31: warning: variable 'cmd1' is
 uninitialized when used here
Message-ID: <202311181058.nxcN5Yjb-lkp@intel.com>
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
commit: 918e6d40ff608afa6e0ea896550dde41dd22943d [7/19] scsi: core: Add unit tests for scsi_call_prepare_resubmit()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311181058.nxcN5Yjb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181058.nxcN5Yjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181058.nxcN5Yjb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/scsi_error.c:26:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/scsi/scsi_error.c:26:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/scsi/scsi_error.c:26:
   In file included from include/linux/interrupt.h:11:
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
   In file included from drivers/scsi/scsi_error.c:2626:
>> drivers/scsi/scsi_error_test.c:145:31: warning: variable 'cmd1' is uninitialized when used here [-Wuninitialized]
     145 |         BUILD_BUG_ON(scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq);
         |                                      ^~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |                          ^~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                                          ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/scsi/scsi_error_test.c:138:9: note: initialize the variable 'cmd1' to silence this warning
     138 |         } *cmd1 __free(kfree), *cmd2 __free(kfree), *cmd3 __free(kfree),
         |                ^
         |                 = NULL
>> drivers/scsi/scsi_error_test.c:40:13: warning: stack frame size (4104) exceeds limit (1024) in 'test_prepare_resubmit1' [-Wframe-larger-than]
      40 | static void test_prepare_resubmit1(struct kunit *test)
         |             ^
>> drivers/scsi/scsi_error_test.c:120:13: warning: stack frame size (7464) exceeds limit (1024) in 'test_prepare_resubmit2' [-Wframe-larger-than]
     120 | static void test_prepare_resubmit2(struct kunit *test)
         |             ^
   9 warnings generated.


vim +/cmd1 +145 drivers/scsi/scsi_error_test.c

    35	
    36	/*
    37	 * Verify that .eh_prepare_resubmit() is not called if needs_prepare_resubmit is
    38	 * false.
    39	 */
  > 40	static void test_prepare_resubmit1(struct kunit *test)
    41	{
    42		struct gendisk *disk __free(kfree) = ALLOC_DISK();
    43		struct request_queue *q __free(kfree) = ALLOC_Q(
    44			.limits = {
    45				.driver_preserves_write_order = false,
    46				.use_zone_write_lock = true,
    47				.zoned = BLK_ZONED_HM,
    48			}
    49		);
    50		static struct scsi_driver uld = {
    51			.eh_prepare_resubmit = uld_prepare_resubmit,
    52		};
    53		static const struct scsi_host_template host_template;
    54		static struct Scsi_Host host = {
    55			.hostt = &host_template,
    56		};
    57		struct scsi_device *dev __free(kfree) = ALLOC_SDEV(
    58			.request_queue = q,
    59			.sdev_gendev.driver = &uld.gendrv,
    60			.host = &host,
    61		);
    62		struct rq_and_cmd {
    63			struct request rq;
    64			struct scsi_cmnd cmd;
    65		} *cmd1 __free(kfree) = NULL, *cmd2 __free(kfree);
    66		LIST_HEAD(cmd_list);
    67	
    68		BUILD_BUG_ON(scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq);
    69	
    70		q->disk = disk;
    71		disk->queue = q;
    72		cmd1 = ALLOC_CMD(
    73			.rq = {
    74				.q = q,
    75				.cmd_flags = REQ_OP_WRITE,
    76				.__sector = 2,
    77			},
    78			.cmd.device = dev,
    79		);
    80		cmd2 = ALLOC_CMD(
    81			.rq = {
    82				.q = q,
    83				.cmd_flags = REQ_OP_WRITE,
    84				.__sector = 1,
    85			},
    86			.cmd.device = dev,
    87		);
    88		list_add_tail(&cmd1->cmd.eh_entry, &cmd_list);
    89		list_add_tail(&cmd2->cmd.eh_entry, &cmd_list);
    90	
    91		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 2);
    92		kunit_test = test;
    93		scsi_call_prepare_resubmit(&host, &cmd_list);
    94		kunit_test = NULL;
    95		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 2);
    96		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next, &cmd1->cmd.eh_entry);
    97		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next, &cmd2->cmd.eh_entry);
    98	}
    99	
   100	static struct scsi_driver *uld1, *uld2, *uld3;
   101	
   102	static void uld1_prepare_resubmit(struct list_head *cmd_list)
   103	{
   104		struct scsi_cmnd *cmd;
   105	
   106		KUNIT_EXPECT_EQ(kunit_test, list_count_nodes(cmd_list), 2);
   107		list_for_each_entry(cmd, cmd_list, eh_entry)
   108			KUNIT_EXPECT_PTR_EQ(kunit_test, scsi_cmd_to_driver(cmd), uld1);
   109	}
   110	
   111	static void uld2_prepare_resubmit(struct list_head *cmd_list)
   112	{
   113		struct scsi_cmnd *cmd;
   114	
   115		KUNIT_EXPECT_EQ(kunit_test, list_count_nodes(cmd_list), 2);
   116		list_for_each_entry(cmd, cmd_list, eh_entry)
   117			KUNIT_EXPECT_PTR_EQ(kunit_test, scsi_cmd_to_driver(cmd), uld2);
   118	}
   119	
 > 120	static void test_prepare_resubmit2(struct kunit *test)
   121	{
   122		static const struct scsi_host_template host_template = {
   123			.needs_prepare_resubmit = true,
   124		};
   125		static struct Scsi_Host host = {
   126			.hostt = &host_template,
   127		};
   128		struct gendisk *disk __free(kfree);
   129		struct request_queue *q __free(kfree) =
   130			ALLOC_Q(.limits = {
   131					.driver_preserves_write_order = true,
   132					.use_zone_write_lock = false,
   133					.zoned = BLK_ZONED_HM,
   134				});
   135		struct rq_and_cmd {
   136			struct request rq;
   137			struct scsi_cmnd cmd;
   138		} *cmd1 __free(kfree), *cmd2 __free(kfree), *cmd3 __free(kfree),
   139			*cmd4 __free(kfree), *cmd5 __free(kfree), *cmd6 __free(kfree);
   140		struct scsi_device *dev1 __free(kfree), *dev2 __free(kfree),
   141			*dev3 __free(kfree);
   142		struct scsi_driver *uld __free(kfree);
   143		LIST_HEAD(cmd_list);
   144	
 > 145		BUILD_BUG_ON(scsi_cmd_to_rq(&cmd1->cmd) != &cmd1->rq);
   146	
   147		uld = kzalloc(3 * sizeof(*uld), GFP_KERNEL);
   148		uld1 = &uld[0];
   149		uld1->eh_prepare_resubmit = uld1_prepare_resubmit;
   150		uld2 = &uld[1];
   151		uld2->eh_prepare_resubmit = uld2_prepare_resubmit;
   152		uld3 = &uld[2];
   153		disk = ALLOC_DISK();
   154		disk->queue = q;
   155		q->disk = disk;
   156		dev1 = ALLOC_SDEV(.sdev_gendev.driver = &uld1->gendrv,
   157				  .request_queue = q, .host = &host);
   158		dev2 = ALLOC_SDEV(.sdev_gendev.driver = &uld2->gendrv,
   159				  .request_queue = q, .host = &host);
   160		dev3 = ALLOC_SDEV(.sdev_gendev.driver = &uld3->gendrv,
   161				  .request_queue = q, .host = &host);
   162		cmd1 = ALLOC_CMD(
   163			.rq = {
   164				.q = q,
   165				.cmd_flags = REQ_OP_WRITE,
   166				.__sector = 3,
   167			},
   168			.cmd.device = dev1,
   169				 );
   170		cmd2 = ALLOC_CMD();
   171		*cmd2 = *cmd1;
   172		cmd2->rq.__sector = 4;
   173		cmd3 = ALLOC_CMD(
   174			.rq = {
   175				.q = q,
   176				.cmd_flags = REQ_OP_WRITE,
   177				.__sector = 1,
   178			},
   179			.cmd.device = dev2,
   180				 );
   181		cmd4 = kmemdup(cmd3, sizeof(*cmd3), GFP_KERNEL);
   182		cmd4->rq.__sector = 2;
   183		cmd5 = ALLOC_CMD(
   184			.rq = {
   185				.q = q,
   186				.cmd_flags = REQ_OP_WRITE,
   187				.__sector = 5,
   188			},
   189			.cmd.device = dev3,
   190				 );
   191		cmd6 = kmemdup(cmd5, sizeof(*cmd3), GFP_KERNEL);
   192		cmd6->rq.__sector = 6;
   193		list_add_tail(&cmd3->cmd.eh_entry, &cmd_list);
   194		list_add_tail(&cmd1->cmd.eh_entry, &cmd_list);
   195		list_add_tail(&cmd2->cmd.eh_entry, &cmd_list);
   196		list_add_tail(&cmd5->cmd.eh_entry, &cmd_list);
   197		list_add_tail(&cmd6->cmd.eh_entry, &cmd_list);
   198		list_add_tail(&cmd4->cmd.eh_entry, &cmd_list);
   199	
   200		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 6);
   201		kunit_test = test;
   202		scsi_call_prepare_resubmit(&host, &cmd_list);
   203		kunit_test = NULL;
   204		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 6);
   205		KUNIT_EXPECT_TRUE(test, uld1 < uld2);
   206		KUNIT_EXPECT_TRUE(test, uld2 < uld3);
   207		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next, &cmd1->cmd.eh_entry);
   208		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next, &cmd2->cmd.eh_entry);
   209		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next,
   210				    &cmd3->cmd.eh_entry);
   211		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next,
   212				    &cmd4->cmd.eh_entry);
   213		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next->next,
   214				    &cmd5->cmd.eh_entry);
   215		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next->next->next,
   216				    &cmd6->cmd.eh_entry);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
