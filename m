Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51539FE5;
	Wed, 11 Sep 2024 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053893; cv=none; b=ZswMda8ZtanyXu150E9ZEY/S7c6qBgf7Hme9rp0yxL+zElXJJZL8YaxiZlLy8t02zrGtmdEE9PhPFKICEUvhLDnDW/PEMTk533DrJhqlZlP+8oVp7ZrVn/ZcAIhO4u4iLipvafifsv+GGPuUpI1nhkoOWOKYrpW9/VU0LRUOVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053893; c=relaxed/simple;
	bh=9UdmEXPRLSqNY+nZbCFO3Mvbt+mNN3AnKLK9XijtSEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qujuYgk96mSeJ0oprloSA2Lvff4Uui9KOQGJnBEt09EZVPI22FS6kiossBui2muuJwS9JaZqJQHn/jwWiYJJXdndTT4SI0233cBIy7g5oxzyb9hK+Ze/GJyevAOqMy+TYjFAOT5y2oAJeDodnKOBN4Kw0yCCD+1l3l5GJe9FoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4itFTeb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4itFTeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726053891; x=1757589891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UdmEXPRLSqNY+nZbCFO3Mvbt+mNN3AnKLK9XijtSEo=;
  b=G4itFTebJPk7WCuvez/vLv9pl+71hxqcon/TxHND/cl9pexh1nHZCI4g
   OV6Z5v9/BYUPyeoXxRl3hc/8OnmgzkdFoLcF7wxy7JkjsXQDf39aibQba
   GhYpNs0RPVIFv81fuLtiiXPFVPNsWsb6bWU/W4Q2P/7Jci2Zsjjx4LVR8
   Yh7PvQ6M8Z0v5J6UgFhswy4ZghQPeO3JfkjKOvYsmLW+0rd5PMWLUShPx
   FTdotIH0ZyeNJUUtUx700kE8e/oBrBvbPw5IaxrJqw2FhFTKOfkwhceev
   AAG04X9Mv8AXzow6/RH1bq29zvISNwsEC0+++SW+oqoUTdXLakSiBNbPT
   Q==;
X-CSE-ConnectionGUID: 7IyX4yt7QM69/PvzRhz0KA==
X-CSE-MsgGUID: aQp/Jn0gSpWTMU6iy/SPmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24721332"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24721332"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:24:50 -0700
X-CSE-ConnectionGUID: f9uEUFFyS0mNd+xuZVP05Q==
X-CSE-MsgGUID: zobXir12QxC2qXjzmtE96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67841999"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2024 04:24:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLSo-0003Sg-1a;
	Wed, 11 Sep 2024 11:24:46 +0000
Date: Wed, 11 Sep 2024 19:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 29/32]
 arch/x86/include/asm/arch_hweight.h:19:7: error: expected ')'
Message-ID: <202409111934.EbkOedyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: 62e666a6052abd6142d52405ea99e83ab7d48a83 [29/32] x86/alternative: Create symbols for special section entries
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240911/202409111934.EbkOedyQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111934.EbkOedyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111934.EbkOedyQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
   In file included from arch/x86/include/asm/bitops.h:428:
>> arch/x86/include/asm/arch_hweight.h:19:7: error: expected ')'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^
   arch/x86/include/asm/alternative.h:192:2: note: expanded from macro 'ALTERNATIVE'
     192 |         ALTINSTR_ENTRY(ft_flags)                                        \
         |         ^
   arch/x86/include/asm/alternative.h:173:2: note: expanded from macro 'ALTINSTR_ENTRY'
     173 |         FAKE_SYMBOL(__alt_entry_, 776f)                                       \
         |         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1194: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +19 arch/x86/include/asm/arch_hweight.h

d61931d89be506 Borislav Petkov 2010-03-05  14  
d14edb1648221e Denys Vlasenko  2015-08-04  15  static __always_inline unsigned int __arch_hweight32(unsigned int w)
d61931d89be506 Borislav Petkov 2010-03-05  16  {
f5967101e9de12 Borislav Petkov 2016-05-30  17  	unsigned int res;
d61931d89be506 Borislav Petkov 2010-03-05  18  
566b62a3676cae Uros Bizjak     2018-10-14 @19  	asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
d61931d89be506 Borislav Petkov 2010-03-05  20  			 : "="REG_OUT (res)
d61931d89be506 Borislav Petkov 2010-03-05  21  			 : REG_IN (w));
d61931d89be506 Borislav Petkov 2010-03-05  22  
d61931d89be506 Borislav Petkov 2010-03-05  23  	return res;
d61931d89be506 Borislav Petkov 2010-03-05  24  }
d61931d89be506 Borislav Petkov 2010-03-05  25  

:::::: The code at line 19 was first introduced by commit
:::::: 566b62a3676caed1f8c626e26066ff3ae3a38918 x86: Use POPCNT mnemonics in arch_hweight.h

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
