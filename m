Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A017AB3;
	Wed,  9 Aug 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580696; x=1723116696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tGajw1fJMTLBXsZGdDRoWT6yeGVKgs8fkHq5qJoWl4=;
  b=ivrGmJonh1UAB/JsiYFGBRP7rgx00By+JWX75oDTIyYAFB0gs/QuHy/C
   dwJb2oh/9ZCv73EpM2ZYK9GrEGkLZGY5apIRuIZ5kG2ARgVuTJRXs3oXJ
   CYYyInsUKtAzb8NpSMX9E0jeGE/P5NOSmx4qWs6JLxNurspYDiPS2fXnv
   ArWcH1tmeRpM+pNPt7emAomKrC+++vA1gQqzDelGmd8UmYPjVorkfm9T0
   gIs22Yq7lv7RacOFuNh7702qA6h/Y7zGLbx06OHglg0KMjBcFYr7kPS/I
   +1U6wIflOe8yBUw/vNbGKjT1YdEL9wIWtVBpGHafSu7a0y7NwPojN/yWB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437462589"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="437462589"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978349348"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="978349348"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 04:31:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThPX-00064e-19;
	Wed, 09 Aug 2023 11:31:31 +0000
Date: Wed, 9 Aug 2023 19:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 23/29] kernel/printk/printk_safe.c:46:26: error:
 invalid output constraint '=a' in asm
Message-ID: <202308091935.Eximz2pA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: 541d489f20d057b7f1b262baf28fe2fc3ed39072 [23/29] cpuid workaround
config: arm-randconfig-r005-20230809 (https://download.01.org/0day-ci/archive/20230809/202308091935.Eximz2pA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091935.Eximz2pA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091935.Eximz2pA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/printk/printk_safe.c:46:26: error: invalid output constraint '=a' in asm
      46 |         asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
         |                                 ^
   kernel/printk/printk_safe.c:57:8: error: invalid input constraint 'c' in asm
      57 |                                 :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                    ^
   kernel/printk/printk_safe.c:59:27: error: invalid input constraint 'c' in asm
      59 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
         |                                  ^
   kernel/printk/printk_safe.c:69:17: warning: unused variable 'args' [-Wunused-variable]
      69 |         va_list args;
         |                 ^
   kernel/printk/printk_safe.c:66:5: warning: no previous prototype for function 'ghcb_printf2' [-Wmissing-prototypes]
      66 | int ghcb_printf2(const char *fmt)
         |     ^
   kernel/printk/printk_safe.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int ghcb_printf2(const char *fmt)
         | ^
         | static 
   kernel/printk/printk_safe.c:96:26: error: invalid output constraint '=a' in asm
      96 |         asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
         |                                 ^
   kernel/printk/printk_safe.c:107:8: error: invalid input constraint 'c' in asm
     107 |                                 :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                    ^
   kernel/printk/printk_safe.c:109:27: error: invalid input constraint 'c' in asm
     109 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
         |                                  ^
   kernel/printk/printk_safe.c:82:5: warning: no previous prototype for function 'hv_sev_printf' [-Wmissing-prototypes]
      82 | int hv_sev_printf(const char *fmt, va_list ap)
         |     ^
   kernel/printk/printk_safe.c:82:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      82 | int hv_sev_printf(const char *fmt, va_list ap)
         | ^
         | static 
   kernel/printk/printk_safe.c:120:26: error: invalid output constraint '=a' in asm
     120 |         asm volatile ("rdmsr" : "=a" (low), "=d" (high) : "c" (0xc0010130));
         |                                 ^
   kernel/printk/printk_safe.c:123:12: error: invalid input constraint 'c' in asm
     123 |                       :: "c" (0xc0010130), "a" (val), "d" (0x0));
         |                          ^
   kernel/printk/printk_safe.c:124:27: error: invalid input constraint 'c' in asm
     124 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                  ^
   kernel/printk/printk_safe.c:116:6: warning: no previous prototype for function 'hv_sev_debugbreak' [-Wmissing-prototypes]
     116 | void hv_sev_debugbreak(u32 val)
         |      ^
   kernel/printk/printk_safe.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     116 | void hv_sev_debugbreak(u32 val)
         | ^
         | static 
   4 warnings and 9 errors generated.


vim +46 kernel/printk/printk_safe.c

    30	
    31	static int hv_sev_printf2(const char *fmt)
    32	{
    33		char buf[1024];
    34		int len;
    35		int idx;
    36		int left;
    37		unsigned long flags;
    38		u32 orig_low, orig_high;
    39		u32 low, high;
    40	
    41		//len = vsnprintf(buf, sizeof(buf), fmt, ap);
    42		len = 4;
    43		memcpy(buf, fmt, 0x4);
    44		local_irq_save(flags);
    45		//spin_lock(&printk_lock);
  > 46		asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
    47		for (idx = 0; idx < len; idx += 6) {
    48			left = len - idx;
    49			if (left > 6) left = 6;
    50			low = 0xf03;
    51			high = 0;
    52			memcpy((char *)&low+2, &buf[idx], left == 1 ? 1 : 2);
    53			if (left > 2)
    54				memcpy((char *)&high, &buf[idx+2], left-2);
    55			asm volatile ("wrmsr\n\r"
    56					"rep; vmmcall\n\r"
    57					:: "c" (0xc0010130), "a" (low), "d" (high));
    58		}
    59		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
    60		//spin_unlock(&printk_lock);
    61		local_irq_restore(flags);
    62	
    63		return len;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
