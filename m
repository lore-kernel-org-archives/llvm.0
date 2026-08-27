Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD743E07D;
	Thu, 27 Aug 2026 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858867; cv=none; b=lD0aWF/zx+1HCnTNF5IMRsGOHx3P9dFRfAG/7oE7egWGaPgCblyMcRUuiD9g2z6xJnMPgR0MH3uEJaZfBydG5rLjO+LxkMmgNSEMpaG/geZNLlE64ZzScEjMIsWN4l3MZz5Wa+x0GJJt5zAHgmWmFG01nKcwv1nYN3YxsiwO5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858867; c=relaxed/simple;
	bh=RCD8CuCB/hsKmymv2I8gqVGxo9Cz8yPG7BhMo4W84eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hb/DwTurW1heh9TUhLkVzzbDpHNzaHzgUr9RfZKN23VzAXu9dM6XPS4csMDLfkeDrjFmSWm6+iKnXxEBMF5nD7f3vNJsCjLL2938pqWTy/su5/VgbNghknCvYJsBpOvug/kUGgbtymbgOujkHkZd56y7qtDWLS0tC//JMZH13bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyrZ5Br/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyrZ5Br/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787858864; x=1819394864;
  h=date:from:to:cc:subject:message-id;
  bh=RCD8CuCB/hsKmymv2I8gqVGxo9Cz8yPG7BhMo4W84eI=;
  b=AyrZ5Br/PlzpoOpIeVnXmSVVhBKyh0OxStNtpPkAEsBEaZJgXPIlEpqe
   wRZBeON7ZkasvB3HdvJAXkNrbqXl70iwz6rZe9HcW8SzMCNLbWJ0DCKSX
   r7gaw8DWdYZWWub56dSK2viKenhedxO/F0fYP/kLBX0aFBNy56NrmEecC
   72GyAGixm7P2ld/YJtXFGzorxumh5i3ihFC86tRsZnaF3rxQXsKKKDLXp
   dXnMV6bu73m187rhwyRi1H7jRKX4hEuNXybGWuG1jH4nOMzWm8mfkLOAM
   fTWL0aMQpWI/Dpk5HvJ7gLpyvO9oB6BZVnivvvkWSsmuYVMHVlaQdhZgJ
   g==;
X-CSE-ConnectionGUID: cEk+4ajZSUycVnUTKjMeZw==
X-CSE-MsgGUID: qo7nG1SsQDGnL0hpf2SSag==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92226716"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="92226716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:27:43 -0700
X-CSE-ConnectionGUID: jWgpd/UnT0eqw5rabxFzrw==
X-CSE-MsgGUID: VH9ORExUQYWuB8f3/KdL5g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2026 12:27:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzflD-000000009xZ-00YZ;
	Thu, 27 Aug 2026 19:27:39 +0000
Date: Fri, 28 Aug 2026 03:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/270-thunderbolt 19/19]
 drivers/thunderbolt/apple.c:705:50: error: incomplete definition of type
 'struct typec_thunderbolt_switch_data'
Message-ID: <202608280301.u6t6MA5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/270-thunderbolt
head:   bcb818cd40b22610c3356572de22d51ecc248dbe
commit: bcb818cd40b22610c3356572de22d51ecc248dbe [19/19] thunderbolt: Add Apple Silicon support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260828/202608280301.u6t6MA5J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608280301.u6t6MA5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608280301.u6t6MA5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thunderbolt/apple.c:56:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/thunderbolt/apple.c:699:22: warning: declaration of 'struct typec_thunderbolt_switch_data' will not be visible outside of this function [-Wvisibility]
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:701:27: error: call to undeclared function 'typec_thunderbolt_switch_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     701 |         struct apple_cio *acio = typec_thunderbolt_switch_get_drvdata(sw);
         |                                  ^
   drivers/thunderbolt/apple.c:701:27: note: did you mean 'typec_switch_get_drvdata'?
   include/linux/usb/typec_mux.h:41:7: note: 'typec_switch_get_drvdata' declared here
      41 | void *typec_switch_get_drvdata(struct typec_switch_dev *sw);
         |       ^
   drivers/thunderbolt/apple.c:701:20: error: incompatible integer to pointer conversion initializing 'struct apple_cio *' with an expression of type 'int' [-Wint-conversion]
     701 |         struct apple_cio *acio = typec_thunderbolt_switch_get_drvdata(sw);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thunderbolt/apple.c:705:50: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     705 |         dev_dbg(acio->dev, "set cable state: %d\n", data->state);
         |                                                     ~~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:707:14: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     707 |         switch (data->state) {
         |                 ~~~~^
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:708:7: error: use of undeclared identifier 'TYPEC_THUNDERBOLT_SWITCH_OFF'
     708 |         case TYPEC_THUNDERBOLT_SWITCH_OFF:
         |              ^
   drivers/thunderbolt/apple.c:711:7: error: use of undeclared identifier 'TYPEC_THUNDERBOLT_SWITCH_TBT'
     711 |         case TYPEC_THUNDERBOLT_SWITCH_TBT:
         |              ^
   drivers/thunderbolt/apple.c:714:11: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     714 |                 if (data->tbt.cable_mode & TBT_CABLE_ACTIVE_PASSIVE) {
         |                     ~~~~^
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:716:14: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     716 |                         if (!(data->tbt.cable_mode & TBT_CABLE_LINK_TRAINING))
         |                               ~~~~^
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:720:23: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                                 ~~~~^
   include/linux/usb/typec_tbt.h:29:48: note: expanded from macro 'TBT_ADAPTER'
      29 | #define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
         |                                                            ^~~~~
   include/linux/bitfield.h:177:31: note: expanded from macro 'FIELD_GET'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                                             ^~~~
   include/linux/bitfield.h:80:24: note: expanded from macro '__BF_FIELD_CHECK_REG'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                                             ^~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:720:23: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                                 ~~~~^
   include/linux/usb/typec_tbt.h:29:48: note: expanded from macro 'TBT_ADAPTER'
      29 | #define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
         |                                                            ^~~~~
   include/linux/bitfield.h:177:31: note: expanded from macro 'FIELD_GET'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                                             ^~~~
   include/linux/bitfield.h:80:24: note: expanded from macro '__BF_FIELD_CHECK_REG'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                                             ^~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:702:22: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:690:23: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:682:9: note: expanded from macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/thunderbolt/apple.c:699:22: note: forward declaration of 'struct typec_thunderbolt_switch_data'
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^
   drivers/thunderbolt/apple.c:720:23: error: incomplete definition of type 'struct typec_thunderbolt_switch_data'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                                 ~~~~^
   include/linux/usb/typec_tbt.h:29:48: note: expanded from macro 'TBT_ADAPTER'
      29 | #define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
         |                                                            ^~~~~


vim +705 drivers/thunderbolt/apple.c

   697	
   698	static int apple_cio_tbt_switch_set(struct typec_thunderbolt_switch_dev *sw,
   699					    const struct typec_thunderbolt_switch_data *data)
   700	{
   701		struct apple_cio *acio = typec_thunderbolt_switch_get_drvdata(sw);
   702	
   703		guard(mutex)(&acio->lock);
   704	
 > 705		dev_dbg(acio->dev, "set cable state: %d\n", data->state);
   706	
   707		switch (data->state) {
   708		case TYPEC_THUNDERBOLT_SWITCH_OFF:
   709			acio->target_cable_info = 0;
   710			break;
   711		case TYPEC_THUNDERBOLT_SWITCH_TBT:
   712			acio->target_cable_info = TB_VSE_CAP_APPLE_CABLE_INFO_PRESENT;
   713			acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_TBT2_3;
   714			if (data->tbt.cable_mode & TBT_CABLE_ACTIVE_PASSIVE) {
   715				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE;
   716				if (!(data->tbt.cable_mode & TBT_CABLE_LINK_TRAINING))
   717					acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_BIDIR_LSRX;
   718			}
   719			/* bit 16 of the Device Discover Mode VDO is 1 for a legacy TBT2 adapter */
   720			if (TBT_ADAPTER(data->tbt.device_mode))
   721				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_LEGACY_ADAPTER;
   722			if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
   723				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS;
   724			if (data->orientation == TYPEC_ORIENTATION_REVERSE)
   725				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE;
   726			dev_dbg(acio->dev,
   727				"TBT cable: cable_mode 0x%x, device_mode 0x%x, enter_vdo 0x%x, orientation %d -> cable info 0x%x\n",
   728				data->tbt.cable_mode, data->tbt.device_mode,
   729				data->tbt.enter_vdo, data->orientation,
   730				acio->target_cable_info);
   731			break;
   732		case TYPEC_THUNDERBOLT_SWITCH_USB4:
   733			acio->target_cable_info = TB_VSE_CAP_APPLE_CABLE_INFO_PRESENT;
   734			if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
   735				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE;
   736			if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
   737				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS;
   738			if (data->orientation == TYPEC_ORIENTATION_REVERSE)
   739				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE;
   740			dev_dbg(acio->dev, "USB4 cable: eudo 0x%x, orientation %d -> cable info 0x%x\n",
   741				data->usb4.eudo, data->orientation, acio->target_cable_info);
   742			break;
   743		}
   744	
   745		if (acio->target_cable_info == acio->current_cable_info)
   746			return 0;
   747	
   748		/*
   749		 * Transitions between different cables without a shutdown inbetween are invalid and can
   750		 * only happen when there's a bug inside the Type-C PD driver. If we tried such a
   751		 * transition, ACIO would crash and then trigger some watchdog that would reset the entire
   752		 * SoC a few seconds later. Shutting down instead only makes the connected device not work
   753		 * but we should be able to recover once the next cable is plugged in.
   754		 */
   755		if (acio->current_cable_info && acio->target_cable_info) {
   756			dev_err(acio->dev,
   757				"Invalid cable transition from 0x%x to 0x%x, shutting down instead\n",
   758				acio->current_cable_info, acio->target_cable_info);
   759			acio->target_cable_info = 0;
   760		}
   761	
   762		/*
   763		 * Bring up or power down the ACIO complex
   764		 * current_cable_info will be updated in the start/stop functions
   765		 */
   766		if (acio->target_cable_info)
   767			return apple_cio_start(acio);
   768	
   769		apple_cio_stop(acio);
   770		return 0;
   771	}
   772	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
