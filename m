Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E8134740;
	Thu, 25 Jan 2024 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706202055; cv=none; b=kJuKvlOf2uQ/2UKoXCrw/Ce1eL0xknsHHzWW6XAW7jgQpjIU8VTeVJmCyRMkSnG/2MGHCE2j2LDXFiC2pHKrV8/nnDppN7CVdaJM5FEfQx3xVsJVlzw33KgDsHc/8/iYAX7z+MMsSeb7oqdmt/uMAH97E7YM6dCRmhxoM/C+ITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706202055; c=relaxed/simple;
	bh=AYW4JbQwBUIj343RXZ0KxuVwkrZaEl3VXTaOpIIB4fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EeHcLAHrLw5nWVS4cCngwz8iPg1nMEpQzJLY4kKr7PjOcmBTdNnQXocv1k39K/D9G7WYzbUlPDzaD8FT6yJ2jyQoQxBuOXU1Xa7JIsMfw+Ssbn8+gCXXVg/kI6gq/LzRPYOx3CB/8Gi2OohZWoZqmXEO+P3jFIpAlHEuZ/5qCGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cj4esP0a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cj4esP0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706202054; x=1737738054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYW4JbQwBUIj343RXZ0KxuVwkrZaEl3VXTaOpIIB4fk=;
  b=cj4esP0aAA9E08Iw4Lp2SS3jMGv+HWPuk3mz0HY07uCjaRYOcha9B7j2
   eXQZqoetdd/hFnRN8W/CSjG2HdrTe1VZw3c0OMSAAazzKWh79M4OFAnUH
   ywFoy0rOlaaddukEbgwFnxaWvlhIB3KOiUOZ3e/WbzCyqm6Mls6FlXvhJ
   KULg9X8iMCqBO5Is2vck4v3TGagtDl7dnxTeWhsnDP7nuAGIXhqqaegxa
   0d21uPEm5/10a8zxltIDz1x8PeQgC1zgWmpvOQ+d5yfmIQf9cqco+iKgO
   iu0V2BaZFCzSFMK+ewSQk0uRm76NcmRVjNCiGyzNFX3cX1Ry/dMgweyeV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2068915"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2068915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 09:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="35162431"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2024 09:00:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT358-0000DZ-1C;
	Thu, 25 Jan 2024 17:00:02 +0000
Date: Fri, 26 Jan 2024 00:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:schedtest2 11/12] kernel/sched/fair.c:9744:6: error:
 expected '(' after 'if'
Message-ID: <202401260037.Imdz1say-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git schedtest2
head:   326c08b860db40ad088d64cbca38afdccc196410
commit: 0436efe9a058218c483c6d296083253e871a391e [11/12] sched/fair: pack SD_ASYM_PACKING into sched_use_asym_prio
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240126/202401260037.Imdz1say-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260037.Imdz1say-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260037.Imdz1say-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/sched/fair.c:28:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> kernel/sched/fair.c:9744:6: error: expected '(' after 'if'
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |             ^
   6 warnings and 1 error generated.


vim +9744 kernel/sched/fair.c

  9730	
  9731	/**
  9732	 * sched_use_asym_prio - Check whether asym_packing priority must be used
  9733	 * @sd:		The scheduling domain of the load balancing
  9734	 * @cpu:	A CPU
  9735	 *
  9736	 * Always use CPU priority when balancing load between SMT siblings. When
  9737	 * balancing load between cores, it is not sufficient that @cpu is idle. Only
  9738	 * use CPU priority if the whole core is idle.
  9739	 *
  9740	 * Returns: True if the priority of @cpu must be followed. False otherwise.
  9741	 */
  9742	static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  9743	{
> 9744		if !(sd->flags & SD_ASYM_PACKING)
  9745			return false;
  9746	
  9747		return (!sched_smt_active()) ||
  9748			(sd->flags & SD_SHARE_CPUCAPACITY) || is_core_idle(cpu);
  9749	}
  9750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
