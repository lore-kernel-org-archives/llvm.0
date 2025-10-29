Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AF4325710;
	Wed, 29 Oct 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749217; cv=none; b=n2Ai/+3MEhOGyrlepqAZdxr1evHzSKSxxHKlLTNNTG13ieBpyMz7rLDIRQEDezbmQaRZp+XJj0IR4Jfxyq0Yj8SGi5jr15wGEPTvLq9K0pJ+T8d6Byt81QQKj+scnh33nTOmGjZ3jYW2O8LFIdjaimswOVYgFzV8kvAPeOVqVM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749217; c=relaxed/simple;
	bh=shTdQEWX932pn6cq666N7kKel0XDo8U/9IsSHC/5qEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHenSYg6ohHHa7HcMdYYxCvSOJqPTDCyu95G6YLeXxRNAF3guNlMKBYb3JwMDMDLm2smUsU4SeKjW8KV04bx0LvokavunGU0u2AZtwlw02tVjeuFG2E6wEqx74p3BJzRnaVCaFbb3MZCR4QDKNdL7v0n/IqZrVbnYs8ZdIPqTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/EHc9MK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/EHc9MK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761749216; x=1793285216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=shTdQEWX932pn6cq666N7kKel0XDo8U/9IsSHC/5qEc=;
  b=S/EHc9MKJf1lDVKBHEo4P0ey9Avg8pjZfsRyuwUldpTYOX6+ulQVV4pV
   WsH80QPZVEuJQdZWkBJY0EwPYVPItDHLVHqY9ceceEPGFbPReYQu2hUWN
   Z8332/qjlUqRMyvH2Q2VBCWKQzhRSTpgZKOLxRc1+SxvjXHqFxx82DMy6
   1HLcVyda83ZPnS8dEZPdjJXeQaNHi0JaQHDmHdkIYsdPyFbyelLa7RdJe
   E/5vb8CXeNGN6MsXxiV0LzGzaECzNrozdLz0syxCFj/MqDDis/kZ46WzC
   chBjBvSLkMOgqmaYCZ1hQm+jCLdmR5QoyD7lfchwWwKjgE6lHYIydrC/W
   w==;
X-CSE-ConnectionGUID: CSHbs5mESYqmI4z9fvnIcA==
X-CSE-MsgGUID: P9IERi7HSy+bHH0+tvdsSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63968330"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63968330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 07:46:55 -0700
X-CSE-ConnectionGUID: 6Dq8LGgmR/O25ilE/xbe4A==
X-CSE-MsgGUID: n46ZIbahQqGkA8gNd0CxQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="189750531"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 07:46:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7R9-000Khf-0x;
	Wed, 29 Oct 2025 14:46:12 +0000
Date: Wed, 29 Oct 2025 22:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot/v6.18-rc1 78/87]
 drivers/resctrl/mpam_devices.c:753:16: error: use of undeclared identifier
 'MPAMF_IIDR_PRODUCTID_SHIFT'
Message-ID: <202510292227.V1q9g5HE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1
head:   06bc552a3b617fd4d75560d1921dd6fb91893293
commit: af3e6b6ccfc6be7c16b25675c424a5a98e6fee98 [78/87] arm_mpam: Add workaround for T241-MPAM-1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251029/202510292227.V1q9g5HE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292227.V1q9g5HE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292227.V1q9g5HE-lkp@intel.com/

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
