Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C8321422C;
	Thu,  9 Jan 2025 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736399140; cv=none; b=Ua/QbIU9RYZy6kvaODiBvOvMqgOeLMZYLd6PXHIwxvT12S9MtjuJaILBcbgBI3GeglNHBl1+jGEjkPyPkLdGfXsXypG9j4HohygwwF/zb3b7EMDHOFPpRlgGoVoZhfsdlsnrWAa9t9kfkYTQ2+kQ11fdOfAgE/movAu5HCrBLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736399140; c=relaxed/simple;
	bh=icHa+z701R0gciadam6t0R2syIFwZSsfhqdtDeITtXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUgyzQieyOaVG62y55ffXQO/Mtws08URnuQbkh5ygH2ME5yStppQROtuneL61A57FA28W9/kwIg3r1ngvRNTJIUba8E1gAvgSBdTvm7l4/NkSq3LwYDSprxFq2tXd83TW8Wttyet/mQ0hn8DJ1fVCZUkn/JyIEsurNyFjFdBezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKWqfz0e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKWqfz0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736399140; x=1767935140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=icHa+z701R0gciadam6t0R2syIFwZSsfhqdtDeITtXI=;
  b=OKWqfz0elTPZwLL2gtUu0FQ/CmWwJWI8xzKTarSlqzSMEvvXFZe8MUqG
   S5pEaIDeWT/21+c/joQM4dBM64KuWPiG1Z9gtAHUpeTvWOc+kAGCUGm7X
   6Y2agejmQ8etbA+ZG6OC31IKIl0lyrJAp2Qgf2eE7+dioEzyIkvxMMyRz
   gyjaLLK1Tbq0GF5QgXY0vbHogjY8wg0ET8YpoM1qcqXkVhnDsX/QEeFzb
   esS4kEnUaQw72Zv1zgeNPaPWqCIEsj/sII78s6xK15clMzkR0H7McVf+f
   bDJq7/AU+YxrlXIp/o4y36cc8vEpa/Riqnfu917mfJgnDPWgPvByjai/h
   g==;
X-CSE-ConnectionGUID: 6Tpl9aZYRveQVKiwTEdiJA==
X-CSE-MsgGUID: URY7N9s0ReKXyl4ity52jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54063565"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="54063565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 21:05:38 -0800
X-CSE-ConnectionGUID: ba3H0r7PQ6+U3X1SRLkbkg==
X-CSE-MsgGUID: lhaVkVYPQrOmroobyHtgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103104711"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2025 21:05:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVkjc-000H47-2L;
	Thu, 09 Jan 2025 05:05:32 +0000
Date: Thu, 9 Jan 2025 13:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.14 2/36] drivers/nvme/host/tcp.c:1594:13:
 warning: variable 'mq_map' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202501091328.r4kJ6xhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.14
head:   b9973aa4d0507c4969ad87763b535edb77b7dceb
commit: bd0f5c10310122f4f1d9468467a59a6f69e46f92 [2/36] nvme-tcp: Fix I/O queue cpu spreading for multiple controllers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250109/202501091328.r4kJ6xhy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091328.r4kJ6xhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091328.r4kJ6xhy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/tcp.c:7:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1583:11: warning: variable 'n' set but not used [-Wunused-but-set-variable]
    1583 |         int cpu, n = 0, min_queues = INT_MAX, io_cpu;
         |                  ^
>> drivers/nvme/host/tcp.c:1594:13: warning: variable 'mq_map' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1594 |         } else if (nvme_tcp_poll_queue(queue)) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1599:15: note: uninitialized use occurs here
    1599 |         if (WARN_ON(!mq_map))
         |                      ^~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
      54 |         int __ret_warn_on = !!(x);                      \
         |                                ^
   drivers/nvme/host/tcp.c:1594:9: note: remove the 'if' if its condition is always true
    1594 |         } else if (nvme_tcp_poll_queue(queue)) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1582:22: note: initialize the variable 'mq_map' to silence this warning
    1582 |         unsigned int *mq_map;
         |                             ^
         |                              = NULL
   5 warnings generated.


vim +1594 drivers/nvme/host/tcp.c

  1567	
  1568	/**
  1569	 * Track the number of queues assigned to each cpu using a global per-cpu
  1570	 * counter and select the least used cpu from the mq_map. Our goal is to spread
  1571	 * different controllers I/O threads across different cpu cores.
  1572	 *
  1573	 * Note that the accounting is not 100% perfect, but we don't need to be, we're
  1574	 * simply putting our best effort to select the best candidate cpu core that we
  1575	 * find at any given point.
  1576	 */
  1577	static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
  1578	{
  1579		struct nvme_tcp_ctrl *ctrl = queue->ctrl;
  1580		struct blk_mq_tag_set *set = &ctrl->tag_set;
  1581		int qid = nvme_tcp_queue_id(queue) - 1;
  1582		unsigned int *mq_map;
  1583		int cpu, n = 0, min_queues = INT_MAX, io_cpu;
  1584	
  1585		if (wq_unbound)
  1586			goto out;
  1587	
  1588		if (nvme_tcp_default_queue(queue)) {
  1589			mq_map = set->map[HCTX_TYPE_DEFAULT].mq_map;
  1590			n = qid;
  1591		} else if (nvme_tcp_read_queue(queue)) {
  1592			mq_map = set->map[HCTX_TYPE_READ].mq_map;
  1593			n = qid - ctrl->io_queues[HCTX_TYPE_DEFAULT];
> 1594		} else if (nvme_tcp_poll_queue(queue)) {
  1595			mq_map = set->map[HCTX_TYPE_POLL].mq_map;
  1596			n = qid - ctrl->io_queues[HCTX_TYPE_DEFAULT] -
  1597					ctrl->io_queues[HCTX_TYPE_READ];
  1598		}
  1599		if (WARN_ON(!mq_map))
  1600			goto out;
  1601	
  1602		/* Search for the least used cpu from the mq_map */
  1603		io_cpu = WORK_CPU_UNBOUND;
  1604		for_each_online_cpu(cpu) {
  1605			int num_queues = atomic_read(&nvme_tcp_cpu_queues[cpu]);
  1606	
  1607			if (mq_map[cpu] != qid)
  1608				continue;
  1609			if (num_queues < min_queues) {
  1610				io_cpu = cpu;
  1611				min_queues = num_queues;
  1612			}
  1613		}
  1614		if (io_cpu != WORK_CPU_UNBOUND) {
  1615			queue->io_cpu = io_cpu;
  1616			atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
  1617			set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
  1618		}
  1619	out:
  1620		dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
  1621			qid, queue->io_cpu);
  1622	}
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
