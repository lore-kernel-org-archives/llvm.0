Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663BE4F1F5;
	Tue,  5 Mar 2024 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630684; cv=none; b=RQ9duCjokkqPVn02F8y2LxDMLlQEFQf7lMLbT+21NbAwH/gBJHEXWka5VIFwJvnN1K+0qSOggNorkv/xVGZmeFCuf4HZAAlhdAGOhgARAIhP6HlQc25tr5qEDLsgepxGTWNOt/CGHg7NsQPEKFGarshKpr0ZApgeXkCOlNwtk+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630684; c=relaxed/simple;
	bh=GK/G6YOr6+r/mb4raz1XIrKoWM4QBOgmidhCnylSAP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bwdhbq3ZMDQyp1rrhZXM/VHOvJiMnCK4qM2bhbSOZmfkOQyczODRFOydLF+QHuajqUstnQbdKzoKojCHQVVZblWXG5Vc0hAuqtURKWiau+mdYUWsGk3ZZIK1H0XaczWWVUhzDZ4Z0Gff4Oxh3ajorwuM4KdKiztt9Mk3xkvSxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C567Muw2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C567Muw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630682; x=1741166682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GK/G6YOr6+r/mb4raz1XIrKoWM4QBOgmidhCnylSAP8=;
  b=C567Muw2s4/Cu8eZvhSib+nfXpQMiUhnFB0CP9xsDZ7NAiFoeGvqKuvy
   LnMBZgOkYC7j9uh+zD3CCBYjqhAm2xlfio7DH3BFB80cWLI8Gs0kDgy+D
   PPJbmseQGxbvv6gV2XsZStoOc+BjCBM85IpYX0HrmlC2iWhj9LuqTc/+P
   mDop+F/lcVOcRf5OBj7vvcDNdFoJ4gteg+l8YUwb5M3nWUtCpHg+xIp5Y
   FHW6W6PCeN4U46HOeoV1oAJ4egs+2hPA1nvjymN2qGuP9uvlSJuoWBFdt
   DijgFpmVZimmmU9Jzd2LIjPwDdPkAcGtMhpJaBuFAkGGg3Utvqi+486C9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4030560"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4030560"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9166399"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 01:24:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhR2L-0003CL-23;
	Tue, 05 Mar 2024 09:24:37 +0000
Date: Tue, 5 Mar 2024 17:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>
Subject: [linux-next:master 11348/11963]
 drivers/perf/starfive_starlink_pmu.c:169:3: error: call to undeclared
 function 'writeq'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202403051732.LuCJfZAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: c2b24812f7bc5fbd6f2f92af070856fbe4c37b40 [11348/11963] perf: starfive: Add StarLink PMU support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051732.LuCJfZAh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051732.LuCJfZAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051732.LuCJfZAh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/perf/starfive_starlink_pmu.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/perf/starfive_starlink_pmu.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/perf/starfive_starlink_pmu.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/perf/starfive_starlink_pmu.c:21:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/hexagon/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/perf/starfive_starlink_pmu.c:169:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |                 writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
         |                 ^
>> drivers/perf/starfive_starlink_pmu.c:191:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         val = readq(starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
         |               ^
   drivers/perf/starfive_starlink_pmu.c:200:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     200 |                 writeq(event->hw.config, starlink_pmu->pmu_base +
         |                 ^
   drivers/perf/starfive_starlink_pmu.c:206:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     206 |         writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
         |         ^
   drivers/perf/starfive_starlink_pmu.c:219:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     219 |         val = readq(starlink_pmu->pmu_base + STARLINK_PMU_CONTROL);
         |               ^
   drivers/perf/starfive_starlink_pmu.c:221:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |         writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CONTROL);
         |         ^
   drivers/perf/starfive_starlink_pmu.c:244:20: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |                         new_raw_count = readq(starlink_pmu->pmu_base +
         |                                         ^
   drivers/perf/starfive_starlink_pmu.c:412:21: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |                 overflow_status = readq(starlink_pmu->pmu_base +
         |                                   ^
   drivers/perf/starfive_starlink_pmu.c:417:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |                 writeq(BIT_ULL(idx), starlink_pmu->pmu_base +
         |                 ^
   7 warnings and 9 errors generated.


vim +/writeq +169 drivers/perf/starfive_starlink_pmu.c

   154	
   155	static void starlink_pmu_set_event_period(struct perf_event *event)
   156	{
   157		struct starlink_pmu *starlink_pmu = to_starlink_pmu(event->pmu);
   158		struct hw_perf_event *hwc = &event->hw;
   159		int idx = event->hw.idx;
   160	
   161		/*
   162		 * Program counter to half of it's max count to handle
   163		 * cases of extreme interrupt latency.
   164		 */
   165		u64 val = STARLINK_PMU_COUNTER_MASK >> 1;
   166	
   167		local64_set(&hwc->prev_count, val);
   168		if (hwc->config == STARLINK_CYCLES)
 > 169			writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
   170		else
   171			writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_EVENT_COUNTER +
   172			       idx * sizeof(u64));
   173	}
   174	
   175	static void starlink_pmu_counter_start(struct perf_event *event,
   176					       struct starlink_pmu *starlink_pmu)
   177	{
   178		struct hw_perf_event *hwc = &event->hw;
   179		int idx = event->hw.idx;
   180		u64 val;
   181	
   182		/*
   183		 * Enable counter overflow interrupt[63:0],
   184		 * which is mapped as follow:
   185		 *
   186		 * event counter 0	- Bit [0]
   187		 * event counter 1	- Bit [1]
   188		 * ...
   189		 * cycle counter	- Bit [63]
   190		 */
 > 191		val = readq(starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
   192	
   193		if (hwc->config == STARLINK_CYCLES) {
   194			/*
   195			 * Cycle count has its dedicated register, and it starts
   196			 * counting as soon as STARLINK_PMU_GLOBAL_ENABLE is set.
   197			 */
   198			val |= STARLINK_PMU_CYCLE_OVERFLOW_MASK;
   199		} else {
   200			writeq(event->hw.config, starlink_pmu->pmu_base +
   201			       STARLINK_PMU_EVENT_SELECT + idx * sizeof(u64));
   202	
   203			val |= BIT_ULL(idx);
   204		}
   205	
   206		writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
   207	
   208		writeq(STARLINK_PMU_GLOBAL_ENABLE, starlink_pmu->pmu_base +
   209		       STARLINK_PMU_CONTROL);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
