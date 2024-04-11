Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1D1EB26;
	Thu, 11 Apr 2024 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712840436; cv=none; b=bvlJVrl7ZCfB1yE7lxgHfhKth+sjTb+xJHQDq1TgWOXYCs2mgMc7i9jHrto1JrvEMrf99FCqm/ixYiI4Tiu+tgJP0/Cz5rS7zYYjeUL79bJSwXqRzQ022g/Hv04MR/Ea3PObjkbieTPjjGmRW3tGvcK4ybRZKQIRVsbn0hL6Jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712840436; c=relaxed/simple;
	bh=hcNt5MhSctfXT7b6m9sCSUT1l8a/N35W3mhMoD1iKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HoG8N9UET1V2CL8vrt5c7tmVE0B93dzhUuRx0ZXtN22pHvl5eOii+DzvqNqyWWKoae8CEZa5q/xYI/jN/T74znQOWA9nWISaAw7LL2MX25jC/ftMydpGOYvq4cfoCxR1d7o4+1DEzepNwe8jZECNBCIY9RyHAr6nzFgOQST2QY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmzFj6O3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmzFj6O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712840433; x=1744376433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hcNt5MhSctfXT7b6m9sCSUT1l8a/N35W3mhMoD1iKPg=;
  b=AmzFj6O3q4vQabwPKCQRV9YZQ2d0TGo7IQzp8ryvB/bwYgmhI3zmLUoz
   /DdCgQ2jdFZA1lHd/V72eUW71tdguXbHD9bLcn9hg4smMGEWzo9GOHbuJ
   n20nKU6Mx6ilcK/s0YMuB2PLpUnayC7McJZV0KU7mtToGN8NhuihMovgd
   +obqJGfS3s1qpWJiQJHWI9mt4z0hJCJeIurpOTJ3e8ZogLMbe0mq8Ymbe
   cmSHb47oT5fdxIM/AAhiDPsIqbg1oHZih7iLpBq58jRiwhgeoiE7I5wGl
   Nl66w2a9vvgYju8VusNiSneGMFFCrzucKWgWDxRISkC8emMjGKse5EdFW
   A==;
X-CSE-ConnectionGUID: bIAXY/S/S4eQO6U1t3fyvw==
X-CSE-MsgGUID: /cFR1r3bQSaTwS8B8CFXtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12096877"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12096877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:00:32 -0700
X-CSE-ConnectionGUID: VvxScyEgR52LcL3fbhiQdw==
X-CSE-MsgGUID: YZushxADRN2jdeqMJaQJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="52070187"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 06:00:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruu2W-0008dK-2h;
	Thu, 11 Apr 2024 13:00:28 +0000
Date: Thu, 11 Apr 2024 20:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 17/19]
 kernel/trace/trace.c:7534:37: warning: unused variable 'last_boot_fops'
Message-ID: <202404112002.5XO2WnSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   26231feef0abf43a00e0ea834d7e0df0c017be2f
commit: 07bdbc98d5602bb910541fdd75e9756296641e69 [17/19] tracing/ring-buffer: Add last_boot_info file to boot instance
config: hexagon-randconfig-002-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112002.5XO2WnSF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112002.5XO2WnSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112002.5XO2WnSF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:15:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/trace/trace.c:18:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
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
   In file included from kernel/trace/trace.c:18:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
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
   In file included from kernel/trace/trace.c:18:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
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
>> kernel/trace/trace.c:7534:37: warning: unused variable 'last_boot_fops' [-Wunused-const-variable]
    7534 | static const struct file_operations last_boot_fops = {
         |                                     ^~~~~~~~~~~~~~
   8 warnings generated.


vim +/last_boot_fops +7534 kernel/trace/trace.c

  7533	
> 7534	static const struct file_operations last_boot_fops = {
  7535		.open		= tracing_open_generic_tr,
  7536		.read		= tracing_last_boot_read,
  7537		.llseek		= generic_file_llseek,
  7538		.release	= tracing_release_generic_tr,
  7539	};
  7540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
