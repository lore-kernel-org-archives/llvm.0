Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5749440C;
	Sun, 22 Jun 2025 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750578503; cv=none; b=cWobUBQFNj494T85B28as5gKXSnNlPdt9qq7z5NgOwkOXXsxhcCitwp2H46BtVHmcl06P5UCAgEoigN40Xw4YWMh0q53en5DYhfcRO0TXatfn716RstvobvGK3PV2w+n7TiKUwtzB/DAv7q5AISoHMI1ADihxE3UQyDgRvrX9iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750578503; c=relaxed/simple;
	bh=fcqWB6QlRZRsIO7I4LIzwbujsq7AmCozgWUCQfpBdac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4Vv/xMeFQ8iD8FzHwqZ9wETWSMBkTYlGnZsq4GmXqK3t+Cy9OQyVrk8Rt/Kft4Eh8vx1X8/Hr3kwSbDJk3BabUlxWIWIvfJOWoXU7uSeuX5YK5khiV1E2Z9aACoLRMu/IwwTffjBqlOdq716mhQ7zLhtujRto0GHTJXt1/5bkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVSf4qND; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVSf4qND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750578501; x=1782114501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcqWB6QlRZRsIO7I4LIzwbujsq7AmCozgWUCQfpBdac=;
  b=ZVSf4qNDQHGAV3ZCkG4f1xOqyLz0Vc6dtBz562hkegXeHj1z78N6BfnQ
   lFK3BHSChGZA1pbSJdQMCMjLOlCls9w7h93Q8SuaXtXx8p7qus7C7UgPc
   YLzG+b1QgVxV9L3YjTYfgOFAm3uFI8x9xKNunZz7M3x/nw/K19T0LEFnK
   x3zgoEZEqxtaePE9XwGyKqMFDqQzWh1hohfWB/bHi7qiiQ2KFkLd3NQty
   vFl0/lxNOuJhrCcApyULbiDI5QvqmK7DBAWRoI5gkvVs16w6fHw1LWvj1
   BYFhfW//JBDN3TA3Yvrk2ygbJb2XgIbWRt9ylX2ovyt3n7i7pEbIs7Qli
   Q==;
X-CSE-ConnectionGUID: OcsjHTkcRFGsysR/jmNPiA==
X-CSE-MsgGUID: EZ4SKHrvRdGbIcRQN+RVyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="70221563"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="70221563"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 00:48:20 -0700
X-CSE-ConnectionGUID: Im94oN3sT/qFeLYg5hZ+Ww==
X-CSE-MsgGUID: MDwURqiiRkqVkqOdkS/rzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="151581210"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jun 2025 00:48:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTFR2-000N8S-2f;
	Sun, 22 Jun 2025 07:48:16 +0000
Date: Sun, 22 Jun 2025 15:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:x86/lass 2/16] arch/x86/include/asm/string.h:40:8: error:
 expected relocatable expression
Message-ID: <202506221557.4DOemEgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git x86/lass
head:   59822d1bcbc8a26ad84fffa7ff4e6840ef526285
commit: e408c89255c56175bcbed7e6b5ea5efd4074251d [2/16] x86/asm: Introduce inline memcpy and memset
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250622/202506221557.4DOemEgy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221557.4DOemEgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221557.4DOemEgy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/device.c:4:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:5:
   In file included from include/linux/string.h:65:
>> arch/x86/include/asm/string.h:40:8: error: expected relocatable expression
      40 |                      ALT_64("rep stosb",
         |                      ^
   arch/x86/include/asm/string.h:15:33: note: expanded from macro 'ALT_64'
      15 | #define ALT_64(orig, alt, feat) ALTERNATIVE(orig, alt, feat)
         |                                 ^
   arch/x86/include/asm/alternative.h:217:2: note: expanded from macro 'ALTERNATIVE'
     217 |         ALTINSTR_ENTRY(ft_flags)                                        \
         |         ^
   arch/x86/include/asm/alternative.h:203:3: note: expanded from macro 'ALTINSTR_ENTRY'
     203 |         " .4byte " __stringify(ft_flags) "\n"           /* feature + flags */ \
         |          ^
   <inline asm>:12:9: note: instantiated into assembly here
      12 |  .4byte (((1 << 0) << 16) | (X86_FEATURE_FSRM))
         |         ^
   1 error generated.


vim +40 arch/x86/include/asm/string.h

    34	
    35	static __always_inline void *__inline_memset(void *addr, int v, size_t len)
    36	{
    37		void *ret = addr;
    38	
    39		asm volatile("1:\n\t"
  > 40			     ALT_64("rep stosb",
    41				    "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRM))
    42			     "2:\n\t"
    43			     _ASM_EXTABLE_UA(1b, 2b)
    44			     : "+c" (len), "+D" (addr), ASM_CALL_CONSTRAINT
    45			     : "a" ((uint8_t)v)
    46			     : "memory", _ASM_SI);
    47	
    48		return ret + len;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
