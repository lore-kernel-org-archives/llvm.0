Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFA259498;
	Wed, 11 Dec 2024 20:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733950355; cv=none; b=EW889osOUR3ig4GpWluUQH1DKbYEqd06kQeAj+ukhrRbvvbawwrY+HC1QbW26KTJSGbFyd/NfuRbKOXlAS+HulP1uGdt/GokUro24EOz0BUo2OTYJQdoBc9T9mEwkNfl0BwqjEv+KEEOkdnXMP1T0A5vcSneI/ujVUHreFni0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733950355; c=relaxed/simple;
	bh=3h6Hu7L9W7Pn/7K1xmkGQ8Hj7lA9WEbVPJILUV7jb2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+jjsvw9UVRuDyqY1EFtB1Xgg14h5nID2yr7OX80/0KsGLfzkyzISmPRf9exbm4YJbtuiycgNOT8abxJRf1BRGrRsP3HZOe5kkEpQz/NPuOV0A4yv0ocV05hcojNX4XWpdBDhMW/lNpX/JDe58jduhwb9kEbDNojZHDaIujVDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5VWHPg+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5VWHPg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733950353; x=1765486353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3h6Hu7L9W7Pn/7K1xmkGQ8Hj7lA9WEbVPJILUV7jb2I=;
  b=S5VWHPg+OOSNXy/l4psBfMfRyg2MF/ytCtdQeKiCUIq9Y0RyFFdOqzDR
   HfOBjiUfep+LIZt6wvaz763KIqHaioknPetl9SbAkLgB0jJzOsUlHclQz
   jAzBZJjZ5KbNeyzYdhGKQhwO/nX8KTBcDUT8gffddXByYslEHSveIH+yf
   mN5tvGL3iUWiiOovWG2KyS82v/zz/2WydHl1pDmIQRpIKmpY5PlxBuE+n
   04kFssjWJrQc9cUMUR275hFpK+ZQRJ0JQSy3em1JUbp8PV9tqTOR+ivL0
   am69CVxVkIQLnP2C7eL4D/rATpb+9Nlc/qJbqD77LhTDKQslbUe/519ka
   Q==;
X-CSE-ConnectionGUID: 5/y1B7UAQFOm+aaDnscz7A==
X-CSE-MsgGUID: RBM7k/5pRzGFgZ6rzBEM0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34249602"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34249602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 12:52:00 -0800
X-CSE-ConnectionGUID: bg6DSzQPTveL/Hd/LBSe9w==
X-CSE-MsgGUID: mxni/ChpSWqCFYIy9Bxjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126918291"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 12:51:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLTgV-00074X-20;
	Wed, 11 Dec 2024 20:51:51 +0000
Date: Thu, 12 Dec 2024 04:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Message-ID: <202412120425.1OdD2sa1-lkp@intel.com>
References: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>

Hi Xianwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 171aa289a6fe65faffeb92a1fda283c055435a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241211-144931
base:   171aa289a6fe65faffeb92a1fda283c055435a62
patch link:    https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-2-410727335119%40amlogic.com
patch subject: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
config: i386-buildonly-randconfig-004-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120425.1OdD2sa1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120425.1OdD2sa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120425.1OdD2sa1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-amlogic.c:38:2: error: expected identifier
      38 |         REG_OUT,
         |         ^
   arch/x86/include/asm/arch_hweight.h:12:17: note: expanded from macro 'REG_OUT'
      12 | #define REG_OUT "a"
         |                 ^
   drivers/pinctrl/pinctrl-amlogic.c:39:2: error: expected identifier
      39 |         REG_IN,
         |         ^
   arch/x86/include/asm/arch_hweight.h:11:16: note: expanded from macro 'REG_IN'
      11 | #define REG_IN "a"
         |                ^
>> drivers/pinctrl/pinctrl-amlogic.c:45:14: warning: excess elements in array initializer [-Wexcess-initializers]
      45 |         1, 1, 1, 1, 1, 2
         |                     ^
   drivers/pinctrl/pinctrl-amlogic.c:49:14: warning: excess elements in array initializer [-Wexcess-initializers]
      49 |         3, 4, 2, 1, 0, 7
         |                     ^
>> drivers/pinctrl/pinctrl-amlogic.c:311:45: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'unsigned int' [-Wint-conversion]
     311 |         return aml_pinconf_get_gpio_bit(info, pin, REG_OUT);
         |                                                    ^~~~~~~
   arch/x86/include/asm/arch_hweight.h:12:17: note: expanded from macro 'REG_OUT'
      12 | #define REG_OUT "a"
         |                 ^~~
   drivers/pinctrl/pinctrl-amlogic.c:284:22: note: passing argument to parameter 'reg_type' here
     284 |                                     unsigned int reg_type)
         |                                                  ^
   drivers/pinctrl/pinctrl-amlogic.c:446:45: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'unsigned int' [-Wint-conversion]
     446 |         return aml_pinconf_set_gpio_bit(info, pin, REG_OUT, high);
         |                                                    ^~~~~~~
   arch/x86/include/asm/arch_hweight.h:12:17: note: expanded from macro 'REG_OUT'
      12 | #define REG_OUT "a"
         |                 ^~~
   drivers/pinctrl/pinctrl-amlogic.c:425:22: note: passing argument to parameter 'reg_type' here
     425 |                                     unsigned int reg_type,
         |                                                  ^
>> drivers/pinctrl/pinctrl-amlogic.c:936:34: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'enum aml_reg_type' [-Wint-conversion]
     936 |         aml_gpio_calc_reg_and_bit(bank, REG_OUT, gpio, &reg, &bit);
         |                                         ^~~~~~~
   arch/x86/include/asm/arch_hweight.h:12:17: note: expanded from macro 'REG_OUT'
      12 | #define REG_OUT "a"
         |                 ^~~
   drivers/pinctrl/pinctrl-amlogic.c:884:28: note: passing argument to parameter 'reg_type' here
     884 |                                             enum aml_reg_type reg_type,
         |                                                               ^
   drivers/pinctrl/pinctrl-amlogic.c:948:34: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'enum aml_reg_type' [-Wint-conversion]
     948 |         aml_gpio_calc_reg_and_bit(bank, REG_OUT, gpio, &reg, &bit);
         |                                         ^~~~~~~
   arch/x86/include/asm/arch_hweight.h:12:17: note: expanded from macro 'REG_OUT'
      12 | #define REG_OUT "a"
         |                 ^~~
   drivers/pinctrl/pinctrl-amlogic.c:884:28: note: passing argument to parameter 'reg_type' here
     884 |                                             enum aml_reg_type reg_type,
         |                                                               ^
   drivers/pinctrl/pinctrl-amlogic.c:960:34: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'enum aml_reg_type' [-Wint-conversion]
     960 |         aml_gpio_calc_reg_and_bit(bank, REG_IN, gpio, &reg, &bit);
         |                                         ^~~~~~
   arch/x86/include/asm/arch_hweight.h:11:16: note: expanded from macro 'REG_IN'
      11 | #define REG_IN "a"
         |                ^~~
   drivers/pinctrl/pinctrl-amlogic.c:884:28: note: passing argument to parameter 'reg_type' here
     884 |                                             enum aml_reg_type reg_type,
         |                                                               ^
   2 warnings and 7 errors generated.


vim +38 drivers/pinctrl/pinctrl-amlogic.c

    28	
    29	#define gpio_chip_to_bank(chip) \
    30			container_of(chip, struct aml_gpio_bank, gpio_chip)
    31	/**
    32	 * enum aml_reg_type - type of registers encoded in @aml_reg_desc
    33	 */
    34	enum aml_reg_type {
    35		REG_PULLEN,
    36		REG_PULL,
    37		REG_DIR,
  > 38		REG_OUT,
    39		REG_IN,
    40		REG_DS,
    41		NUM_REG,
    42	};
    43	
    44	static const unsigned int aml_bit_strides[NUM_REG] = {
  > 45		1, 1, 1, 1, 1, 2
    46	};
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
