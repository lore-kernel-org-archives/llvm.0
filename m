Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49D7E;
	Tue, 14 Feb 2023 02:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676343172; x=1707879172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJlA/aUkDfwVflD02OPIMXlPGXO9ryDJZ9OJHFLiBYg=;
  b=BSDg3VH50mAQvGmVNF/IRKGpW3s4H9eyss3GCLoW02QIw+HSlr4AXTao
   K8ozS3ILKvGGJFtkrKCi72X4dimexLZEbPRVZC7TZQm3Krlg8GQaF6Lmg
   UnxH1XGScT1f6OkyjAvquyViq4cFofnt/7DrKdPTmFHwbIQqpQUD2y6kf
   4IMTl0Ruw+HR+XbCIef8nGgwPOVKWxiz111uuAsobr+9/En2NSQAxz6FA
   MW5xVU8G7FFxWve6v56vKTSUaj0mupmCCDpkY87/Y01rZzY1QRnvE1jJ4
   4LisjaTRPlaMrG1dUmtQiG7UQSmQ1WV3HViRCVwSfVLKLnkW04J6lIvkh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311422840"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="311422840"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 18:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732720649"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="732720649"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2023 18:52:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRlR3-00089P-2b;
	Tue, 14 Feb 2023 02:52:49 +0000
Date: Tue, 14 Feb 2023 10:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.feb13.2023 7/7] kernel/sched/rt.c:1393:9:
 error: no member named 'rt_nr_cg_throttled' in 'struct rt_rq'; did you mean
 'rt_cg_throttled'?
Message-ID: <202302141059.9YYOTLpf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.feb13.2023
head:   76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
commit: 76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e [7/7] fixup! fixup! fixup! sched/rt: Keep throttled rt_rqs on the runqueue
config: hexagon-randconfig-r041-20230212 (https://download.01.org/0day-ci/archive/20230214/202302141059.9YYOTLpf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.feb13.2023
        git checkout 76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141059.9YYOTLpf-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   kernel/sched/rt.c:995:17: error: no member named 'tg' in 'struct rt_rq'
                                           if (rt_rq->tg && rt_rq->tg->parent)
                                               ~~~~~  ^
   kernel/sched/rt.c:995:30: error: no member named 'tg' in 'struct rt_rq'
                                           if (rt_rq->tg && rt_rq->tg->parent)
                                                            ~~~~~  ^
   kernel/sched/rt.c:996:29: error: no member named 'tg' in 'struct rt_rq'
                                                   parent_rt_se = rt_rq->tg->parent->rt_se[i];
                                                                  ~~~~~  ^
   kernel/sched/rt.c:1133:28: error: no member named 'parent' in 'struct sched_rt_entity'
                                   if (!tbefore && rt_se->parent)
                                                   ~~~~~  ^
   kernel/sched/rt.c:1134:36: error: no member named 'parent' in 'struct sched_rt_entity'
                                           adjust_cg_throt_update(rt_se->parent, true);
                                                                  ~~~~~  ^
   kernel/sched/rt.c:1390:22: error: no member named 'parent' in 'struct sched_rt_entity'
           if (!grq || !rt_se->parent || !rt_rq_throttled(grq))
                        ~~~~~  ^
>> kernel/sched/rt.c:1393:9: error: no member named 'rt_nr_cg_throttled' in 'struct rt_rq'; did you mean 'rt_cg_throttled'?
           rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
                  ^~~~~~~~~~~~~~~~~~
                  rt_cg_throttled
   kernel/sched/sched.h:687:8: note: 'rt_cg_throttled' declared here
           int                     rt_cg_throttled;
                                   ^
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1413:22: error: no member named 'parent' in 'struct sched_rt_entity'
           WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
                        ~~~~~  ^
   include/asm-generic/bug.h:147:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1414:51: error: no member named 'parent' in 'struct sched_rt_entity'
           if (!tbefore && rt_rq_throttled(rt_rq) && rt_se->parent)
                                                     ~~~~~  ^
   kernel/sched/rt.c:1415:33: error: no member named 'parent' in 'struct sched_rt_entity'
                   adjust_cg_throt_update(rt_se->parent, true);
                                          ~~~~~  ^
   kernel/sched/rt.c:1560:23: error: no member named 'parent' in 'struct sched_rt_entity'
                   WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
                                ~~~~~  ^
   include/asm-generic/bug.h:147:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1561:52: error: no member named 'parent' in 'struct sched_rt_entity'
                   if (tbefore && !rt_rq_throttled(rt_rq) && rt_se->parent)
                                                             ~~~~~  ^
   kernel/sched/rt.c:1562:34: error: no member named 'parent' in 'struct sched_rt_entity'
                           adjust_cg_throt_update(rt_se->parent, false);
                                                  ~~~~~  ^
   6 warnings and 13 errors generated.


vim +1393 kernel/sched/rt.c

  1384	
  1385	static void update_nr_cg_throttled(struct sched_rt_entity *rt_se, bool dec)
  1386	{
  1387		struct rt_rq *grq = group_rt_rq(rt_se);
  1388		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1389	
  1390		if (!grq || !rt_se->parent || !rt_rq_throttled(grq))
  1391			return;
  1392	
> 1393		rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
