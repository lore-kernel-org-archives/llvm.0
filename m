Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597014;
	b=sgMDUG1xglH/N1o/PE2XEr9Mlq+MuZSPEWHQaBaKEjBUyz5D8iNz6iobIBIj4le+TTfz
	 GwJyfOP2XWPQaMNW1DovoqCTMovEp2NMW1iZgjkeeatNqSXfmHl9NnRLfCnZjCxqwQUO0
	 R9CruW48cvob3ydM6Fbl05INl8oXML4icRvZaFtjbacBnWyQpv5v9SUyp1A7dg2BsGSlK
	 zExXfEj41ik0bvgkyhl9o3OoBo/NFllO3yS352xLhRruMcsKzSd9s/aJZyJPrQHsJP1yi
	 Wwd7IquDJtZD3i8AzAA623p9WgC88hyU1dptxlnif+flCL1I/FcDN4pej+RSdumNCXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597014;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zeSc0Kmi4ulP+o8LuWHeCs5C4EMGcAlzHD8FkG+e35Q=;
	b=tfMc3gzsiMcgVAti0EslhA7BkIrS5D08Mda0x3fFthVkDbQ/LSupCDq3Vr15A8pVZhTP
	 7nq7GiqZwTq0BevzgcTuBbShe/CzVnhLe+z5sptdA8DQVVq3JpwgCY+mRL7srWCK32+LS
	 yslcaHL5CzSGpgQtEBZLZrXzRLtEuGIqMXYVd3/7pegXhJzwPfnNd9c4bFUJ/L7bLfSjo
	 2G3jpwkkWxMnRRRhp5HN/Y+u+ljl+zzjjDPTVoM1oT5ZfO+TmfRsi5c/djPgKz84UeTNS
	 VF5TeMhgGX00XGAAsUL0bVdMgCE+0CWcGU9DvfmOvygCHstA2mpvaHO14kS2LEbsEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZ5XgBQn;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1625606F314;
	Fri, 13 Nov 2026 19:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1625606F314
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZ5XgBQn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794597014; x=1826133014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AHpBbQRSEabbHUaavN2fFxopt7Q6u6OmKX3uFoHEXWU=;
  b=BZ5XgBQnDglIyhdHBFeX47CGh6Dp9AAo5S63a3cqyvd4abaRQYc72qRY
   hcL5dmCQBpfbcXifC3kOlHc9gjrRj1UdYeQiS7ZcnbHKGMjNTyM208jeD
   J7mnO4qFtqJ8Zc58oAFSKBD0j5k9qPHByRzjnJoCxHexaZ2M9nKZiAXXB
   mupKSGAK5nORzvIECLBFGSMHAv/wpreTA5zaNy4DgJHD4p1zWr+B9rNP1
   nJYaNiz1VUt2vi2kaMyws14Ea7V7gKXAPC2hibSq8Fg9AxcKeQL1ICUUA
   PoreLyhCBUiUHGi0E32Rr8VcNQjn964AxC8xZiijmmU40UfXqhnnXH1wv
   w==;
X-CSE-ConnectionGUID: ZKgyzML+S2GcVT8wYgEFHQ==
X-CSE-MsgGUID: YxXyK0xZQyq6C9r9eRwhKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3444569"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3444569"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:10:13 -0800
X-CSE-ConnectionGUID: Ma3FVthRQ1GYT2wYe5gHOQ==
X-CSE-MsgGUID: iCDfZ9/nQJWs5TGzoEiIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9158508"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2026 11:10:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRwf1-000000013kL-3pZr;
	Fri, 13 Nov 2026 19:10:07 +0000
Date: Sat, 14 Nov 2026 03:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SiByte: Fix missing function prototypes
Message-ID: <202611140242.xhMf9lU3-lkp@intel.com>
References: <20261112195824.298915-1-f.fainelli@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112195824.298915-1-f.fainelli@gmail.com>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc2 next-20261112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/MIPS-SiByte-Fix-missing-function-prototypes/20261112-115739
base:   linus/master
patch link:    https://lore.kernel.org/r/20261112195824.298915-1-f.fainelli%40gmail.com
patch subject: [PATCH] MIPS: SiByte: Fix missing function prototypes
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20261114/202611140242.xhMf9lU3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140242.xhMf9lU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140242.xhMf9lU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/mm/tlbex.c:40:
   In file included from arch/mips/include/asm/sibyte/sb1250.h:28:
>> arch/mips/include/asm/sibyte/bcm1480_scd.h:261:9: warning: 'M_SPC_CFG_CLEAR' macro redefined [-Wmacro-redefined]
     261 | #define M_SPC_CFG_CLEAR                 M_BCM1480_SPC_CFG_CLEAR
         |         ^
   arch/mips/include/asm/sibyte/sb1250_scd.h:392:9: note: previous definition is here
     392 | #define M_SPC_CFG_CLEAR         _SB_MAKEMASK1(32)
         |         ^
   In file included from arch/mips/mm/tlbex.c:40:
   In file included from arch/mips/include/asm/sibyte/sb1250.h:28:
>> arch/mips/include/asm/sibyte/bcm1480_scd.h:262:9: warning: 'M_SPC_CFG_ENABLE' macro redefined [-Wmacro-redefined]
     262 | #define M_SPC_CFG_ENABLE                M_BCM1480_SPC_CFG_ENABLE
         |         ^
   arch/mips/include/asm/sibyte/sb1250_scd.h:393:9: note: previous definition is here
     393 | #define M_SPC_CFG_ENABLE        _SB_MAKEMASK1(33)
         |         ^
   2 warnings generated.


vim +/M_SPC_CFG_CLEAR +261 arch/mips/include/asm/sibyte/bcm1480_scd.h

4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  252  
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  253  /*
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  254   * System Performance Counter Control Register (Table 32)
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  255   * Register: PERF_CNT_CFG_1
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  256   * BCM1480 specific
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  257   */
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  258  #define M_BCM1480_SPC_CFG_CLEAR	    _SB_MAKEMASK1(0)
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  259  #define M_BCM1480_SPC_CFG_ENABLE    _SB_MAKEMASK1(1)
8deab1144b5535 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28  260  #if SIBYTE_HDR_FEATURE_CHIP(1480)
8deab1144b5535 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28 @261  #define M_SPC_CFG_CLEAR			M_BCM1480_SPC_CFG_CLEAR
8deab1144b5535 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28 @262  #define M_SPC_CFG_ENABLE		M_BCM1480_SPC_CFG_ENABLE
8deab1144b5535 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28  263  #endif
4cbf2beac2265b include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  264  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
