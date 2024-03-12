Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0420304;
	Tue, 12 Mar 2024 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710242494; cv=none; b=c+ibpCe4xxo0nc+0KyScm273j9nOr5UR67MiR1YBJRx5buhmFFsAEu2Z/oXb97yNdxysqEzC+TXi9vgSahaiw8HNq/oRNFzziz29L1R3E47rMr+RjaI5gn9L3Rt15mnvUj4QwFbC5r3d0sXVZ2ge4fU5s2BCXv8MqtIe8numW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710242494; c=relaxed/simple;
	bh=mv8eQcV7mMhj++73o6DYB+XQ8EpdLm3dx7ntvYIGMmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ga4DWV2VTLDYqvAhJcBTXm0d50sHcRMRN9okWclyNh12yY6VRAVi247Lmb5HmYtmIDHYHqJE3eNanckPArmO/XemC8UFMtpEKHbWYfAQW4+SDEmYfUrdhMrmyCdOIwTflSlKw0EQgxgW/OICoQ2+JJwP7Kd7SkMd3TKmTcyZGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNQ/llvo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNQ/llvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710242491; x=1741778491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mv8eQcV7mMhj++73o6DYB+XQ8EpdLm3dx7ntvYIGMmA=;
  b=aNQ/llvoTl5qqVMiG417fXQmCGGhlXbOZAG++QRCgHxKu3AIRJa8dxsf
   DZDscpG615r7ETxK0LJwMeyO2uQeYykATTIi7T3x+UasGQJAz+3FcVM+5
   xqZVe5bjAcXr8SZGWup5+ayZEiHUgQg0D012TGkEuS+3sK+mq+osAkW8O
   +U3gRa5u5L+/NbjiWH32xA8YhPydpHXG7Kr6gts7dcJSHe7yjSGh83jzz
   z+gldRDy+1z/7FWGYUe8gzdTchnk5isZSo2U/vUjkGMrfq1JTr0lyC1wa
   WBAfB/MVAmaOYG79OEeAzHPrmiAnwhmEHWTpzPuDTdKKYU3JO1KwFsZvA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4817082"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4817082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 04:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11421646"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2024 04:21:28 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk0CE-000A4f-1a;
	Tue, 12 Mar 2024 11:21:26 +0000
Date: Tue, 12 Mar 2024 19:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 12968/13337]
 drivers/gpu/drm/i915/display/intel_bios.c:3417:10: error: call to undeclared
 function 'intel_opregion_vbt_present'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403121924.E3xRqDsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a1184cae56bcb96b86df3ee0377cec507a3f56e0
commit: 9d9bb71f3e115b75ec5e38f087e159a87fc0413a [12968/13337] drm/i915: Extract opregion vbt presence check
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240312/202403121924.E3xRqDsS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121924.E3xRqDsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121924.E3xRqDsS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/intel_bios.c:34:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/i915/display/intel_bios.c:34:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpu/drm/i915/display/intel_bios.c:34:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo.h:11:
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:9:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/i915/display/intel_bios.c:3417:10: error: call to undeclared function 'intel_opregion_vbt_present'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3417 |                 return intel_opregion_vbt_present(i915);
         |                        ^
   drivers/gpu/drm/i915/display/intel_bios.c:3417:10: note: did you mean 'intel_opregion_asle_present'?
   drivers/gpu/drm/i915/display/intel_opregion.h:91:20: note: 'intel_opregion_asle_present' declared here
      91 | static inline bool intel_opregion_asle_present(struct drm_i915_private *i915)
         |                    ^
   17 warnings and 1 error generated.


vim +/intel_opregion_vbt_present +3417 drivers/gpu/drm/i915/display/intel_bios.c

  3374	
  3375	/**
  3376	 * intel_bios_is_lvds_present - is LVDS present in VBT
  3377	 * @i915:	i915 device instance
  3378	 * @i2c_pin:	i2c pin for LVDS if present
  3379	 *
  3380	 * Return true if LVDS is present. If no child devices were parsed from VBT,
  3381	 * assume LVDS is present.
  3382	 */
  3383	bool intel_bios_is_lvds_present(struct drm_i915_private *i915, u8 *i2c_pin)
  3384	{
  3385		const struct intel_bios_encoder_data *devdata;
  3386	
  3387		if (list_empty(&i915->display.vbt.display_devices))
  3388			return true;
  3389	
  3390		list_for_each_entry(devdata, &i915->display.vbt.display_devices, node) {
  3391			const struct child_device_config *child = &devdata->child;
  3392	
  3393			/* If the device type is not LFP, continue.
  3394			 * We have to check both the new identifiers as well as the
  3395			 * old for compatibility with some BIOSes.
  3396			 */
  3397			if (child->device_type != DEVICE_TYPE_INT_LFP &&
  3398			    child->device_type != DEVICE_TYPE_LFP)
  3399				continue;
  3400	
  3401			if (intel_gmbus_is_valid_pin(i915, child->i2c_pin))
  3402				*i2c_pin = child->i2c_pin;
  3403	
  3404			/* However, we cannot trust the BIOS writers to populate
  3405			 * the VBT correctly.  Since LVDS requires additional
  3406			 * information from AIM blocks, a non-zero addin offset is
  3407			 * a good indicator that the LVDS is actually present.
  3408			 */
  3409			if (child->addin_offset)
  3410				return true;
  3411	
  3412			/* But even then some BIOS writers perform some black magic
  3413			 * and instantiate the device without reference to any
  3414			 * additional data.  Trust that if the VBT was written into
  3415			 * the OpRegion then they have validated the LVDS's existence.
  3416			 */
> 3417			return intel_opregion_vbt_present(i915);
  3418		}
  3419	
  3420		return false;
  3421	}
  3422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
