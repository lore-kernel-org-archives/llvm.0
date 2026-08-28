Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C93C0625;
	Fri, 28 Aug 2026 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895378; cv=none; b=DVVwW/84pO+xp9fn+qds8oZ8enjRV+cSfGrJbAL0p1FAH8iZqkFU+hd5zQc3+44u1BZvOgU8RalaUcuTKt1PUxsQagE/deSVFzUXFLEgFP8tOvJCiD3GbRk9+XmS6u4gOcgShqBCc0jnOkoCoDvnKwwFPEMmm7gffJwBzl9q5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895378; c=relaxed/simple;
	bh=iKn/AxbcaG/SFKuLZVkWP/7OHB+ui6OD6ScfCI6qAdY=;
	h=Date:From:Cc:Subject:Message-ID; b=V6xDDr9uPQkBXLEx4/BXUrwKHGsvGAEPbsWb85j9HzpkS90XPhX1oRifhzNcitprx+TiVIPFLyV0INyC6b1j/WQj6QPNDhtnU8j5yandpoWJHMbzsxxRo31JqvKrQYopSu9LcO2N7Q0WVVS/5REQnrsZ4SV8FjbCPhenklJIyRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgTWU+qh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgTWU+qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787895376; x=1819431376;
  h=date:from:cc:subject:message-id;
  bh=iKn/AxbcaG/SFKuLZVkWP/7OHB+ui6OD6ScfCI6qAdY=;
  b=ZgTWU+qhzj+nXCUBVY+oMp7IgafeVIaZ8Isz2ZcLiXow2bEkEZlwygQ0
   oTOH8oNive8cgahRUhMGFSAtYbL1W2sI1UgPj+i2BGl58QtCMYhRTV2C+
   NecrvvsTE1PcomNBKTf1+APfAF4ciDkPvxJ/EcYOIuzLAJqJc9fjAJ3ZA
   pY3DuSuVNfd3tckiBq8Oz0NqnDqgyFIYq58N7Fa7IMC1qXi1O6ky00EfK
   zzLOIiE8gY68Ywnf6F0TbBmfvKzrhTPffcjwmI1A6O04NovPFvYJ7vwWx
   z6YNp3V/B4KF6jF5OG56SY5S0mRPY4QUj16Q489KvSRzqdQh3MhXamEPX
   g==;
X-CSE-ConnectionGUID: P7yDT+vuTKSZSmebVd8PGQ==
X-CSE-MsgGUID: giVmDLv9Ttu7bG2C+WPGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105923786"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105923786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 22:36:15 -0700
X-CSE-ConnectionGUID: Xhjh+JqlQUCOJAV1gd3lew==
X-CSE-MsgGUID: pVZbedQKSQq04mnMCq7mbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="271874340"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2026 22:36:14 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzpG7-00000000ASX-24rt;
	Fri, 28 Aug 2026 05:36:11 +0000
Date: Fri, 28 Aug 2026 13:36:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 8/24]
 include/linux/device/trust.h:35:54: error: incomplete definition of type
 'struct module'
Message-ID: <202608281310.mh1EkInv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: 2a323f22915efbb3253657c0b11a0b81b5d582ef [8/24] device core: Initial device trust infrastructure
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260828/202608281310.mh1EkInv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281310.mh1EkInv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281310.mh1EkInv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:15:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:32:
>> include/linux/device/trust.h:35:54: error: incomplete definition of type 'struct module'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |                                                          ~~~^
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:404:8: note: forward declaration of 'struct module'
     404 | struct module;
         |        ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 include/linux/device/trust.h

    28	
    29	#ifdef CONFIG_DEVICE_TRUST
    30	void module_driver_trust(struct module *mod, const char *val);
    31	void module_driver_trust_init(struct module *mod, bool distrust);
    32	#else
    33	static inline void module_driver_trust(struct module *mod, const char *val)
    34	{
  > 35		pr_warn("module: %s: trust= support disabled\n", mod->name);
    36	}
    37	static inline void module_driver_trust_init(struct module *mod, bool distrust)
    38	{
    39	}
    40	#endif
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
