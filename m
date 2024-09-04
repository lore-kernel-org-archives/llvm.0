Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64946BFB0;
	Wed,  4 Sep 2024 04:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725423421; cv=none; b=ua0bH/Wq0Yie5wepVrJbFjb0FN7SiCV+Ka9n5Lqx7cvjqL94YZhLgPIdlMAAD/XogV9z+DracKkAmadz5WBfpQTYS2whLjy8ybq+hceAkD9EPfhYW06D2jL9MoEM2r7V/vus7mARrarIcvAUOpykmue1kQj5kjOVLrJxgx/14+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725423421; c=relaxed/simple;
	bh=WxbZhrHGDSoLP4QMoF2VE1j73UFWW7VcsDfG5vVnYuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4AlFP8VlkNCIWjPSwjc5ud8Ap9d6hGtu8PKHIKlksrmAqV2HiI9WhAPRIk38I1vy86dDa100KXSYVcMxWdu5W51HHZ/7ido2CaYuPrcJiD2tSW30zrtGp/zYzeAsj+MTLZo+Xok3tczbhh6JRUbWrUJL6WUDuIdhouY42c/QCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z09mIQ+d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z09mIQ+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725423419; x=1756959419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WxbZhrHGDSoLP4QMoF2VE1j73UFWW7VcsDfG5vVnYuo=;
  b=Z09mIQ+dOJteZF9ko+WIrEw+4WJnDqN0HVL+ocLhTmXAzBM3LWg2SqgP
   rjmxRAvcF26px7TbMHrHVE7ZcICG9U91Qk91ozIY5l66w5H51gGew5Kjq
   aGcbLT4hZRNVOO5xpAaZua9SidZ7ZSSZRfAj7WPpaBHnuLChZrsKo8VuK
   Tn6kbFF11+GRLoHtPnZ2N+m8pHohrUMQKXY1vhKYdXgaG3Fli5E8VK6a7
   H3/EmocHraiLbfSXTooPcGa0WPPgb7+wMtvRkQbjmTdccNU02yykrN8wo
   lCHr6Jcdo9lmM6O2RlFlSN81B0k9f/3sHqRV7dv2mmo1UErvC7Onr/tyE
   w==;
X-CSE-ConnectionGUID: PVkHW9TJSKW6uBbD6AkZIA==
X-CSE-MsgGUID: F7IOKAOrRQOyvKpPCNgL2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41549975"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="41549975"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 20:26:01 -0700
X-CSE-ConnectionGUID: gXeyB6J9QSaIYOOkmKLeMA==
X-CSE-MsgGUID: 7ml/kCKcRgKffE77DOT6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65152514"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2024 20:25:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slgeO-0007VF-2X;
	Wed, 04 Sep 2024 03:25:44 +0000
Date: Wed, 4 Sep 2024 11:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/PATCH 2/4] perf/core: Export perf_exclude_event()
Message-ID: <202409041025.CJXNAW1u-lkp@intel.com>
References: <20240830232910.1839548-3-namhyung@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830232910.1839548-3-namhyung@kernel.org>

Hi Namhyung,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on perf-tools/perf-tools acme/perf/core linus/master v6.11-rc6 next-20240903]
[cannot apply to perf-tools-next/perf-tools-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namhyung-Kim/perf-core-Add-PERF_FORMAT_DROPPED/20240831-073000
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/20240830232910.1839548-3-namhyung%40kernel.org
patch subject: [RFC/PATCH 2/4] perf/core: Export perf_exclude_event()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240904/202409041025.CJXNAW1u-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041025.CJXNAW1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041025.CJXNAW1u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/perf_cpum_sf.c:13:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/s390/include/asm/perf_event.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/perf_cpum_sf.c:25:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/perf_cpum_sf.c:25:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/perf_cpum_sf.c:25:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/s390/kernel/perf_cpum_sf.c:1086:12: error: static declaration of 'perf_exclude_event' follows non-static declaration
    1086 | static int perf_exclude_event(struct perf_event *event, struct pt_regs *regs,
         |            ^
   include/linux/perf_event.h:1637:12: note: previous declaration is here
    1637 | extern int perf_exclude_event(struct perf_event *event, struct pt_regs *regs);
         |            ^
>> arch/s390/kernel/perf_cpum_sf.c:1169:39: error: too many arguments to function call, expected 2, have 3
    1169 |         if (perf_exclude_event(event, &regs, sde_regs))
         |             ~~~~~~~~~~~~~~~~~~               ^~~~~~~~
   include/linux/perf_event.h:1637:12: note: 'perf_exclude_event' declared here
    1637 | extern int perf_exclude_event(struct perf_event *event, struct pt_regs *regs);
         |            ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings and 2 errors generated.


vim +/perf_exclude_event +1086 arch/s390/kernel/perf_cpum_sf.c

8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1076  
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1077  /* perf_exclude_event() - Filter event
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1078   * @event:	The perf event
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1079   * @regs:	pt_regs structure
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1080   * @sde_regs:	Sample-data-entry (sde) regs structure
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1081   *
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1082   * Filter perf events according to their exclude specification.
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1083   *
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1084   * Return non-zero if the event shall be excluded.
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1085   */
dd127b3b977b81 Hendrik Brueckner     2013-12-12 @1086  static int perf_exclude_event(struct perf_event *event, struct pt_regs *regs,
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1087  			      struct perf_sf_sde_regs *sde_regs)
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1088  {
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1089  	if (event->attr.exclude_user && user_mode(regs))
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1090  		return 1;
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1091  	if (event->attr.exclude_kernel && !user_mode(regs))
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1092  		return 1;
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1093  	if (event->attr.exclude_guest && sde_regs->in_guest)
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1094  		return 1;
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1095  	if (event->attr.exclude_host && !sde_regs->in_guest)
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1096  		return 1;
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1097  	return 0;
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1098  }
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1099  
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1100  /* perf_push_sample() - Push samples to perf
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1101   * @event:	The perf event
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1102   * @sample:	Hardware sample data
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1103   *
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1104   * Use the hardware sample data to create perf event sample.  The sample
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1105   * is the pushed to the event subsystem and the function checks for
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1106   * possible event overflows.  If an event overflow occurs, the PMU is
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1107   * stopped.
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1108   *
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1109   * Return non-zero if an event overflow occurred.
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1110   */
3d43b981eb841a Pu Hou                2017-05-19  1111  static int perf_push_sample(struct perf_event *event,
3d43b981eb841a Pu Hou                2017-05-19  1112  			    struct hws_basic_entry *basic)
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1113  {
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1114  	int overflow;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1115  	struct pt_regs regs;
443e802bab1691 Hendrik Brueckner     2013-12-12  1116  	struct perf_sf_sde_regs *sde_regs;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1117  	struct perf_sample_data data;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1118  
7e75fc3ff4cffd Hendrik Brueckner     2013-12-13  1119  	/* Setup perf sample */
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1120  	perf_sample_data_init(&data, 0, event->hw.last_period);
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1121  
443e802bab1691 Hendrik Brueckner     2013-12-12  1122  	/* Setup pt_regs to look like an CPU-measurement external interrupt
443e802bab1691 Hendrik Brueckner     2013-12-12  1123  	 * using the Program Request Alert code.  The regs.int_parm_long
443e802bab1691 Hendrik Brueckner     2013-12-12  1124  	 * field which is unused contains additional sample-data-entry related
443e802bab1691 Hendrik Brueckner     2013-12-12  1125  	 * indicators.
443e802bab1691 Hendrik Brueckner     2013-12-12  1126  	 */
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1127  	memset(&regs, 0, sizeof(regs));
443e802bab1691 Hendrik Brueckner     2013-12-12  1128  	regs.int_code = 0x1407;
443e802bab1691 Hendrik Brueckner     2013-12-12  1129  	regs.int_parm = CPU_MF_INT_SF_PRA;
443e802bab1691 Hendrik Brueckner     2013-12-12  1130  	sde_regs = (struct perf_sf_sde_regs *) &regs.int_parm_long;
443e802bab1691 Hendrik Brueckner     2013-12-12  1131  
3d43b981eb841a Pu Hou                2017-05-19  1132  	psw_bits(regs.psw).ia	= basic->ia;
3d43b981eb841a Pu Hou                2017-05-19  1133  	psw_bits(regs.psw).dat	= basic->T;
3d43b981eb841a Pu Hou                2017-05-19  1134  	psw_bits(regs.psw).wait = basic->W;
3d43b981eb841a Pu Hou                2017-05-19  1135  	psw_bits(regs.psw).pstate = basic->P;
3d43b981eb841a Pu Hou                2017-05-19  1136  	psw_bits(regs.psw).as	= basic->AS;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1137  
e22cf8ca6f75a6 Christian Borntraeger 2015-10-06  1138  	/*
c19805f870c1fa Christian Borntraeger 2016-11-08  1139  	 * Use the hardware provided configuration level to decide if the
c19805f870c1fa Christian Borntraeger 2016-11-08  1140  	 * sample belongs to a guest or host. If that is not available,
c19805f870c1fa Christian Borntraeger 2016-11-08  1141  	 * fall back to the following heuristics:
c19805f870c1fa Christian Borntraeger 2016-11-08  1142  	 * A non-zero guest program parameter always indicates a guest
c19805f870c1fa Christian Borntraeger 2016-11-08  1143  	 * sample. Some early samples or samples from guests without
b1685ab9bd3ae1 Christian Borntraeger 2016-02-29  1144  	 * lpp usage would be misaccounted to the host. We use the asn
c19805f870c1fa Christian Borntraeger 2016-11-08  1145  	 * value as an addon heuristic to detect most of these guest samples.
df26c2e87e6cf3 Martin Schwidefsky    2017-04-04  1146  	 * If the value differs from 0xffff (the host value), we assume to
df26c2e87e6cf3 Martin Schwidefsky    2017-04-04  1147  	 * be a KVM guest.
443e802bab1691 Hendrik Brueckner     2013-12-12  1148  	 */
3d43b981eb841a Pu Hou                2017-05-19  1149  	switch (basic->CL) {
c19805f870c1fa Christian Borntraeger 2016-11-08  1150  	case 1: /* logical partition */
c19805f870c1fa Christian Borntraeger 2016-11-08  1151  		sde_regs->in_guest = 0;
c19805f870c1fa Christian Borntraeger 2016-11-08  1152  		break;
c19805f870c1fa Christian Borntraeger 2016-11-08  1153  	case 2: /* virtual machine */
c19805f870c1fa Christian Borntraeger 2016-11-08  1154  		sde_regs->in_guest = 1;
c19805f870c1fa Christian Borntraeger 2016-11-08  1155  		break;
c19805f870c1fa Christian Borntraeger 2016-11-08  1156  	default: /* old machine, use heuristics */
3d43b981eb841a Pu Hou                2017-05-19  1157  		if (basic->gpp || basic->prim_asn != 0xffff)
443e802bab1691 Hendrik Brueckner     2013-12-12  1158  			sde_regs->in_guest = 1;
c19805f870c1fa Christian Borntraeger 2016-11-08  1159  		break;
c19805f870c1fa Christian Borntraeger 2016-11-08  1160  	}
443e802bab1691 Hendrik Brueckner     2013-12-12  1161  
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1162  	/*
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1163  	 * Store the PID value from the sample-data-entry to be
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1164  	 * processed and resolved by cpumsf_output_event_pid().
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1165  	 */
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1166  	data.tid_entry.pid = basic->hpp & LPP_PID_MASK;
544e8dd7a8e49d Hendrik Brueckner     2016-03-08  1167  
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1168  	overflow = 0;
dd127b3b977b81 Hendrik Brueckner     2013-12-12 @1169  	if (perf_exclude_event(event, &regs, sde_regs))
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1170  		goto out;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1171  	if (perf_event_overflow(event, &data, &regs)) {
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1172  		overflow = 1;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1173  		event->pmu->stop(event, 0);
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1174  	}
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1175  	perf_event_update_userpage(event);
dd127b3b977b81 Hendrik Brueckner     2013-12-12  1176  out:
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1177  	return overflow;
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1178  }
8c069ff4bd6063 Hendrik Brueckner     2013-12-12  1179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
