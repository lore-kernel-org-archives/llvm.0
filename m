Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0629319D076;
	Tue, 27 Aug 2024 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763624; cv=none; b=VTEGzGZi4JTpeuerVlQUgg9cGzGSAugf/5fGdWoQ+wVPzlyimkKfToFFmHn9jMmIahyMIihbMkRI0Relgu9FfeGFjIPpYZ6yVXbslYINPGjXTRcggH21iBQV2FeYpCQxfq6KxnR7bhz3wSDQ/mj5MpyfapSHMGDBPbo990zGH9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763624; c=relaxed/simple;
	bh=4cvXnTWp6FoaAip3grs43rS1U+ScVhROAGcV/c/9jnU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHK41antw8F+U/uSfKg+wdMn6+lStJUxHF0JCspUmyQSffJfFSg3+Wv20PSfpYeBBPQu5g4cHKN5jiwtn272DviwaLITOiRWamSxvAgMc0s2uOlfOF3JGsndxmSzAeRvqZ6/S6fl1g0wZN3Oc+Abn/4fcNeV0+TYGFlZ6h+OLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2T6vMSX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2T6vMSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724763622; x=1756299622;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4cvXnTWp6FoaAip3grs43rS1U+ScVhROAGcV/c/9jnU=;
  b=m2T6vMSX6uXh5XpsVEOrDyaS3SdXtKxiAAtD3TzyNV4NGFJNmzj51vVm
   L8Zr7T8nzD6Bic8jLbUUX+rgxrRetorZEnoywN2GM6UpFnyhF01YtvUES
   u2YQKfjtPvVHO9KdH7mJ+oJrPfnOXx9q73I/x1CqYDFJFNzCFWsGeqVQV
   aH9hN+FGH3BMPdFOejGDfU8B0VW/ZItmPVp30/rh1Hd7my8yEo02hYy4T
   cnXs84eIuQNgtRcRzMM2KjYnilifiZtCyP+k7Q+60CzIM7ymPfNgmmGNZ
   75cwKPdGgoH+SPm4GGfoxP69TLYt+suBwJQUw8+sfSYbdXBrUM82XPEES
   Q==;
X-CSE-ConnectionGUID: d9/edYa2RrSdTZms8saH8w==
X-CSE-MsgGUID: 0SrIK1uSScSskb/kgf49+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40708884"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="40708884"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 06:00:21 -0700
X-CSE-ConnectionGUID: CYs+sTRMQf+UXDBxSh7k2w==
X-CSE-MsgGUID: LVovynCsQHaVEPCJrzkE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62567839"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 06:00:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sivo1-000If6-35;
	Tue, 27 Aug 2024 13:00:17 +0000
Date: Tue, 27 Aug 2024 20:59:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 07/12] drm/i915/display: Move dss stuff in intel_dss files
Message-ID: <202408272006.MeBwKwmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240826111527.1113622-8-ankit.k.nautiyal@intel.com>
References: <20240826111527.1113622-8-ankit.k.nautiyal@intel.com>
TO: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: jani.nikula@linux.intel.com
CC: suraj.kandpal@intel.com
CC: ville.syrjala@linux.intel.com

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-xe/drm-xe-next next-20240826]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-display-Move-all-DSS-control-registers-to-a-new-file/20240826-191600
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240826111527.1113622-8-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 07/12] drm/i915/display: Move dss stuff in intel_dss files
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408272006.MeBwKwmM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408272006.MeBwKwmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408272006.MeBwKwmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from drivers/gpu/drm/i915/display/intel_dss.c:6:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/i915/display/intel_dss.c:6:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/i915/display/intel_dss.c:6:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:39:
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
>> drivers/gpu/drm/i915/display/intel_dss.c:255:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     255 |         power_domain = POWER_DOMAIN_PIPE(pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:120:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
     120 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +255 drivers/gpu/drm/i915/display/intel_dss.c

   241	
   242	void intel_dss_get_uncompressed_joiner_pipes(struct intel_display *display,
   243						     struct intel_crtc *crtc,
   244						     u8 *primary_pipes,
   245						     u8 *secondary_pipes)
   246	{
   247		struct drm_i915_private *i915 = to_i915(display->drm);
   248		enum intel_display_power_domain power_domain;
   249		enum pipe pipe = crtc->pipe;
   250		intel_wakeref_t wakeref;
   251	
   252		if (DISPLAY_VER(display) < 13)
   253			return;
   254	
 > 255		power_domain = POWER_DOMAIN_PIPE(pipe);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
