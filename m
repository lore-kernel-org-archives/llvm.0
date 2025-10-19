Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46619F50F;
	Sun, 19 Oct 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760878665; cv=none; b=lTEK0/5AjMGBU01kI6+KHALaIatQz+0jFYaI2kDBnLPJWk+kaFX0hvbqZ8OCqEb+9fcRZpXDn1JV7eKqsOkzdV4bteO5QcZIw0D5aVYpcsLLZSIxjiDJtMFEkpvSrNNoYBZ7gJ85uWwd1+B5i/HnwwB2rpd7O3eGWaH/1Wv2QL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760878665; c=relaxed/simple;
	bh=jEZiC7X2QNsQLAD9jlRi4tslgCy/k+7lGPGbPkVrjSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvDYT1NpcbKsLTIYNsA+tl3tAIV4r5W/L1w1VhvekGzTTVZp3nnlHDMaGkZYsQHeafwqMOrwixpg9tflgHtmwMopE9BB5aW3J5rkgGlSzx4YrlN3tWEAL4h2KF6UD/YqW/XNGTcUwk3jL5gLV7XSgyNI3vdR2uDSe/pOmHyenOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiKyVmUD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiKyVmUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760878664; x=1792414664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jEZiC7X2QNsQLAD9jlRi4tslgCy/k+7lGPGbPkVrjSg=;
  b=aiKyVmUD0gzBRUHCXeDeJUl1yCH8cn/rXvXQXf0atwrfsHm3OhQmxtBY
   Pw9WPfOf/DAlP24sjp86GYlGNzMDpHBFhYHOCzT7hk0R13g6CHDQ6ml/8
   +iTbFIYXUPTCJ4L0N27uHqPwGnhjP+406wO4Gz3PRIWPLQVGIDwxpDFfA
   t/oizfRnATga+QdOUqbAfJoD3Q3Wgb08bosf/qsweUuQExUFpLPZ/+IWN
   y7o/mzFqeu2ETxyLKoOlHyy9nqe4l2M7kx49aC8Iy26yfSn672jUC99kB
   ImLmXRVnEuBNzxBqAwd8baAe/E6PUdUJxG7n6uCKpvgvSn2w+GrFpu89R
   Q==;
X-CSE-ConnectionGUID: vu8p2WksR1G3Ttz4pawJ2Q==
X-CSE-MsgGUID: Ye6YgSNUTx6f22FanxrXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62726526"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="62726526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 05:57:43 -0700
X-CSE-ConnectionGUID: pFYO7etPRROgwJ/u8Ms2LQ==
X-CSE-MsgGUID: RTBNqVvGSCyL7lqxR7gJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="220275201"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2025 05:57:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vASyg-00095F-3B;
	Sun, 19 Oct 2025 12:57:38 +0000
Date: Sun, 19 Oct 2025 20:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot+extras/v6.18-rc1 80/140]
 drivers/resctrl/mpam_devices.c:753:16: error: use of undeclared identifier
 'MPAMF_IIDR_PRODUCTID_SHIFT'
Message-ID: <202510192055.5VsBLMlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.18-rc1
head:   836647f4ba9f3290eb1990aa094afb81fb87c1d7
commit: 12faaa68b875e7bb73ab9894cdbddbd2d76907de [80/140] arm_mpam: Add workaround for T241-MPAM-1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251019/202510192055.5VsBLMlN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510192055.5VsBLMlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510192055.5VsBLMlN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/resctrl/mpam_devices.c:753:16: error: use of undeclared identifier 'MPAMF_IIDR_PRODUCTID_SHIFT'
     753 |         .iidr       = IIDR_PROD(0x241) | IIDR_VAR(0) | IIDR_REV(0) | IIDR_IMP(0x36b),
         |                       ^
   drivers/resctrl/mpam_internal.h:241:30: note: expanded from macro 'IIDR_PROD'
     241 | #define IIDR_PROD(x)    ((x) << MPAMF_IIDR_PRODUCTID_SHIFT)
         |                                 ^
>> drivers/resctrl/mpam_devices.c:753:35: error: use of undeclared identifier 'MPAMF_IIDR_VARIANT_SHIFT'
     753 |         .iidr       = IIDR_PROD(0x241) | IIDR_VAR(0) | IIDR_REV(0) | IIDR_IMP(0x36b),
         |                                          ^
   drivers/resctrl/mpam_internal.h:242:29: note: expanded from macro 'IIDR_VAR'
     242 | #define IIDR_VAR(x)     ((x) << MPAMF_IIDR_VARIANT_SHIFT)
         |                                 ^
>> drivers/resctrl/mpam_devices.c:753:49: error: use of undeclared identifier 'MPAMF_IIDR_REVISON_SHIFT'
     753 |         .iidr       = IIDR_PROD(0x241) | IIDR_VAR(0) | IIDR_REV(0) | IIDR_IMP(0x36b),
         |                                                        ^
   drivers/resctrl/mpam_internal.h:243:29: note: expanded from macro 'IIDR_REV'
     243 | #define IIDR_REV(x)     ((x) << MPAMF_IIDR_REVISON_SHIFT)
         |                                 ^
>> drivers/resctrl/mpam_devices.c:753:63: error: use of undeclared identifier 'MPAMF_IIDR_IMPLEMENTER_SHIFT'
     753 |         .iidr       = IIDR_PROD(0x241) | IIDR_VAR(0) | IIDR_REV(0) | IIDR_IMP(0x36b),
         |                                                                      ^
   drivers/resctrl/mpam_internal.h:244:29: note: expanded from macro 'IIDR_IMP'
     244 | #define IIDR_IMP(x)     ((x) << MPAMF_IIDR_IMPLEMENTER_SHIFT)
         |                                 ^
   drivers/resctrl/mpam_devices.c:754:16: error: use of undeclared identifier 'MPAMF_IIDR_PRODUCTID_SHIFT'
     754 |         .iidr_mask  = IIDR_MATCH_ONE,
         |                       ^
   drivers/resctrl/mpam_internal.h:246:25: note: expanded from macro 'IIDR_MATCH_ONE'
     246 | #define IIDR_MATCH_ONE  (IIDR_PROD(0xfff) | IIDR_VAR(0xf) | IIDR_REV(0xf) | IIDR_IMP(0xfff))
         |                          ^
   drivers/resctrl/mpam_internal.h:241:30: note: expanded from macro 'IIDR_PROD'
     241 | #define IIDR_PROD(x)    ((x) << MPAMF_IIDR_PRODUCTID_SHIFT)
         |                                 ^
   drivers/resctrl/mpam_devices.c:754:16: error: use of undeclared identifier 'MPAMF_IIDR_VARIANT_SHIFT'
   drivers/resctrl/mpam_internal.h:246:44: note: expanded from macro 'IIDR_MATCH_ONE'
     246 | #define IIDR_MATCH_ONE  (IIDR_PROD(0xfff) | IIDR_VAR(0xf) | IIDR_REV(0xf) | IIDR_IMP(0xfff))
         |                                             ^
   drivers/resctrl/mpam_internal.h:242:29: note: expanded from macro 'IIDR_VAR'
     242 | #define IIDR_VAR(x)     ((x) << MPAMF_IIDR_VARIANT_SHIFT)
         |                                 ^
   drivers/resctrl/mpam_devices.c:754:16: error: use of undeclared identifier 'MPAMF_IIDR_REVISON_SHIFT'
   drivers/resctrl/mpam_internal.h:246:60: note: expanded from macro 'IIDR_MATCH_ONE'
     246 | #define IIDR_MATCH_ONE  (IIDR_PROD(0xfff) | IIDR_VAR(0xf) | IIDR_REV(0xf) | IIDR_IMP(0xfff))
         |                                                             ^
   drivers/resctrl/mpam_internal.h:243:29: note: expanded from macro 'IIDR_REV'
     243 | #define IIDR_REV(x)     ((x) << MPAMF_IIDR_REVISON_SHIFT)
         |                                 ^
   drivers/resctrl/mpam_devices.c:754:16: error: use of undeclared identifier 'MPAMF_IIDR_IMPLEMENTER_SHIFT'
   drivers/resctrl/mpam_internal.h:246:76: note: expanded from macro 'IIDR_MATCH_ONE'
     246 | #define IIDR_MATCH_ONE  (IIDR_PROD(0xfff) | IIDR_VAR(0xf) | IIDR_REV(0xf) | IIDR_IMP(0xfff))
         |                                                                             ^
   drivers/resctrl/mpam_internal.h:244:29: note: expanded from macro 'IIDR_IMP'
     244 | #define IIDR_IMP(x)     ((x) << MPAMF_IIDR_IMPLEMENTER_SHIFT)
         |                                 ^
   8 errors generated.


vim +/MPAMF_IIDR_PRODUCTID_SHIFT +753 drivers/resctrl/mpam_devices.c

   748	
   749	static const struct mpam_quirk mpam_quirks[] = {
   750		{
   751		/* NVIDIA t241 erratum T241-MPAM-1 */
   752		.init       = mpam_enable_quirk_nvidia_t241,
 > 753		.iidr       = IIDR_PROD(0x241) | IIDR_VAR(0) | IIDR_REV(0) | IIDR_IMP(0x36b),
   754		.iidr_mask  = IIDR_MATCH_ONE,
   755		.workaround = T241_SCRUB_SHADOW_REGS,
   756		},
   757		{ NULL }, /* Sentinel */
   758	};
   759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
