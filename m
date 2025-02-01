Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04E84A2F;
	Sat,  1 Feb 2025 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738421726; cv=none; b=M/a7dG7jjTZLa0Ycg/JC2OXYaEdfbwh8Od2sAXNyY1RDEPjzxeUA1gnlA7/nyK26hh9hiYm03Ay3v01VTaBZFeV7OYgMvXbts+lxlC5iipNhpJia84PyaWFXUnREjaln0+Io26nJKp9ihJMhBN0AOrKek+dkXUX/KmoHjCplVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738421726; c=relaxed/simple;
	bh=DC/Z1/NQhualURhPx6VskanYsqCWZuLs0TCf65OfsDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lruLLMBSKICavemu2+EBzoxl/alVJJ7nEKlNUtx/IpVu13fvVqbSX40bo6nZxIfs1+LHZUWFuxD/6qHePYrUDIgDOyf0y2+VPKDqA55iNQyJF3tl3uo+cMp8gyheirjxSgOqrklFMcUw3XQrKdZeUHfqaE06XXfF+RT6aC1ho5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmJ231vr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmJ231vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738421724; x=1769957724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DC/Z1/NQhualURhPx6VskanYsqCWZuLs0TCf65OfsDM=;
  b=KmJ231vrIUTytx7jJKMSP+kisCcwmrWnSAw/Pieeawv6c7IUqp8Byd86
   tD7+7wbNMOA8rWVj/sCT4cSV0zP05jtiOqXcqwWBcGIVS0Xd9RzNiLBgb
   Hvwt5MEXIZGqjXiXvsOSZkh071PMfC+9+Y4AakB/D6K/KD0CYePc6Dq5J
   ywS3XFgqk1E1wyoNhWPQk75BiCdQen60i12hqJc0IjVBId4hZv/A6Mr02
   AlBgdJ5tBTrJfkK+n4rq0tJzVZYZnYMv1CUJJuRmcfl0ywr9op15k5tuM
   gkOY6JAXtfNvSZqHW/6Xc78rPm/zifZ/aEc5yD/Vy48kh+rKMBQ49JHVM
   Q==;
X-CSE-ConnectionGUID: NVlXcL/4TwSARdhMirjYDA==
X-CSE-MsgGUID: 9VjhdbUFQwyzQa8Al7L3dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38179196"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38179196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 06:55:23 -0800
X-CSE-ConnectionGUID: PSAHGiQwRyqy/7B3FkiQOA==
X-CSE-MsgGUID: UvQilJ1XR/KcQT/apWVYgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109655268"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2025 06:55:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teEtz-000oHQ-11;
	Sat, 01 Feb 2025 14:55:19 +0000
Date: Sat, 1 Feb 2025 22:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gabriel Somlo <gsomlo@gmail.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:539:21:
 warning: use of logical '&&' with constant operand
Message-ID: <202502012258.KCOVEE5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   d063b9bfd84d4ae32eaa664cd7b8906d1e5a4265
commit: b3db33d374f80bc6db7c611301e3290cec95fee2 [14/15] LiteX: driver for MMCM
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250201/202502012258.KCOVEE5t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502012258.KCOVEE5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502012258.KCOVEE5t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/clk-litex.c:11:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
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
>> drivers/clk/clk-litex.c:539:21: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     539 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^  ~~~~~~~~~~~~
   drivers/clk/clk-litex.c:539:21: note: use '&' for a bitwise operation
     539 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^~
         |                            &
   drivers/clk/clk-litex.c:539:21: note: remove constant to silence this warning
     539 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^~~~~~~~~~~~~~~
   drivers/clk/clk-litex.c:540:41: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     540 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^  ~~~~~~~~~~~~
   drivers/clk/clk-litex.c:540:41: note: use '&' for a bitwise operation
     540 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^~
         |                                                &
   drivers/clk/clk-litex.c:540:41: note: remove constant to silence this warning
     540 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^~~~~~~~~~~~~~~
   drivers/clk/clk-litex.c:558:21: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     558 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^  ~~~~~~~~~~~~
   drivers/clk/clk-litex.c:558:21: note: use '&' for a bitwise operation
     558 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^~
         |                            &
   drivers/clk/clk-litex.c:558:21: note: remove constant to silence this warning
     558 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
         |                            ^~~~~~~~~~~~~~~
   drivers/clk/clk-litex.c:559:41: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     559 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^  ~~~~~~~~~~~~
   drivers/clk/clk-litex.c:559:41: note: use '&' for a bitwise operation
     559 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^~
         |                                                &
   drivers/clk/clk-litex.c:559:41: note: remove constant to silence this warning
     559 |         mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
         |                                                ^~~~~~~~~~~~~~~
   drivers/clk/clk-litex.c:728:19: warning: unused function 'litex_clk_calc_duty_high_time' [-Wunused-function]
     728 | static inline int litex_clk_calc_duty_high_time(struct clk_hw *hw,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +539 drivers/clk/clk-litex.c

   533	
   534	static int litex_clk_set_filt(struct clk_hw *hw)
   535	{
   536		u32 filt, mul;
   537		int ret;
   538	
 > 539		mul = GLOB_MUL_VAL && HL_TIME_MASK;
   540		mul += (GLOB_MUL_VAL >> HIGH_TIME_POS) && HL_TIME_MASK;
   541	
   542		filt = litex_clk_lookup_filter(mul - 1);
   543	
   544		ret = litex_clk_change_value(hw, FILT_MASK, filt >> 16, FILT_REG1);
   545		if (ret != 0)
   546			return ret;
   547		ret = litex_clk_change_value(hw, FILT_MASK, filt, FILT_REG2);
   548		if (ret != 0)
   549			return ret;
   550		return 0;
   551	}
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
