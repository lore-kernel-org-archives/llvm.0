Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252507C;
	Thu, 27 Jul 2023 02:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690424694; x=1721960694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C264Jlx7omC2IGbVFzDmPqjvhYuKy5hrLHi7x8Hv+9c=;
  b=jIQ26MD3O+rwkmvclTCIXedQNwvWi09a5BVamgriUNnWlva2DADt14dR
   s+sFa3W1JVKoyD/hp67D+/t17dRCo/4Xsl8mv/JHgtpPTLBZKWPI06w8N
   OqkKOl58GC2peqHIQuqGm5f8cziAxdL5rPiyyRuM5Ls4WCUllT5wWTGU2
   5dTNXJtxRQ3IHGHoZFfr+RiIKs+/XVcz3yFGyRsIuzRb8LbvMpwIflCdX
   k2maWuFjmKaDisVjE6hAxUF8piQB2LxVn8RkdkUM7Oa4nr/C3BwfcRStw
   f8StQOZkZusckDlKZorxlr5G62zT3sy3e5zzsQ60s2VuGgzbNKlcvo3pe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371794983"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="371794983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 19:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850685813"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="850685813"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 19:24:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOqgJ-0001aK-1P;
	Thu, 27 Jul 2023 02:24:47 +0000
Date: Thu, 27 Jul 2023 10:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>, olivia@selenic.com,
	herbert@gondor.apana.org.au, jiajie.ho@starfivetech.com,
	conor.dooley@microchip.com, martin@kaiser.cx, mmyangfl@gmail.com,
	jenny.zhang@starfivetech.com, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, leoliu@zhaoxin.com,
	CobeChen@zhaoxin.com, YunShen@zhaoxin.com, TonyWWang@zhaoxin.com,
	leoliu-oc <leoliu-oc@zhaoxin.com>
Subject: Re: [PATCH] hwrng: add Zhaoxin HW RNG driver
Message-ID: <202307271008.RbzxDGux-lkp@intel.com>
References: <20230726113553.1965627-1-LeoLiu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726113553.1965627-1-LeoLiu-oc@zhaoxin.com>

Hi LeoLiu-oc,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LeoLiu-oc/hwrng-add-Zhaoxin-HW-RNG-driver/20230726-193710
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230726113553.1965627-1-LeoLiu-oc%40zhaoxin.com
patch subject: [PATCH] hwrng: add Zhaoxin HW RNG driver
config: i386-randconfig-i014-20230726 (https://download.01.org/0day-ci/archive/20230727/202307271008.RbzxDGux-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271008.RbzxDGux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271008.RbzxDGux-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.c:58:2: error: register %rcx is only available in 64-bit mode
           "movq %0, %%rcx\n"
           ^
   <inline asm>:1:13: note: instantiated into assembly here
           movq %eax, %rcx
                      ^~~~
>> drivers/char/hw_random/zhaoxin-rng.c:59:3: error: register %rdx is only available in 64-bit mode
           "movq %1, %%rdx\n"
            ^
   <inline asm>:2:12: note: instantiated into assembly here
   movq %ecx, %rdx
              ^~~~
>> drivers/char/hw_random/zhaoxin-rng.c:60:3: error: register %rdi is only available in 64-bit mode
           "movq %2, %%rdi\n"
            ^
   <inline asm>:3:12: note: instantiated into assembly here
   movq %edx, %rdi
              ^~~~
   3 errors generated.


vim +58 drivers/char/hw_random/zhaoxin-rng.c

    54	
    55	static inline int rep_xstore(size_t size, size_t factor, void *result)
    56	{
    57		__asm__ __volatile__ (
  > 58		"movq %0, %%rcx\n"
  > 59		"movq %1, %%rdx\n"
  > 60		"movq %2, %%rdi\n"
    61		".byte 0xf3, 0x0f, 0xa7, 0xc0"
    62		:
    63		: "r"(size), "r"(factor), "r"(result)
    64		: "%rcx", "%rdx", "%rdi", "memory");
    65	
    66		return 0;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
