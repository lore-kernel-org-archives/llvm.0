Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5D22B8DA;
	Wed,  5 Feb 2025 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753409; cv=none; b=l4a5AfgUYV4HrD8jyQTVidon3A3lLZVsLM3pxqybYfa3WfWH9wWwMpunT4TKUeYjVxUfPzoWszKjZKqHrqLAQcZD6mChP3urfNHsWfWyZLPp+aZZfqC8I4jXOUZI3mlogsJPn4FHAS9SJiV0b3+COMUZOJL06097Ko1HBQ6CGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753409; c=relaxed/simple;
	bh=WUbTXiKZFseAnQx3HgfxUzvV5oiAHVv5/NBFMDc74RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9CWJ1uNgP+qyuFQuTOTvYciDu4MIFype5/tzipKMLeBFnAYkAnno78X3OxyhTi9Fe+tMDg9ebrwUBwtgxz4mmHlw0+3L5Nxu8oErBOuJKdySZieuWz/nDBR2ezvBR0B3fliNjjvuLTbbbSk1+VQvOltlob8WPsPYzm2AftNzSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWYwkovy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWYwkovy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738753408; x=1770289408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUbTXiKZFseAnQx3HgfxUzvV5oiAHVv5/NBFMDc74RA=;
  b=NWYwkovy5h1yBEiOZcHWF51yz53f/g/77aSQcmWVZkqF9d0PF3C+5agq
   E6DDe7EORqFJc4NlE4wFdTxidVquUQmLOqN5jDPM7LYoIhqFzcAmZcXgk
   cqGDWt/XvDWdSiwHy+3Dg2YMtHqbEdd3EKo5lMou5MGZ8HjasJ3QvA7hZ
   EeG1oIY0n+lmr6siYbsAur2qeqLoqmCcZZd+L8LDufF6s99RoKdoXMNmD
   B21bZ3VLv8OT1WugeX/Z15MkM0WV7er3GuWR7wbizcsn93SWBkpncyNVj
   toM5n9/i49tjwTLEGL6Mt3MxwmtjjpepBiaw/BH006Eci3eIOkFKusmxa
   g==;
X-CSE-ConnectionGUID: 951v5D6+T/CJPmieHLdi1w==
X-CSE-MsgGUID: 7szc6zpXR/G+U4A6sGrQmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50733227"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50733227"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:03:27 -0800
X-CSE-ConnectionGUID: dX+TtBxvQsuvv0Gis0Gm9g==
X-CSE-MsgGUID: TYoU+u9VRWKYG0N+Rziicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114941022"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 03:03:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfdBj-000tnn-0m;
	Wed, 05 Feb 2025 11:03:23 +0000
Date: Wed, 5 Feb 2025 19:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 1/26] drivers/hv/vmbus_drv.c:2638:13: error:
 incompatible function pointer types initializing 'int (*)(struct syscore_ops
 *)' with an expression of type 'int (void)'
Message-ID: <202502051808.kZGfNpnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   a402c19b24a5dc1ba2f6fb41de0080a97c202c1b
commit: f5ff652a1c2ce0a75ce86425cbc5f499933c9018 [1/26] syscore: Pass context data to callbacks
config: i386-buildonly-randconfig-005-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051808.kZGfNpnd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051808.kZGfNpnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051808.kZGfNpnd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/vmbus_drv.c:2638:13: error: incompatible function pointer types initializing 'int (*)(struct syscore_ops *)' with an expression of type 'int (void)' [-Wincompatible-function-pointer-types]
    2638 |         .suspend = hv_synic_suspend,
         |                    ^~~~~~~~~~~~~~~~
>> drivers/hv/vmbus_drv.c:2639:12: error: incompatible function pointer types initializing 'void (*)(struct syscore_ops *)' with an expression of type 'void (void)' [-Wincompatible-function-pointer-types]
    2639 |         .resume = hv_synic_resume,
         |                   ^~~~~~~~~~~~~~~
   2 errors generated.
--
>> arch/x86/kernel/cpu/intel_epb.c:188:20: error: too few arguments to function call, single argument 'ops' was not specified
     188 |         intel_epb_restore();
         |         ~~~~~~~~~~~~~~~~~ ^
   arch/x86/kernel/cpu/intel_epb.c:92:13: note: 'intel_epb_restore' declared here
      92 | static void intel_epb_restore(struct syscore_ops *ops)
         |             ^                 ~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/intel_epb.c:202:17: error: too few arguments to function call, single argument 'ops' was not specified
     202 |         intel_epb_save();
         |         ~~~~~~~~~~~~~~ ^
   arch/x86/kernel/cpu/intel_epb.c:78:12: note: 'intel_epb_save' declared here
      78 | static int intel_epb_save(struct syscore_ops *ops)
         |            ^              ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> arch/x86/kernel/cpu/microcode/core.c:754:6: error: conflicting types for 'microcode_bsp_resume'
     754 | void microcode_bsp_resume(struct syscore_ops *ops)
         |      ^
   arch/x86/include/asm/microcode.h:19:6: note: previous declaration is here
      19 | void microcode_bsp_resume(void);
         |      ^
>> arch/x86/kernel/cpu/microcode/core.c:766:12: error: incompatible function pointer types initializing 'void (*)(struct syscore_ops *)' with an expression of type 'void (void)' [-Wincompatible-function-pointer-types]
     766 |         .resume = microcode_bsp_resume,
         |                   ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +2638 drivers/hv/vmbus_drv.c

63ecc6d22ce466 Dexuan Cui 2019-09-05  2635  
63ecc6d22ce466 Dexuan Cui 2019-09-05  2636  /* The callbacks run only on CPU0, with irqs_disabled. */
63ecc6d22ce466 Dexuan Cui 2019-09-05  2637  static struct syscore_ops hv_synic_syscore_ops = {
63ecc6d22ce466 Dexuan Cui 2019-09-05 @2638  	.suspend = hv_synic_suspend,
63ecc6d22ce466 Dexuan Cui 2019-09-05 @2639  	.resume = hv_synic_resume,
63ecc6d22ce466 Dexuan Cui 2019-09-05  2640  };
63ecc6d22ce466 Dexuan Cui 2019-09-05  2641  

:::::: The code at line 2638 was first introduced by commit
:::::: 63ecc6d22ce46643165c391a9c90ba67e22e1c0f Drivers: hv: vmbus: Suspend/resume the synic for hibernation

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
