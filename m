Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01311356756;
	Thu, 21 May 2026 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779401685; cv=none; b=bxx91nAsLSsmDGXbX29nQKjpI5iMvheMdbsjHZfRu6fMaBEzLGRhEYZJeb+yggV6zXVHwBVfohrziN8YoSCnHF6LBhVUU8WrUn3HYZI+QsOO89BC1PuKxObP2/ns1MiJGIE7+qyRbwcMigEI3nPZ8/HOwf+HBVQHSIi7kdiLmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779401685; c=relaxed/simple;
	bh=jjjeLch0HCMRatmlxcDE2irwQannTRXB+eS0znvfkZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=novJY3fP5PQtENSslXOcvflpGf37x/QFUW2yk1eiJEQbMZjoDC8Jm2HLzR4ug/T2m3oBk61Du/8pUxhuc57RROx027PGyi/yud202OExYCq1AAzYtcaZN/f6F9tUmIOzuiDP2+pASchGMdNUsysqwNLJa1nLz09p0tfpYINXWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBnNnMSK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBnNnMSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779401684; x=1810937684;
  h=date:from:to:cc:subject:message-id;
  bh=jjjeLch0HCMRatmlxcDE2irwQannTRXB+eS0znvfkZQ=;
  b=OBnNnMSK/peNaOZVOMyJM18XSl2JtR4jGEKUzwMpRZbvfryEPw23tPhC
   C/0NiU/FSRPoIBqsEMEPYtxxFciduFM5HB7A2Y1j84Zbxfir7WkNslkez
   jkt/6QrAYDM7qiQjJgYlMPTP7N9y10FOsTWJwU5iVxSAh4qyIIz4BduDa
   tnOQuu32QOZVwafFutIqu7icAA/164sJAaH82fuE4viNj0HHJGprX1inI
   xvqIExq+m5xrmzx3KDPn0b81rF2DIwCmWhIQl443EZWFNqglQ1iaHdQ8C
   D6iRCqSPh6q7nzfcx+5+8UUofWFvbu8v8IhFp+RU18jTrfniTDWZIE2Lp
   g==;
X-CSE-ConnectionGUID: SDIjxRZzS3eNafz1jSnMdw==
X-CSE-MsgGUID: MZL+Kj3xRPSmJV7HOmXRVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90906687"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90906687"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:14:43 -0700
X-CSE-ConnectionGUID: E/rHvAICSKeI/QLChFDLnw==
X-CSE-MsgGUID: AX4CEXiwSDqZXPwMbfgOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="264476422"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 15:14:42 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQBf5-000000001FX-0GYh;
	Thu, 21 May 2026 22:14:39 +0000
Date: Fri, 22 May 2026 06:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [linux-next:master 5774/7547]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:9: error: call to
 undeclared function 'cpu_data'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202605220631.ugDr2VPb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Harry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef [5774/7547] drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605220631.ugDr2VPb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220631.ugDr2VPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220631.ugDr2VPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:26:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:9: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:41: error: member reference base type 'int' is not a structure or union
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:24:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:27: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                  ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:26: error: cannot take the address of an rvalue of type 'int'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                 ^~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:7: error: incomplete definition of type 'struct cpuinfo_x86'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |             ~^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:9: note: forward declaration of 'struct cpuinfo_x86'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:23: error: use of undeclared identifier 'X86_VENDOR_AMD'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |                              ^
   1 warning and 4 errors generated.


vim +/cpu_data +2353 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

851a645efd0fee Felix Kuehling  2017-11-27  2342  
520b8fb755ccfb Felix Kuehling  2017-12-08  2343  static int kfd_cpumask_to_apic_id(const struct cpumask *cpumask)
520b8fb755ccfb Felix Kuehling  2017-12-08  2344  {
520b8fb755ccfb Felix Kuehling  2017-12-08  2345  	int first_cpu_of_numa_node;
520b8fb755ccfb Felix Kuehling  2017-12-08  2346  
520b8fb755ccfb Felix Kuehling  2017-12-08  2347  	if (!cpumask || cpumask == cpu_none_mask)
520b8fb755ccfb Felix Kuehling  2017-12-08  2348  		return -1;
520b8fb755ccfb Felix Kuehling  2017-12-08  2349  	first_cpu_of_numa_node = cpumask_first(cpumask);
520b8fb755ccfb Felix Kuehling  2017-12-08  2350  	if (first_cpu_of_numa_node >= nr_cpu_ids)
520b8fb755ccfb Felix Kuehling  2017-12-08  2351  		return -1;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2352  #ifdef CONFIG_X86_64
b9655e702dc5d8 Thomas Gleixner 2023-08-14 @2353  	return cpu_data(first_cpu_of_numa_node).topo.apicid;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2354  #else
df1dd4f4a7271e Felix Kuehling  2019-01-02  2355  	return first_cpu_of_numa_node;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2356  #endif
520b8fb755ccfb Felix Kuehling  2017-12-08  2357  }
520b8fb755ccfb Felix Kuehling  2017-12-08  2358  

:::::: The code at line 2353 was first introduced by commit
:::::: b9655e702dc5d856e5e05ae414b71708ca98b30c x86/cpu: Encapsulate topology information in cpuinfo_x86

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
