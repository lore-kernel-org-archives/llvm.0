Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB2933C4;
	Tue, 16 May 2023 04:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684211875; x=1715747875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNIBWHYY7fFCkFeli0M5UnpbFFmnKq+1Qmte6Ahz3uU=;
  b=MF16pAvOUo+49mMnFJkntm0wCGE85ojuLmkq0bwvm2tuOfBD45bmC5ZU
   V7Dlm97BCX6Xq4nWdZkDRiCFMGS5du77HVZgtrCK7Ov61N/CWWTEc62Kj
   Qa+cwNqxnOX1a3OSsOlLYOh1rvNTuuCS6ISTBQgKhkooaAcY/DF6qK0wZ
   5ik61aJUlrW+N8S0D90JuOUhun/NoaXglj5nxzRNmKKGOn4xdYbL05QwF
   3+Ajkxd16jKGTdtksdJds5RY8pHSnbjgh/3nmlxMhIhjFeF1sT+3ZVqFR
   h0Krg/L6XuoT0x0qXjr+FNNyVxf6X82bJVmcP9+fPuNePWC/1vr7lBX6N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350215130"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="350215130"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 21:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731859848"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="731859848"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 May 2023 21:37:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pymRc-0006y6-1U;
	Tue, 16 May 2023 04:37:52 +0000
Date: Tue, 16 May 2023 12:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 6/18]
 block/bfq-iosched.c:7663:10: error: use of undeclared identifier
 'blk_mq_debugfs_rq_show'; did you mean 'blk_mq_debugfs_register'?
Message-ID: <202305161246.hzmkopkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   21c7b3f9031688e908ba662288da9349522e71f9
commit: 5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5 [6/18] block, bfq: Export more information to debugfs
config: hexagon-randconfig-r041-20230515 (https://download.01.org/0day-ci/archive/20230516/202305161246.hzmkopkN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 5ea8c1a1b20acc1cbbcf22f4872d87ef8e35fbd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161246.hzmkopkN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/bfq-iosched.c:118:
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
   In file included from block/bfq-iosched.c:118:
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
   In file included from block/bfq-iosched.c:118:
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
>> block/bfq-iosched.c:7663:10: error: use of undeclared identifier 'blk_mq_debugfs_rq_show'; did you mean 'blk_mq_debugfs_register'?
           .show = blk_mq_debugfs_rq_show,
                   ^~~~~~~~~~~~~~~~~~~~~~
                   blk_mq_debugfs_register
   block/blk-mq-debugfs.h:39:20: note: 'blk_mq_debugfs_register' declared here
   static inline void blk_mq_debugfs_register(struct request_queue *q)
                      ^
>> block/bfq-iosched.c:7663:10: error: incompatible function pointer types initializing 'int (*)(struct seq_file *, void *)' with an expression of type 'void (struct request_queue *)' [-Wincompatible-function-pointer-types]
           .show = blk_mq_debugfs_rq_show,
                   ^~~~~~~~~~~~~~~~~~~~~~
>> block/bfq-iosched.c:7712:6: error: call to undeclared function '__blk_mq_debugfs_rq_show'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                           __blk_mq_debugfs_rq_show(m, rq);
                                           ^
   block/bfq-iosched.c:7712:6: note: did you mean 'blk_mq_debugfs_register'?
   block/blk-mq-debugfs.h:39:20: note: 'blk_mq_debugfs_register' declared here
   static inline void blk_mq_debugfs_register(struct request_queue *q)
                      ^
>> block/bfq-iosched.c:7721:64: error: array has incomplete element type 'const struct blk_mq_debugfs_attr'
   static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
                                                                  ^
   block/elevator.h:11:8: note: forward declaration of 'struct blk_mq_debugfs_attr'
   struct blk_mq_debugfs_attr;
          ^
   6 warnings and 4 errors generated.


vim +7663 block/bfq-iosched.c

  7658	
  7659	static const struct seq_operations bfq_dispatch_list_ops = {
  7660		.start = bfq_dispatch_start,
  7661		.next = bfq_dispatch_next,
  7662		.stop = bfq_dispatch_stop,
> 7663		.show = blk_mq_debugfs_rq_show,
  7664	};
  7665	
  7666	static int bfq_tot_rq_in_driver_show(void *data, struct seq_file *m)
  7667	{
  7668		struct request_queue *q = data;
  7669		struct bfq_data *bfqd = q->elevator->elevator_data;
  7670	
  7671		seq_printf(m, "%u\n", READ_ONCE(bfqd->tot_rq_in_driver));
  7672		return 0;
  7673	}
  7674	
  7675	static int bfq_queued_show(void *data, struct seq_file *m)
  7676	{
  7677		struct request_queue *q = data;
  7678		struct bfq_data *bfqd = q->elevator->elevator_data;
  7679	
  7680		seq_printf(m, "%u\n", READ_ONCE(bfqd->queued));
  7681		return 0;
  7682	}
  7683	
  7684	static int bfq_queued_list_show(void *data, struct seq_file *m)
  7685	{
  7686		struct request_queue *q = data;
  7687		struct bfq_data *bfqd = q->elevator->elevator_data;
  7688		struct io_cq *icq;
  7689	
  7690		spin_lock_irq(&q->queue_lock);
  7691		list_for_each_entry(icq, &q->icq_list, q_node) {
  7692			struct bfq_io_cq *bic = icq_to_bic(icq);
  7693			unsigned int actuator, is_sync;
  7694	
  7695			seq_printf(m, "icq = %p; bic = %p\n", icq, bic);
  7696			for (actuator = 0; actuator < bfqd->num_actuators; actuator++) {
  7697				seq_printf(m, "actuator = %u\n", actuator);
  7698				for (is_sync = 0; is_sync < 2; is_sync++) {
  7699					struct bfq_queue *bfq =
  7700						bic_to_bfqq(bic, is_sync, actuator);
  7701					struct request *rq;
  7702	
  7703					if (!bfq)
  7704						continue;
  7705					seq_printf(
  7706						m,
  7707						"is_sync = %u; busy %u; dispatched %u; queued %u %u\n",
  7708						is_sync, bfq_bfqq_busy(bfq),
  7709						bfq->dispatched, bfq->queued[0],
  7710						bfq->queued[1]);
  7711					list_for_each_entry(rq, &bfq->fifo, queuelist)
> 7712						__blk_mq_debugfs_rq_show(m, rq);
  7713				}
  7714			}
  7715		}
  7716		spin_unlock_irq(&q->queue_lock);
  7717	
  7718		return 0;
  7719	}
  7720	
> 7721	static const struct blk_mq_debugfs_attr bfq_queue_debugfs_attrs[] = {
  7722		{ "busy_queues0", 0444, bfq_busy_queues0_show },
  7723		{ "busy_queues1", 0444, bfq_busy_queues1_show },
  7724		{ "busy_queues2", 0444, bfq_busy_queues2_show },
  7725		{ "dispatch_list", 0400, .seq_ops = &bfq_dispatch_list_ops },
  7726		{ "tot_rq_in_driver", 0444, bfq_tot_rq_in_driver_show },
  7727		{ "queued", 0444, bfq_queued_show },
  7728		{ "queued_list", 0400, bfq_queued_list_show },
  7729		{},
  7730	};
  7731	static struct elevator_type iosched_bfq_mq = {
  7732		.ops = {
  7733			.limit_depth		= bfq_limit_depth,
  7734			.prepare_request	= bfq_prepare_request,
  7735			.requeue_request        = bfq_finish_requeue_request,
  7736			.finish_request		= bfq_finish_request,
  7737			.exit_icq		= bfq_exit_icq,
  7738			.insert_requests	= bfq_insert_requests,
  7739			.dispatch_request	= bfq_dispatch_request,
  7740			.next_request		= elv_rb_latter_request,
  7741			.former_request		= elv_rb_former_request,
  7742			.allow_merge		= bfq_allow_bio_merge,
  7743			.bio_merge		= bfq_bio_merge,
  7744			.request_merge		= bfq_request_merge,
  7745			.requests_merged	= bfq_requests_merged,
  7746			.request_merged		= bfq_request_merged,
  7747			.has_work		= bfq_has_work,
  7748			.depth_updated		= bfq_depth_updated,
  7749			.init_hctx		= bfq_init_hctx,
  7750			.init_sched		= bfq_init_queue,
  7751			.exit_sched		= bfq_exit_queue,
  7752		},
  7753	
  7754		.icq_size =		sizeof(struct bfq_io_cq),
  7755		.icq_align =		__alignof__(struct bfq_io_cq),
  7756		.elevator_attrs =	bfq_attrs,
  7757		.queue_debugfs_attrs =	bfq_queue_debugfs_attrs,
  7758		.elevator_name =	"bfq",
  7759		.elevator_owner =	THIS_MODULE,
  7760	};
  7761	MODULE_ALIAS("bfq-iosched");
  7762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
