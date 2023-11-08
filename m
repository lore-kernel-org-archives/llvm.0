Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57716402;
	Wed,  8 Nov 2023 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jscnRSAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699443688; x=1730979688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bz6kljiS5+mzvnS55yi7mG/V617ZdV23vLurIU4Sodw=;
  b=jscnRSAQvNMg39SrkoaTBDOL0pQaFEyMTEdgTa2kLwrFDupJQobRMWxe
   jnEzxkyNgwTN7tswSMk9EGiN/xeIMgr7DWnMXJqjmd7zsbM90Qrtn6BDZ
   iHrF/aHI9aDNOdFezGTEU+C2DYG9GTRVkNf1C6WlMaealSVxoGh5MICYd
   lmDY9FDjBab7WO7Zxj1a1A0Pf8xQ85L7qCS+TjVVSvTM/uIsy9xUsewUT
   yKqVmbYbxU+iWI1XV+Afl4jns6ndZMzmzItGCIe7W+d5pcm2POebyrwVu
   0LD5z38li2poMrjaBkuH0z3jjqx2g/rfbtIDV5Gr6QQoEIs13VTBOcXfe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="380140830"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="380140830"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 03:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853716481"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="853716481"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Nov 2023 03:41:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0gvz-0007uK-2L;
	Wed, 08 Nov 2023 11:41:23 +0000
Date: Wed, 8 Nov 2023 19:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 18/19] kernel/sched/fair.c:3696:4: error:
 implicit declaration of function 'min_deadline_cb_propagate' is invalid in
 C99
Message-ID: <202311081959.j0nL4UpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: c9647eb51bfc7ada985c2798ce87067c557e2a07 [18/19] sched/eevdf: Sort the rbtree by virtual deadline
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081959.j0nL4UpU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081959.j0nL4UpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081959.j0nL4UpU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/sched/fair.c:3696:4: error: implicit declaration of function 'min_deadline_cb_propagate' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           min_deadline_cb_propagate(&se->run_node, NULL);
                           ^
   kernel/sched/fair.c:3696:4: note: did you mean 'min_vruntime_cb_propagate'?
   kernel/sched/fair.c:807:1: note: 'min_vruntime_cb_propagate' declared here
   RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
   ^
   include/linux/rbtree_augmented.h:102:26: note: expanded from macro 'RB_DECLARE_CALLBACKS'
   static inline void                                                      \
                                                                           ^
   <scratch space>:107:1: note: expanded from here
   min_vruntime_cb_propagate
   ^
   12 warnings and 1 error generated.


vim +/min_deadline_cb_propagate +3696 kernel/sched/fair.c

8d5b9025f9b450 Peter Zijlstra  2017-08-24  3663  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3664  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
0dacee1bfa70e1 Vincent Guittot 2020-02-24  3665  			    unsigned long weight)
9059393e4ec1c8 Vincent Guittot 2017-05-17  3666  {
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3667  	unsigned long old_weight = se->load.weight;
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3668  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3669  	if (se->on_rq) {
9059393e4ec1c8 Vincent Guittot 2017-05-17  3670  		/* commit outstanding execution time */
9059393e4ec1c8 Vincent Guittot 2017-05-17  3671  		if (cfs_rq->curr == se)
9059393e4ec1c8 Vincent Guittot 2017-05-17  3672  			update_curr(cfs_rq);
af4cf40470c22e Peter Zijlstra  2023-05-31  3673  		else
af4cf40470c22e Peter Zijlstra  2023-05-31  3674  			avg_vruntime_sub(cfs_rq, se);
1724b95b92979a Jiang Biao      2020-08-11  3675  		update_load_sub(&cfs_rq->load, se->load.weight);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3676  	}
9059393e4ec1c8 Vincent Guittot 2017-05-17  3677  	dequeue_load_avg(cfs_rq, se);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3678  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3679  	update_load_set(&se->load, weight);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3680  
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3681  	if (!se->on_rq) {
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3682  		/*
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3683  		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3684  		 * we need to scale se->vlag when w_i changes.
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3685  		 */
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3686  		se->vlag = div_s64(se->vlag * old_weight, weight);
147f3efaa24182 Peter Zijlstra  2023-05-31  3687  	} else {
147f3efaa24182 Peter Zijlstra  2023-05-31  3688  		s64 deadline = se->deadline - se->vruntime;
147f3efaa24182 Peter Zijlstra  2023-05-31  3689  		/*
147f3efaa24182 Peter Zijlstra  2023-05-31  3690  		 * When the weight changes, the virtual time slope changes and
147f3efaa24182 Peter Zijlstra  2023-05-31  3691  		 * we should adjust the relative virtual deadline accordingly.
147f3efaa24182 Peter Zijlstra  2023-05-31  3692  		 */
147f3efaa24182 Peter Zijlstra  2023-05-31  3693  		deadline = div_s64(deadline * old_weight, weight);
147f3efaa24182 Peter Zijlstra  2023-05-31  3694  		se->deadline = se->vruntime + deadline;
d2929762cc3f85 Peter Zijlstra  2023-10-17  3695  		if (se != cfs_rq->curr)
8dafa9d0eb1a15 Peter Zijlstra  2023-10-06 @3696  			min_deadline_cb_propagate(&se->run_node, NULL);
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3697  	}
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3698  

:::::: The code at line 3696 was first introduced by commit
:::::: 8dafa9d0eb1a1550a0f4d462db9354161bc51e0c sched/eevdf: Fix min_deadline heap integrity

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
