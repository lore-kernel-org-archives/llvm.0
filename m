Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124717C8B;
	Sat,  6 Apr 2024 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712397753; cv=none; b=pAPbINa3CYl/OzwUZEA1R7G2HwM0XDvBeQwm+IvTjnhfpDcd3xlomCiE5viVuvuOewJ2R/ANyC228sZj/lUr4keUGSy2cGeX6uBmdf6Q/nDvfSHkoILbC4v6Q1MT9doMN9SNO1hz9F+mv4LdTAoLAcFPhYuETE0yyJGlAPK6CMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712397753; c=relaxed/simple;
	bh=4Lkx2ceE4QVAlSmjhC1mrkUmcSLEB8Za2hFkjZx6UVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMz5rquXlnzO2PAlBimXZ8CP63WbCOVL0J9SLpUh+T/XkqTQCwZNnINvu32yysq19Ym4P0DqXNjdqCFnAwiQ471bP50i8Pf600ja+xqGxtIbrJJ3HlvTFT76lByMyAO0b+If7kWgW6ZPJWJvp5JmphOGCs/wSVU0wgC4MMkSc50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlplfHet; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlplfHet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712397752; x=1743933752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Lkx2ceE4QVAlSmjhC1mrkUmcSLEB8Za2hFkjZx6UVU=;
  b=VlplfHetmqnuTjrj7KSNVcEgnk9W0GIkAfv/2Uqze2EJ4pKGaXChyOu9
   ixZRb9xv4vnd/TQmbsLmpyxCPge2n97S/kTbFbtyJLCECLLBhT9HGVoOI
   3at+xkNUFrDF1g07LXr3tjc/lcjX+reFutJxfj9MBTs3gHQUP8FOcRS4n
   YYDgacmdnS9E4OPlGjfxG/7c8IOgncrQlhz8H/jVJON61/uVm8HPBJ0TH
   mmpX54gPqyf/fHNz5NlpNkEpDBlhGGk41/UnBw9g12A4tM79UC8YzdoVY
   ll4Cwq48rDphDEci7+QHZujqo4hcJIJBK/ODhPcu31W+yoZOOXf8eWso7
   w==;
X-CSE-ConnectionGUID: PjlJSiqDT1CmxSJiIhHoxA==
X-CSE-MsgGUID: taW9yqCKR2KMzwlvW+cKWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7585357"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7585357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 03:02:31 -0700
X-CSE-ConnectionGUID: SPlXJobRR/m/MMu+e6GUYA==
X-CSE-MsgGUID: DYUnubXyTTOsqU/jwbJLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19936458"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 03:02:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt2sV-0003MS-0T;
	Sat, 06 Apr 2024 10:02:27 +0000
Date: Sat, 6 Apr 2024 18:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/6] blk-throttle: remove
 CONFIG_BLK_DEV_THROTTLING_LOW
Message-ID: <202404061719.s29GkBgv-lkp@intel.com>
References: <20240406080059.2248314-2-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406080059.2248314-2-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.9-rc2]
[cannot apply to axboe-block/for-next next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-throttle-remove-CONFIG_BLK_DEV_THROTTLING_LOW/20240406-161216
base:   linus/master
patch link:    https://lore.kernel.org/r/20240406080059.2248314-2-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v2 1/6] blk-throttle: remove CONFIG_BLK_DEV_THROTTLING_LOW
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240406/202404061719.s29GkBgv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061719.s29GkBgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061719.s29GkBgv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-throttle.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from block/blk-throttle.c:12:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from block/blk-throttle.c:12:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from block/blk-throttle.c:12:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> block/blk-throttle.c:1188:22: warning: variable 'parent_tg' set but not used [-Wunused-but-set-variable]
    1188 |                 struct throtl_grp *parent_tg;
         |                                    ^
   18 warnings generated.


vim +/parent_tg +1188 block/blk-throttle.c

60c2bc2d5a1236 Tejun Heo         2012-04-01  1165  
9bb67aeb967845 Shaohua Li        2017-05-17  1166  static void tg_conf_updated(struct throtl_grp *tg, bool global)
60c2bc2d5a1236 Tejun Heo         2012-04-01  1167  {
69948b070ee2bc Tejun Heo         2015-08-18  1168  	struct throtl_service_queue *sq = &tg->service_queue;
492eb21b98f88e Tejun Heo         2013-08-08  1169  	struct cgroup_subsys_state *pos_css;
69948b070ee2bc Tejun Heo         2015-08-18  1170  	struct blkcg_gq *blkg;
af133ceb261033 Tejun Heo         2012-04-01  1171  
fda6f272c77a7a Tejun Heo         2013-05-14  1172  	throtl_log(&tg->service_queue,
fda6f272c77a7a Tejun Heo         2013-05-14  1173  		   "limit change rbps=%llu wbps=%llu riops=%u wiops=%u",
9f626e372a6024 Shaohua Li        2017-03-27  1174  		   tg_bps_limit(tg, READ), tg_bps_limit(tg, WRITE),
9f626e372a6024 Shaohua Li        2017-03-27  1175  		   tg_iops_limit(tg, READ), tg_iops_limit(tg, WRITE));
632b44935f4c99 Tejun Heo         2013-05-14  1176  
27b13e209ddca5 Ming Lei          2023-11-17  1177  	rcu_read_lock();
693e751e70843c Tejun Heo         2013-05-14  1178  	/*
693e751e70843c Tejun Heo         2013-05-14  1179  	 * Update has_rules[] flags for the updated tg's subtree.  A tg is
693e751e70843c Tejun Heo         2013-05-14  1180  	 * considered to have rules if either the tg itself or any of its
693e751e70843c Tejun Heo         2013-05-14  1181  	 * ancestors has rules.  This identifies groups without any
693e751e70843c Tejun Heo         2013-05-14  1182  	 * restrictions in the whole hierarchy and allows them to bypass
693e751e70843c Tejun Heo         2013-05-14  1183  	 * blk-throttle.
693e751e70843c Tejun Heo         2013-05-14  1184  	 */
9bb67aeb967845 Shaohua Li        2017-05-17  1185  	blkg_for_each_descendant_pre(blkg, pos_css,
1231039db31cf0 Christoph Hellwig 2023-02-14  1186  			global ? tg->td->queue->root_blkg : tg_to_blkg(tg)) {
5b81fc3cc625e8 Shaohua Li        2017-05-17  1187  		struct throtl_grp *this_tg = blkg_to_tg(blkg);
5b81fc3cc625e8 Shaohua Li        2017-05-17 @1188  		struct throtl_grp *parent_tg;
5b81fc3cc625e8 Shaohua Li        2017-05-17  1189  
5b81fc3cc625e8 Shaohua Li        2017-05-17  1190  		tg_update_has_rules(this_tg);
5b81fc3cc625e8 Shaohua Li        2017-05-17  1191  		/* ignore root/second level */
5b81fc3cc625e8 Shaohua Li        2017-05-17  1192  		if (!cgroup_subsys_on_dfl(io_cgrp_subsys) || !blkg->parent ||
5b81fc3cc625e8 Shaohua Li        2017-05-17  1193  		    !blkg->parent->parent)
5b81fc3cc625e8 Shaohua Li        2017-05-17  1194  			continue;
5b81fc3cc625e8 Shaohua Li        2017-05-17  1195  		parent_tg = blkg_to_tg(blkg->parent);
5b81fc3cc625e8 Shaohua Li        2017-05-17  1196  	}
27b13e209ddca5 Ming Lei          2023-11-17  1197  	rcu_read_unlock();
693e751e70843c Tejun Heo         2013-05-14  1198  
632b44935f4c99 Tejun Heo         2013-05-14  1199  	/*
632b44935f4c99 Tejun Heo         2013-05-14  1200  	 * We're already holding queue_lock and know @tg is valid.  Let's
632b44935f4c99 Tejun Heo         2013-05-14  1201  	 * apply the new config directly.
632b44935f4c99 Tejun Heo         2013-05-14  1202  	 *
632b44935f4c99 Tejun Heo         2013-05-14  1203  	 * Restart the slices for both READ and WRITES. It might happen
632b44935f4c99 Tejun Heo         2013-05-14  1204  	 * that a group's limit are dropped suddenly and we don't want to
632b44935f4c99 Tejun Heo         2013-05-14  1205  	 * account recently dispatched IO with new low rate.
632b44935f4c99 Tejun Heo         2013-05-14  1206  	 */
a880ae93e5b5bb Yu Kuai           2022-08-29  1207  	throtl_start_new_slice(tg, READ, false);
a880ae93e5b5bb Yu Kuai           2022-08-29  1208  	throtl_start_new_slice(tg, WRITE, false);
632b44935f4c99 Tejun Heo         2013-05-14  1209  
5b2c16aae0c074 Tejun Heo         2013-05-14  1210  	if (tg->flags & THROTL_TG_PENDING) {
77216b04848178 Tejun Heo         2013-05-14  1211  		tg_update_disptime(tg);
7f52f98c2a8333 Tejun Heo         2013-05-14  1212  		throtl_schedule_next_dispatch(sq->parent_sq, true);
632b44935f4c99 Tejun Heo         2013-05-14  1213  	}
69948b070ee2bc Tejun Heo         2015-08-18  1214  }
69948b070ee2bc Tejun Heo         2015-08-18  1215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
