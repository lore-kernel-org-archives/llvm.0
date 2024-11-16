Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FA10A1F;
	Sat, 16 Nov 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768636; cv=none; b=rsv+yUpE8Nthi0OJpn5aNlyecrzvsJuXNREvsrvyUYd8/3rkEFacv99jHIKjLW6oDjA/a8gZqtnS6pKVyLMhQTUVwdCynGCPTA2/4EKLeUtrZXymQUxERkKs70vcJfTS3epNP5Y9h+lZO2mZGIfQTQLSJyCuJeJXms5c9xQo9Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768636; c=relaxed/simple;
	bh=MMGv8W4Iy7lQE76BXIu+jNDxKK5bS+6gpL3lgDfTlOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sW4pgSig/aGLlONXp8FtZdZpHle0SoSPQdbJsmQ45uCK3h/Qozmp8zqczJBrBQ1BZs/a0mYY8PhTlnO//NgI/yuXTvFfcxZvp+XId+HQ0y/vlQLwmYjfJc1EHfRTtwJigyl7ROITJB8wzRnHmEK1y3+skXJxLcMLWOtD26JdBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmk1nZdJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmk1nZdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768635; x=1763304635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMGv8W4Iy7lQE76BXIu+jNDxKK5bS+6gpL3lgDfTlOc=;
  b=lmk1nZdJUj+V1qz2yf74cZKD7n2c/pVL9PHOCIH6f6dxZCMdhMMGs5J6
   /Jz7xdujH5qQDl0ppPPeykOoxIiANdpFwa+ai9Mkb7z0gfTPsnUsbiab/
   QYdYSJtFgSM07n3oTHJGdJdi55l8g5s0Tb5G4rhcTUUB5uH6UIutA30ql
   cIF6/HR6u2fa0c0R5l4EIeGYdj1vj1QnIy6TWlz+qUQSor/iDXQiT7v8T
   +ntgJSwiV95/2kQ5NWA9evzMn3SkUaA00X1eidLh6bcgR2yRQV/ViCQ3k
   KoggqitigujKR5JxIQ6RWUjhAbiCcEoJxoPnOiLGQendUZvzxyFp4+rjZ
   A==;
X-CSE-ConnectionGUID: WNW+k0cYRxuUuwW635zCGg==
X-CSE-MsgGUID: 5+ikLU8tQQOsg6tGbOtK6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49197536"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49197536"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:33 -0800
X-CSE-ConnectionGUID: CdEfepqoSPuVLLBm8ufrbw==
X-CSE-MsgGUID: q21jm+DpQG+s0y/wuNZbwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88711494"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2024 06:50:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000ie-3C;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-group 2/3]
 drivers/perf/arm-ni.c:250:2: warning: suggest braces around initialization
 of subobject
Message-ID: <202411161708.GYZwSJIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-group
head:   315538f2d9277d8f786f5c756aedff389fc09195
commit: e4b00ba70c2569fa2c00eb354c97543a94cc9f64 [2/3] sysfs: attribute_group: allow registration of const bin_attribute
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241116/202411161708.GYZwSJIk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161708.GYZwSJIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161708.GYZwSJIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/arm-ni.c:13:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/arm-ni.c:250:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     250 |         NULL
         |         ^~~~
         |         {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   5 warnings generated.


vim +250 drivers/perf/arm-ni.c

4d5a7680f2b4d0 Robin Murphy 2024-09-04  247  
4d5a7680f2b4d0 Robin Murphy 2024-09-04  248  static const struct attribute_group arm_ni_other_attr_group = {
4d5a7680f2b4d0 Robin Murphy 2024-09-04  249  	.attrs = arm_ni_other_attrs,
4d5a7680f2b4d0 Robin Murphy 2024-09-04 @250  	NULL
4d5a7680f2b4d0 Robin Murphy 2024-09-04  251  };
4d5a7680f2b4d0 Robin Murphy 2024-09-04  252  

:::::: The code at line 250 was first introduced by commit
:::::: 4d5a7680f2b4d0c2955e1d9f9a594b050d637436 perf: Add driver for Arm NI-700 interconnect PMU

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
