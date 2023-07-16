Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8D161;
	Sun, 16 Jul 2023 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689482836; x=1721018836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNFZqngVENCu/hfcju9Yyl+cZH6mmvv/mKfb6SdIyyY=;
  b=TmXixelRV4u4RFfL00nz/4SL3e6dyrXQ+HglQ+D3IYgsA6RqQNnsvqp/
   XD0uJZLzOHSuCYcsaDFB1u1XmUfWyX5LWC5VHVIaLIqaPgjWkFaKOP28b
   NpQdX3TEJMC4VLQL5Ht8tpKN30KKZdIU0gavmeBrFi7SiFM3UffjmQtUP
   pi0xEdn1pT23ZTa2V/y1xp81e4Qp5rdU/86r853AEutJILwmuG/ZU0tFq
   jzFTC3TEYA4qj9yYq4Pb9O5J0ciGWq2MdjZxacYvd4Zuby0Bagk6hwlFI
   B3TLHd1mtzJ3QOCzy1ujirJfz3dWqWrsWCNiUNj9iWsoYs9tET7WPT4AR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365771398"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365771398"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053512685"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="1053512685"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2023 21:47:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtf8-0008aL-0Q;
	Sun, 16 Jul 2023 04:47:14 +0000
Date: Sun, 16 Jul 2023 12:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:rt-thermal-pressure 1/1] kernel/sched/rt.c:2552:13:
 warning: no previous prototype for function 'init_sched_rt_fitness_mask'
Message-ID: <202307161241.KzpHfIUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   5e556c4c3d199e96b26dff9e6f6f2847810c4392
commit: 5e556c4c3d199e96b26dff9e6f6f2847810c4392 [1/1] sched/rt: Support multi-criterion fitness search for lowest_rq
config: hexagon-randconfig-r041-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161241.KzpHfIUY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161241.KzpHfIUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161241.KzpHfIUY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
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
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
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
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
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
   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:2552:13: warning: no previous prototype for function 'init_sched_rt_fitness_mask' [-Wmissing-prototypes]
   void __init init_sched_rt_fitness_mask(int cpu)
               ^
   kernel/sched/rt.c:2552:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_sched_rt_fitness_mask(int cpu)
   ^
   static 
   7 warnings generated.


vim +/init_sched_rt_fitness_mask +2552 kernel/sched/rt.c

  2551	
> 2552	void __init init_sched_rt_fitness_mask(int cpu)
  2553	{
  2554		cpumask_var_t *fitness_mask_array;
  2555		unsigned int i;
  2556	
  2557		if (!NUM_FITNESS_FN)
  2558			return;
  2559	
  2560		fitness_mask_array = kcalloc_node(NUM_FITNESS_FN, sizeof(cpumask_var_t),
  2561						  GFP_KERNEL, cpu_to_node(cpu));
  2562	
  2563		per_cpu(local_cpu_fitness_mask, cpu) = fitness_mask_array;
  2564	
  2565		for (i = 0; i < NUM_FITNESS_FN; i++) {
  2566			zalloc_cpumask_var_node(&fitness_mask_array[i], GFP_KERNEL,
  2567						cpu_to_node(cpu));
  2568		}
  2569	}
  2570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
