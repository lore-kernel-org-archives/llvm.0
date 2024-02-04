Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B832C68A;
	Sun,  4 Feb 2024 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707082694; cv=none; b=se3CrbgRwtQ6+OyBWvdxpq6GwzUwfa4JBPXyTsRd7zTdXEJizbja6G6IRXOknB/HX1uiclH1mbmXNVdo2zgKqrRHCyLUb/Za4slXEy7Sxa61dxD3BTM+nTplpovpxNDbA5JNNoU28FrP9kbVSINUPcl8VLd5lzJmYXvtQ8uet+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707082694; c=relaxed/simple;
	bh=f2vk03Y+4mrkeUMcKSsq/rQUXlBdQpV5u/ZRKoAoKwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nP5KLZ3U4StQ2YPKHFizAvSimX+1eRvx9D4s2KfT2ve2A9goqn9MZFoshOFqIRAXiauDZEU01CuQ1Pbq7TWDJiW0lXWE11SwLnJLFw5COCGNe6RoPxsBNENEX7pcOUzUkHaPFbdKBki/uECKgOjNqddIKkYVG2R0Y73F2CojNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiMdZQ6C; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiMdZQ6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707082691; x=1738618691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2vk03Y+4mrkeUMcKSsq/rQUXlBdQpV5u/ZRKoAoKwQ=;
  b=EiMdZQ6CCjxG3SCoRVD8SX7hmNTpxaeTvuIzVSkIBUoCcwFCv1QWfoKi
   ekUsuX0OeWUAF53QaS4/p5m0lbdtwI2Wzwxl0AJhRb54SGR1Nu87vebcK
   ANoFejNwRNoh6dzNztz5jrF+tV67wp6G07SzOl1cde7Fpev+cKstIp5YV
   /0J/Nkc/ssXnaj8UCqF7Mc7wbpS7yOX/fDRzGek/KfAXmZYtzgBouRoVh
   5c1SA1j5PJhon7chWN1arPpaFt9RgNncVXDwrmDynu94/WuzIa0e7XC/3
   gX21SIGTjuhd5l+ZyI6ngXEeGyxQV4VX74819JhoxdvT5Wk5y1GBPOUMn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="394845427"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="394845427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="932984623"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="932984623"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2024 13:38:08 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWkBi-0006i0-2b;
	Sun, 04 Feb 2024 21:38:06 +0000
Date: Mon, 5 Feb 2024 05:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 2/2] kernel/sched/fair.c:12696:2:
 error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202402050557.oS6wZjUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   22d6e6b5c20133897944454d2ca4924389d2da90
commit: 46bb39f63c39afa78df4d14261068751b3e3d92e [2/2] sched/fair: Check a task has a fitting cpu when updating misfit
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20240205/202402050557.oS6wZjUC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050557.oS6wZjUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050557.oS6wZjUC-lkp@intel.com/

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
>> kernel/sched/fair.c:12696:2: error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           set_task_max_allowed_capacity(p);
           ^
   kernel/sched/fair.c:12821:2: error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           set_task_max_allowed_capacity(p);
           ^
   12 warnings and 2 errors generated.


vim +/set_task_max_allowed_capacity +12696 kernel/sched/fair.c

 12680	
 12681	/*
 12682	 * called on fork with the child task as argument from the parent's context
 12683	 *  - child not yet on the tasklist
 12684	 *  - preemption disabled
 12685	 */
 12686	static void task_fork_fair(struct task_struct *p)
 12687	{
 12688		struct sched_entity *se = &p->se, *curr;
 12689		struct cfs_rq *cfs_rq;
 12690		struct rq *rq = this_rq();
 12691		struct rq_flags rf;
 12692	
 12693		rq_lock(rq, &rf);
 12694		update_rq_clock(rq);
 12695	
 12696		set_task_max_allowed_capacity(p);
 12697	
 12698		cfs_rq = task_cfs_rq(current);
 12699		curr = cfs_rq->curr;
 12700		if (curr)
 12701			update_curr(cfs_rq);
 12702		place_entity(cfs_rq, se, ENQUEUE_INITIAL);
 12703		rq_unlock(rq, &rf);
 12704	}
 12705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
