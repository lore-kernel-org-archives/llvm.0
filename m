Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863617C5;
	Sat,  6 May 2023 06:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683354104; x=1714890104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlif7qAHOY81Muq2SdRaFE9KO5LOpXVk24rlwwbxoL8=;
  b=D0MYFDqx6AsOiAOkJmwTD2jbUfFSc/KeXV3RqarEhI3RXzQHh8j6XT4W
   N4fdYqOGScyxPdJDZH82+VvB1kF7M7BZeaDXldmZYGfUeFfdCKbQaH3j1
   /z5Vwvi7shmD9dqIbPb6kr+kyDeJghilBxn+gjBV5KDrkmvxgW8bLd3hr
   TQggXHi9uTZaIkf+3DsKlZE6odL/LPBLFE6N3L1lQ+pUJPd97nf83kUBj
   rhthWi+nhouIYgj2AsQjviyDvE1E3oKQjiZqOjWiYyTb5ZZ1h/rwU9uBA
   etEerJCqKVFrJgsC38BYtOdeHRz9InueNtOzEvcIt8ZiU1qo7e8X0zjom
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333782517"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="333782517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 23:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="1027779623"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="1027779623"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 May 2023 23:21:41 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvBIa-0001Cr-2X;
	Sat, 06 May 2023 06:21:40 +0000
Date: Sat, 6 May 2023 14:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 8/11] block/mq-deadline.c:785:43: error:
 incompatible pointer types passing 'struct list_head **' to parameter of
 type 'struct list_head *'; remove &
Message-ID: <202305061437.7YgxVCFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   e91ed2d18e87139c27a6762b8cddd333513bad93
commit: bf9e4bcb2a49d89424f6d997a50bba59cfbe856c [8/11] block: mq-deadline: Reduce lock contention
config: hexagon-randconfig-r045-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061437.7YgxVCFa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/bf9e4bcb2a49d89424f6d997a50bba59cfbe856c
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche mq-deadline
        git checkout bf9e4bcb2a49d89424f6d997a50bba59cfbe856c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061437.7YgxVCFa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/mq-deadline.c:10:
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
   In file included from block/mq-deadline.c:10:
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
   In file included from block/mq-deadline.c:10:
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
>> block/mq-deadline.c:785:43: error: incompatible pointer types passing 'struct list_head **' to parameter of type 'struct list_head *'; remove & [-Werror,-Wincompatible-pointer-types]
           if (blk_mq_sched_try_insert_merge(q, rq, &free))
                                                    ^~~~~
   block/blk-mq-sched.h:15:26: note: passing argument to parameter 'free' here
                                      struct list_head *free);
                                                        ^
>> block/mq-deadline.c:831:23: error: passing 'struct list_head' to parameter of incompatible type 'struct list_head *'; take the address with &
           blk_mq_free_requests(free);
                                ^~~~
                                &
   block/blk-mq.h:382:59: note: passing argument to parameter 'list' here
   static inline void blk_mq_free_requests(struct list_head *list)
                                                             ^
   6 warnings and 2 errors generated.


vim +785 block/mq-deadline.c

   755	
   756	/*
   757	 * add rq to rbtree and fifo
   758	 */
   759	static void dd_insert_request(struct blk_mq_hw_ctx *hctx, struct request *rq,
   760				      blk_insert_t flags, struct list_head *free)
   761	{
   762		struct request_queue *q = hctx->queue;
   763		struct deadline_data *dd = q->elevator->elevator_data;
   764		const enum dd_data_dir data_dir = rq_data_dir(rq);
   765		u16 ioprio = req_get_ioprio(rq);
   766		u8 ioprio_class = IOPRIO_PRIO_CLASS(ioprio);
   767		struct dd_per_prio *per_prio;
   768		enum dd_prio prio;
   769	
   770		lockdep_assert_held(&dd->lock);
   771	
   772		/*
   773		 * This may be a requeue of a write request that has locked its
   774		 * target zone. If it is the case, this releases the zone lock.
   775		 */
   776		blk_req_zone_write_unlock(rq);
   777	
   778		prio = ioprio_class_to_prio[ioprio_class];
   779		per_prio = &dd->per_prio[prio];
   780		if (!rq->elv.priv[0]) {
   781			per_prio->stats.inserted++;
   782			rq->elv.priv[0] = (void *)(uintptr_t)1;
   783		}
   784	
 > 785		if (blk_mq_sched_try_insert_merge(q, rq, &free))
   786			return;
   787	
   788		trace_block_rq_insert(rq);
   789	
   790		if (flags & BLK_MQ_INSERT_AT_HEAD) {
   791			list_add(&rq->queuelist, &per_prio->dispatch);
   792			rq->fifo_time = jiffies;
   793		} else {
   794			deadline_add_rq_rb(per_prio, rq);
   795	
   796			if (rq_mergeable(rq)) {
   797				elv_rqhash_add(q, rq);
   798				if (!q->last_merge)
   799					q->last_merge = rq;
   800			}
   801	
   802			/*
   803			 * set expire time and add to fifo list
   804			 */
   805			rq->fifo_time = jiffies + dd->fifo_expire[data_dir];
   806			list_add_tail(&rq->queuelist, &per_prio->fifo_list[data_dir]);
   807		}
   808	}
   809	
   810	/*
   811	 * Called from blk_mq_insert_request() or blk_mq_dispatch_plug_list().
   812	 */
   813	static void dd_insert_requests(struct blk_mq_hw_ctx *hctx,
   814				       struct list_head *list,
   815				       blk_insert_t flags)
   816	{
   817		struct request_queue *q = hctx->queue;
   818		struct deadline_data *dd = q->elevator->elevator_data;
   819		LIST_HEAD(free);
   820	
   821		spin_lock(&dd->lock);
   822		while (!list_empty(list)) {
   823			struct request *rq;
   824	
   825			rq = list_first_entry(list, struct request, queuelist);
   826			list_del_init(&rq->queuelist);
   827			dd_insert_request(hctx, rq, flags, &free);
   828		}
   829		spin_unlock(&dd->lock);
   830	
 > 831		blk_mq_free_requests(free);
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
