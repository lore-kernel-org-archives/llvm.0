Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B5201004;
	Thu, 14 May 2026 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719556; cv=none; b=dY5CvDrFNkgi9vk/jVh825QEbxEHdjyGVrTzAjSpUBATG71C1vZ22Kbqko5GjKU3NxyMM22ubKI+zzyiiWB5hiMRslqiPeHrl3erhaSXSCpvOXIrO/IwmOM8QNAyQgL7WhO4+wVxxYMFo3sYD6N7JBU7uXrq6Sbnvre1frGwUg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719556; c=relaxed/simple;
	bh=155Am94qWe/f3pp9RvZy6Owf9p1+ieYSxje12j4/trI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtF6ip8ZlD8IEbWkJZgEHZkRLW7FgQ7CcfeTQv9VC6G/sniR+JRXUhZxdw2VXz/musZo/xapdWb1EPWtWmHo7rT6AOwq8ZV9Ze5+VhSTKtxnz8T7ak550UTcoETrnV2Ha3SZdDejI89yxm5kkP5pfW0A5+3h1tfaFD3URZXg6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9x5LtE/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9x5LtE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778719555; x=1810255555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=155Am94qWe/f3pp9RvZy6Owf9p1+ieYSxje12j4/trI=;
  b=Z9x5LtE/f5G+mJGIrR7L6KoRTkAuDRvvTMQ/PE9HPyB1DvAE/4OXBNiC
   c2f63bHqcZBND0PxG47MRkpj05z5yFaVVvLTo1a58Pkjwkh1kCTiKRqj7
   Lc1BgYPNA6UvjLODatVhjz9XZkoZKupBLl6UteN8S5p4ulstxjCGxQysn
   wIc9w5IgJmjiGd3njh/uLIeb22Gnrsojhs7jVkZBv/hnKarSManKQeiOR
   6j0aJ38d2Mmv2FDoXVQ0onAJnLdsWOj07uNODj1Pwx6WPlMXs90/BXpQK
   NsY2HGEwt8PIc8xI9yRChvqobVIaSgPUTtGBZcOBOnNx1h4MAibvE073h
   g==;
X-CSE-ConnectionGUID: KfQpjMqbSc6FxcEqMnCF8Q==
X-CSE-MsgGUID: f+jdMg3sRiiC0WxaadAQwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82222880"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82222880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:45:54 -0700
X-CSE-ConnectionGUID: G/z3JY/6QK69mHz1Z2vkxQ==
X-CSE-MsgGUID: Ja+PiS1rSnicC0N+EQfSmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235578919"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2026 17:45:50 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKCy-000000005RD-27ZJ;
	Thu, 14 May 2026 00:45:48 +0000
Date: Thu, 14 May 2026 08:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, alexander.deucher@amd.com,
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
	timur.kristof@gmail.com, pratap.nirujogi@amd.com,
	vitaly.prosyak@amd.com, harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amdgpu: Remove UML build exclusion from Kconfig
Message-ID: <202605140801.Fqury68H-lkp@intel.com>
References: <20260505162018.1755740-1-alex.hung@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505162018.1755740-1-alex.hung@amd.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-amdgpu-Remove-UML-build-exclusion-from-Kconfig/20260513-150500
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260505162018.1755740-1-alex.hung%40amd.com
patch subject: [PATCH] drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605140801.Fqury68H-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140801.Fqury68H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140801.Fqury68H-lkp@intel.com/

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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:7: error: incomplete definition of type 'struct cpuinfo_x86'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |             ~^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:9: note: forward declaration of 'struct cpuinfo_x86'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:23: error: use of undeclared identifier 'X86_VENDOR_AMD'
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
