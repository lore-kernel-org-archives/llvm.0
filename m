Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5711FB2;
	Sun, 17 Dec 2023 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvDSZegZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702805512; x=1734341512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CmUDMEII9/rkK/xBUgKb9ssodth2FynBayIxqHFPPs=;
  b=YvDSZegZljjH/uafYU+tMGr1ez3idup5VJYIcAusNStdXrAiBCR3PvZ9
   iBQkewzbn6RT1WYgqxI8nPMRnaA5g/PUeBU2UOcHoh7hP91DyXYjfcP9l
   pBpC596V8kREUYzUyQa+9Xxduh7MU/BKnEpoiVq98dDLZp5OyRzfmHZQf
   T8OViUijNZM+jY25tlZmRxlKnI9h6Ngmtoft7LZCVyDbieUNThvEJlOrF
   hCcmOIGEC4RYj9Rbntu9Dt1IRcep/bUyjpSpQjeGAZoBDNk4lb/Q5TEvO
   a1RGRBqzTpnTA4W2LffxJmBx2vRrkrjKvAP3TQFU2rt5nY4txYwjiIMJp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395145064"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="395145064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 01:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="23375128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2023 01:31:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEnUw-0002tj-1A;
	Sun, 17 Dec 2023 09:31:46 +0000
Date: Sun, 17 Dec 2023 17:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 3/50]
 arch/x86/include/asm/paravirt.h:792:47: warning: declaration of 'struct
 mm_struct' will not be visible outside of this function
Message-ID: <202312171728.fspqyQQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 33d882857eb5393e3acbc770e469d9044aaa0b35 [3/50] x86/lib/cache-smp.c: fix missing include
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171728.fspqyQQR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171728.fspqyQQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171728.fspqyQQR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/lib/cache-smp.c:2:
   In file included from arch/x86/include/asm/paravirt.h:7:
   arch/x86/include/asm/paravirt_types.h:8:2: error: unknown type name 'u8'
           u8 *instr;              /* original instructions */
           ^
   arch/x86/include/asm/paravirt_types.h:9:2: error: unknown type name 'u8'
           u8 type;                /* type of this instruction */
           ^
   arch/x86/include/asm/paravirt_types.h:10:2: error: unknown type name 'u8'
           u8 len;                 /* length of original instruction */
           ^
   In file included from arch/x86/lib/cache-smp.c:2:
>> arch/x86/include/asm/paravirt.h:792:47: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
   static inline void paravirt_enter_mmap(struct mm_struct *mm)
                                                 ^
   arch/x86/include/asm/paravirt.h:798:51: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
   static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
                                                     ^
   2 warnings and 3 errors generated.


vim +792 arch/x86/include/asm/paravirt.h

fdc0269e8958a1 Juergen Gross 2018-08-28  789  
a1ea1c032b8f8c Dave Hansen   2014-11-18  790  #ifndef __ASSEMBLY__
fdc0269e8958a1 Juergen Gross 2018-08-28  791  #ifndef CONFIG_PARAVIRT_XXL
c9ae1b10d95610 Juergen Gross 2023-02-07 @792  static inline void paravirt_enter_mmap(struct mm_struct *mm)
a1ea1c032b8f8c Dave Hansen   2014-11-18  793  {
a1ea1c032b8f8c Dave Hansen   2014-11-18  794  }
fdc0269e8958a1 Juergen Gross 2018-08-28  795  #endif
a1ea1c032b8f8c Dave Hansen   2014-11-18  796  

:::::: The code at line 792 was first introduced by commit
:::::: c9ae1b10d9561012a222e05f0d3ab4e93d301f06 x86/paravirt: Merge activate_mm() and dup_mmap() callbacks

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
