Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4937EFF3;
	Fri,  3 Apr 2026 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205786; cv=none; b=pOCJK25abE3796EBtJyTdYFerIpVeeKag/mn/GH1TqRDDrlvh59Y57HrNMblhHSTfjLu2SQX4XKBMuvEeA7fGswjCteAG9dqVPWhp72579RFeA3kZkZ3O2CWOpVphr8LljT2Zi5dDB3EmvJeQrJReGp8tVvsBCoQ7WELjNgGyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205786; c=relaxed/simple;
	bh=Qtrota7FcU4wS9AgYs1+25wSQW7a/82QFfSTcR7zoGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2w//QkuQAisdf/tHjJ+twHqQjgIJT6ZpR900rGGTPvOB9pYEfjdDaj3mNsLIL42noatDH4yKIeNRaWKorqPz0Hysdpbh+MZ92aUEuwXuZbYoMA4q3T177h46C++oreUIkxuZrlky2pc8Qjh+SMA4LS10SVYL9EA0ZQ9AIbKQl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6Ql/0IQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6Ql/0IQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205785; x=1806741785;
  h=date:from:to:cc:subject:message-id;
  bh=Qtrota7FcU4wS9AgYs1+25wSQW7a/82QFfSTcR7zoGQ=;
  b=D6Ql/0IQAt4izdZP4v4WBTdbgDf912WJPEcys5x5exxfZ0JWJacVFuSq
   OuqQBm9kMdK5ZLq/8ToMSyUjZZmaBpRIV8aAgVlzES0d1lq0UgjInEr6N
   fBYFZBmAWY5+g6pghVMu596he2/TgVmW0hq1CtN89vLEi8aFfEQMeCFNJ
   Mhuc9ZlZ7lnfyJRqRQ0QHJxyk5vysVLW5JjvAVmIuK+a/cVW31YNf0sl9
   1iQ64CBrBEe3gUvuMmFK0Lf+dwvGrdSYcai2Xw4nr3XRQ0jGaUvMWgNgC
   MoW5fm8vH/H3Tbges4lA0hHhJ4Pn62PXNjyrEblzohR5dY3SAYqgcY2Y/
   A==;
X-CSE-ConnectionGUID: 4i7iLnY5QrC32ZQ7j4t9gw==
X-CSE-MsgGUID: iTUYLmVjQTGwhdj0B7yLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311903"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: 3G6fGevZQ0e8KnYQUnEnYQ==
X-CSE-MsgGUID: SFOqt7veQz+WKY3tOZFQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286608"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013j-2BXB;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:pld 32/32]
 drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared
 identifier 'dev'; did you mean 'adev'?
Message-ID: <202604022341.WvI89Nd5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: b8c5b499767feb946c184029ff272276a036623e [32/32] media: ipu-bridge: Prioritise _PLD over SSDB in rotation
config: loongarch-randconfig-002-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022341.WvI89Nd5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022341.WvI89Nd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022341.WvI89Nd5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared identifier 'dev'; did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
         |                                               adev
   include/linux/acpi.h:61:61: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                                           ^
   include/linux/acpi.h:58:51: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                                              ^
   include/acpi/acpi_bus.h:524:10: note: expanded from macro 'to_acpi_device_node'
     524 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                        ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   drivers/media/pci/intel/ipu-bridge.c:287:58: note: 'adev' declared here
     287 | static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
         |                                                          ^
>> drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared identifier 'dev'; did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
         |                                               adev
   include/linux/acpi.h:61:61: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                                           ^
   include/linux/acpi.h:58:51: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                                              ^
   include/acpi/acpi_bus.h:524:51: note: expanded from macro 'to_acpi_device_node'
     524 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   drivers/media/pci/intel/ipu-bridge.c:287:58: note: 'adev' declared here
     287 | static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
         |                                                          ^
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: passing 'typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') to parameter of incompatible type 'const struct fwnode_handle *'; take the address with &
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:526:23: note: expanded from macro 'to_acpi_device_node'
     526 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/acpi/acpi_bus.h:514:54: note: passing argument to parameter 'fwnode' here
     514 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                                                      ^
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: operand of type 'typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') where arithmetic or pointer type is required
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: indirection requires pointer operand ('typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') invalid)
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: indirection requires pointer operand ('typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') invalid)
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   6 errors generated.


vim +300 drivers/media/pci/intel/ipu-bridge.c

   286	
   287	static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
   288					     struct ipu_sensor_ssdb *ssdb,
   289					     struct v4l2_fwnode_device_properties *props)
   290	{
   291		const struct dmi_system_id *dmi_id;
   292		struct acpi_pld_info *pld;
   293	
   294		dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
   295		if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
   296			return 180;
   297	
   298		if (acpi_get_physical_device_location(adev->handle, &pld) &&
   299		    pld->rotation < 8) {
 > 300			acpi_handle_debug(ACPI_HANDLE(dev),
   301					  "_PLD exists; not use rotation %u from SSDB\n",
   302					  ssdb->degree);
   303			return 0;
   304		}
   305	
   306		if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
   307			return props->rotation;
   308	
   309		switch (ssdb->degree) {
   310		case IPU_SENSOR_ROTATION_NORMAL:
   311			return 0;
   312		case IPU_SENSOR_ROTATION_INVERTED:
   313			return 180;
   314		}
   315	
   316		acpi_handle_warn(acpi_device_handle(adev),
   317				 "Unknown rotation %d. Assume 0 degree rotation\n",
   318				 ssdb->degree);
   319		return 0;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
