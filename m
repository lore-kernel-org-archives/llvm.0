Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BBB129A7B;
	Tue,  9 Apr 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712665502; cv=none; b=B5wteYFC+Na1iGDXn5Aj4ndp6s73ANQtqDi69auPMVNYtoOZRenBHkc56qnfF5y2qRdvT0oraxHpU9HYsURAzBhXIyUtB9eMm7+lLqYhYdKLBCLcfqIVb/3Ws/W174MubiMSXk/T14BdTI1RIzhzgO5UE2m8lWwgX2kBquCZ3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712665502; c=relaxed/simple;
	bh=brAt7hZ4csnDSRDjSLon0xeqzCP+TwewR+opxhQys58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q92ZwZNSQEQBcXMXkU9khMdC6hnp7XTVzm9bu28KjuCPA9JLrsJkwMvJIFgpYPtaKNS0ROXqHpFziJZpNlrix7egqoCSmJKbg3GFpHiQj2tpFJt6gvoz63ig0Ekj+1hgTVKE1NT50fzoEuRuJf5S1vIlV2XDKppHA3gbl9UQieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dByD97Xt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dByD97Xt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712665500; x=1744201500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brAt7hZ4csnDSRDjSLon0xeqzCP+TwewR+opxhQys58=;
  b=dByD97XtkW/h0cGloxgcgDcDcRdYLVKwyMorSYqZOYNw9PtnCeDnfhRc
   ujiIS8NaPspLFvzipsdtq3FeunQ0mSuifxVTQRaT6H+DHtYH6/MvNSZGI
   MUGB0/g1TAYP8AaL5D++EkeCc+hOoDroSH3Dt+XUr+48VMagpfBRKYWSM
   XUJxGW2d+kIAHhZcbWWmZNT5GTTvzKUbpFjYnS/qAw/bWlv6NSlbZxo/0
   3UM+7CYlP9qIcVlFzFT7SMK0DyeTCO832vLH1f369VcqGSVzOrtgDwn1Y
   6HLKopfc5U0tGLWjb/JG+E4fk9+rOQjmiSxUr79O0N0N0CVCTK+FNgsDf
   w==;
X-CSE-ConnectionGUID: wG3O9UBvTbaiZznhLbZxfw==
X-CSE-MsgGUID: HCKSlvf2QYG0uaWm8NLwmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7820042"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7820042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 05:24:59 -0700
X-CSE-ConnectionGUID: PmHAecK9Qi6lWocA31Bqag==
X-CSE-MsgGUID: UhMUmJkjQcCyPeJR6bJ+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="24838618"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2024 05:24:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruAX2-000642-1E;
	Tue, 09 Apr 2024 12:24:56 +0000
Date: Tue, 9 Apr 2024 20:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20240408-lbs-scsi-kludge 14/23]
 drivers/nvme/host/core.c:2013:24: warning: explicitly assigning value of
 variable of type 'unsigned int' to itself
Message-ID: <202404092033.jOSvpI2z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20240408-lbs-scsi-kludge
head:   4fa968dd0b213274f661a4ff005dd1190935617b
commit: 2542b8b1513ab1032021f14a9ff40708577c4ff8 [14/23] nvme: add nvme_core.debug_large_atomics to force high awun as phys_bs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240409/202404092033.jOSvpI2z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092033.jOSvpI2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092033.jOSvpI2z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/nvme/host/core.c:2013:24: warning: explicitly assigning value of variable of type 'unsigned int' to itself [-Wself-assign]
    2013 |                         debug_large_atomics = debug_large_atomics;
         |                         ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +2013 drivers/nvme/host/core.c

  1948	
  1949	static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
  1950			struct nvme_ns_head *head, struct nvme_id_ns *id)
  1951	{
  1952		sector_t capacity = nvme_lba_to_sect(head, le64_to_cpu(id->nsze));
  1953		u32 bs = 1U << head->lba_shift;
  1954		u32 atomic_bs, phys_bs, io_opt = 0;
  1955		u32 awun = 0, awun_bs = 0;
  1956	
  1957		/*
  1958		 * The block layer can't support LBA sizes larger than the page size
  1959		 * or smaller than a sector size yet, so catch this early and don't
  1960		 * allow block I/O.
  1961		 */
  1962		if (!nvme_lba_shift_supported(head, ctrl)) {
  1963			capacity = 0;
  1964			bs = (1 << 9);
  1965			dev_warn(ctrl->device, "I'm sorry dave, I'm afraid I can't do that\n");
  1966		}
  1967	
  1968		blk_integrity_unregister(disk);
  1969	
  1970		atomic_bs = phys_bs = bs;
  1971		if (id->nabo == 0) {
  1972			/*
  1973			 * Bit 1 indicates whether NAWUPF is defined for this namespace
  1974			 * and whether it should be used instead of AWUPF. If NAWUPF ==
  1975			 * 0 then AWUPF must be used instead.
  1976			 */
  1977			if (id->nsfeat & NVME_NS_FEAT_ATOMICS && id->nawupf)
  1978				atomic_bs = (1 + le16_to_cpu(id->nawupf)) * bs;
  1979			else
  1980				atomic_bs = (1 + ctrl->subsys->awupf) * bs;
  1981			if (id->nsfeat & NVME_NS_FEAT_ATOMICS && id->nawun)
  1982				awun = (1 + le16_to_cpu(id->nawun));
  1983			else
  1984				awun = (1 + ctrl->subsys->awun);
  1985			/* Indicates MDTS can be used */
  1986			if (awun == 0xffff)
  1987				awun_bs = ctrl->max_hw_sectors << SECTOR_SHIFT;
  1988			else
  1989				awun_bs = awun * bs;
  1990		}
  1991	
  1992		if (id->nsfeat & NVME_NS_FEAT_IO_OPT) {
  1993			/* NPWG = Namespace Preferred Write Granularity */
  1994			phys_bs = bs * (1 + le16_to_cpu(id->npwg));
  1995			/* NOWS = Namespace Optimal Write Size */
  1996			io_opt = bs * (1 + le16_to_cpu(id->nows));
  1997		}
  1998	
  1999		if (awun) {
  2000			phys_bs = min(awun_bs, phys_bs);
  2001	
  2002			/*
  2003			 * npwg and nows could be > awun, in such cases users should
  2004			 * be aware of out of order reads/writes as npwg and nows
  2005			 * are purely performance optimizations.
  2006			 */
  2007	
  2008			/*
  2009			 * If you're not concerned about power failure, in theory,
  2010			 * you should be able to experiment up to awun rather safely.
  2011			 */
  2012			if (debug_large_atomics) {
> 2013				debug_large_atomics = debug_large_atomics;
  2014				phys_bs = atomic_bs = debug_large_atomics;
  2015				dev_info(ctrl->device,
  2016					 "Forcing large atomic: %u (awun_bs: %u awun: %u)\n",
  2017					 debug_large_atomics, awun_bs, awun);
  2018			}
  2019		}
  2020	
  2021		blk_queue_logical_block_size(disk->queue, bs);
  2022		/*
  2023		 * Linux filesystems assume writing a single physical block is
  2024		 * an atomic operation. Hence limit the physical block size to the
  2025		 * value of the Atomic Write Unit Power Fail parameter.
  2026		 */
  2027		blk_queue_physical_block_size(disk->queue, min(phys_bs, atomic_bs));
  2028		blk_queue_io_min(disk->queue, phys_bs);
  2029		blk_queue_io_opt(disk->queue, io_opt);
  2030	
  2031		/*
  2032		 * Register a metadata profile for PI, or the plain non-integrity NVMe
  2033		 * metadata masquerading as Type 0 if supported, otherwise reject block
  2034		 * I/O to namespaces with metadata except when the namespace supports
  2035		 * PI, as it can strip/insert in that case.
  2036		 */
  2037		if (head->ms) {
  2038			if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
  2039			    (head->features & NVME_NS_METADATA_SUPPORTED))
  2040				nvme_init_integrity(disk, head,
  2041						    ctrl->max_integrity_segments);
  2042			else if (!nvme_ns_has_pi(head))
  2043				capacity = 0;
  2044		}
  2045	
  2046		set_capacity_and_notify(disk, capacity);
  2047	
  2048		nvme_config_discard(ctrl, disk, head);
  2049		blk_queue_max_write_zeroes_sectors(disk->queue,
  2050						   ctrl->max_zeroes_sectors);
  2051	}
  2052	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
