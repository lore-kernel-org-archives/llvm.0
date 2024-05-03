Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA059B4E;
	Fri,  3 May 2024 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714774386; cv=none; b=Agu66MkWegDpRFdzeCKF6CCmsY+GFYAv1epYOoPrbuZK9nHKQzUVDyzgV2Io+vucOexuWas+UfnJjy+kChfr21DK+CulRcrSwoNTXqrrHJTh53CVkA/0XpVoUF0L1NcBaNfBOZ52dIu50w/2PIXBhU3844dRS+cjojjrWCZ/NnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714774386; c=relaxed/simple;
	bh=Gc7s6Q9EEuX80fywX7p5WZm4BykKe7JvAmnS2kYRvQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFzF1qKO8IzeK25smC5eOKbDwO91NP+Efk0doUoPIBVOpiXhL98TSyKMS6Hrt7G9KifUo57B1/1V4crStnwMIaBacrzQAvlppiBw+FO8Jj7PviEQAAw8Q46G9HJI2d32eXyAPYCHxWXY7/fVZjXpRXDkESSdfoFrUaU2v4NX274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIxJQKuH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIxJQKuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714774384; x=1746310384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gc7s6Q9EEuX80fywX7p5WZm4BykKe7JvAmnS2kYRvQo=;
  b=BIxJQKuHn8fJhtrOBP/wLxsI9F7QYUSQPLzeuKQu1apIHZiKNXWFn4gs
   lezlV6ezIeiZr5Z7w81X0YRwvugV7E3lko2u3DWYZRv5j5bGAri3EqBIH
   FvvlhajVdslAxcXkqjkyksgYvTXEvZ6F2sUXs+8MhiWV5AXXwmKNRbyxw
   ViHX/iP0J0VhsoG/FlZaC809R+sYRZkzaAOzlluoQ4ZMb2O2sYP/qwaGA
   ekJo0DeTiiQT5E4tKl2pKYJIx/BINe1MOIVLk95ti8t17vnHCFIF3CGhz
   vlgZXiV8Kdbe6QCnpHJxaT4qMvUA9+MoJ8RPCQitcnOZhdtGJxh5jpP4G
   w==;
X-CSE-ConnectionGUID: 0xmbXMk9S8e0ATW2Zg5UtA==
X-CSE-MsgGUID: oe0vLvt0Rj2s7pE6xEUAlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10478107"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10478107"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 15:13:02 -0700
X-CSE-ConnectionGUID: go9CxhAxQhGbbaveqzdP4Q==
X-CSE-MsgGUID: HFdObqM3RFOb/uR2gyoJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="50769427"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2024 15:13:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s319G-000C8u-1B;
	Fri, 03 May 2024 22:12:58 +0000
Date: Sat, 4 May 2024 06:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:wip/v6.9-rc2/unsigned-overflow-sanitizer 30/109]
 lib/percpu_test.c:118:7: error: use of undeclared identifier 'wrapping_sub'
Message-ID: <202405040609.gBCLgoz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git wip/v6.9-rc2/unsigned-overflow-sanitizer
head:   4eae48ae0df1d1feb751f794fa8495093e36168d
commit: 42a77f20b876489304c8e46c2b30ccb154d876bf [30/109] include/linux/percpu-defs.h: negated variable: use wrapping_sub()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240504/202405040609.gBCLgoz0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040609.gBCLgoz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040609.gBCLgoz0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/percpu_test.c:2:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   lib/percpu_test.c:118:7: error: too few arguments provided to function-like macro invocation
     118 |         ul = this_cpu_sub_return(ulong_counter, ui_one);
         |              ^
   include/linux/percpu-defs.h:503:110: note: expanded from macro 'this_cpu_sub_return'
     503 | #define this_cpu_sub_return(pcp, val)   this_cpu_add_return(pcp, wrapping_sub(typeof(pcp), 0 (typeof(pcp))(val)))
         |                                                                                                                ^
   include/linux/overflow.h:125:9: note: macro 'wrapping_sub' defined here
     125 | #define wrapping_sub(type, a, b)                                \
         |         ^
>> lib/percpu_test.c:118:7: error: use of undeclared identifier 'wrapping_sub'
     118 |         ul = this_cpu_sub_return(ulong_counter, ui_one);
         |              ^
   include/linux/percpu-defs.h:503:64: note: expanded from macro 'this_cpu_sub_return'
     503 | #define this_cpu_sub_return(pcp, val)   this_cpu_add_return(pcp, wrapping_sub(typeof(pcp), 0 (typeof(pcp))(val)))
         |                                                                  ^
>> lib/percpu_test.c:118:7: error: use of undeclared identifier 'wrapping_sub'
   include/linux/percpu-defs.h:503:64: note: expanded from macro 'this_cpu_sub_return'
     503 | #define this_cpu_sub_return(pcp, val)   this_cpu_add_return(pcp, wrapping_sub(typeof(pcp), 0 (typeof(pcp))(val)))
         |                                                                  ^
>> lib/percpu_test.c:118:7: error: use of undeclared identifier 'wrapping_sub'
   include/linux/percpu-defs.h:503:64: note: expanded from macro 'this_cpu_sub_return'
     503 | #define this_cpu_sub_return(pcp, val)   this_cpu_add_return(pcp, wrapping_sub(typeof(pcp), 0 (typeof(pcp))(val)))
         |                                                                  ^
>> lib/percpu_test.c:118:7: error: use of undeclared identifier 'wrapping_sub'
   include/linux/percpu-defs.h:503:64: note: expanded from macro 'this_cpu_sub_return'
     503 | #define this_cpu_sub_return(pcp, val)   this_cpu_add_return(pcp, wrapping_sub(typeof(pcp), 0 (typeof(pcp))(val)))
         |                                                                  ^
   5 warnings and 5 errors generated.


vim +/wrapping_sub +118 lib/percpu_test.c

623fd8072c7c4d Greg Thelen 2013-11-12   19  
623fd8072c7c4d Greg Thelen 2013-11-12   20  static int __init percpu_test_init(void)
623fd8072c7c4d Greg Thelen 2013-11-12   21  {
623fd8072c7c4d Greg Thelen 2013-11-12   22  	/*
623fd8072c7c4d Greg Thelen 2013-11-12   23  	 * volatile prevents compiler from optimizing it uses, otherwise the
623fd8072c7c4d Greg Thelen 2013-11-12   24  	 * +ul_one/-ul_one below would replace with inc/dec instructions.
623fd8072c7c4d Greg Thelen 2013-11-12   25  	 */
623fd8072c7c4d Greg Thelen 2013-11-12   26  	volatile unsigned int ui_one = 1;
623fd8072c7c4d Greg Thelen 2013-11-12   27  	long l = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   28  	unsigned long ul = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   29  
623fd8072c7c4d Greg Thelen 2013-11-12   30  	pr_info("percpu test start\n");
623fd8072c7c4d Greg Thelen 2013-11-12   31  
623fd8072c7c4d Greg Thelen 2013-11-12   32  	preempt_disable();
623fd8072c7c4d Greg Thelen 2013-11-12   33  
623fd8072c7c4d Greg Thelen 2013-11-12   34  	l += -1;
623fd8072c7c4d Greg Thelen 2013-11-12   35  	__this_cpu_add(long_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   36  	CHECK(l, long_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   37  
623fd8072c7c4d Greg Thelen 2013-11-12   38  	l += 1;
623fd8072c7c4d Greg Thelen 2013-11-12   39  	__this_cpu_add(long_counter, 1);
623fd8072c7c4d Greg Thelen 2013-11-12   40  	CHECK(l, long_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   41  
623fd8072c7c4d Greg Thelen 2013-11-12   42  	ul = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   43  	__this_cpu_write(ulong_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   44  
623fd8072c7c4d Greg Thelen 2013-11-12   45  	ul += 1UL;
623fd8072c7c4d Greg Thelen 2013-11-12   46  	__this_cpu_add(ulong_counter, 1UL);
623fd8072c7c4d Greg Thelen 2013-11-12   47  	CHECK(ul, ulong_counter, 1);
623fd8072c7c4d Greg Thelen 2013-11-12   48  
12a842683d4d60 Kees Cook   2024-01-27   49  	ul += ULONG_MAX;
12a842683d4d60 Kees Cook   2024-01-27   50  	__this_cpu_add(ulong_counter, ULONG_MAX);
623fd8072c7c4d Greg Thelen 2013-11-12   51  	CHECK(ul, ulong_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   52  
623fd8072c7c4d Greg Thelen 2013-11-12   53  	ul += -(unsigned long)1;
623fd8072c7c4d Greg Thelen 2013-11-12   54  	__this_cpu_add(ulong_counter, -(unsigned long)1);
623fd8072c7c4d Greg Thelen 2013-11-12   55  	CHECK(ul, ulong_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   56  
623fd8072c7c4d Greg Thelen 2013-11-12   57  	ul = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   58  	__this_cpu_write(ulong_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   59  
623fd8072c7c4d Greg Thelen 2013-11-12   60  	ul -= 1;
623fd8072c7c4d Greg Thelen 2013-11-12   61  	__this_cpu_dec(ulong_counter);
623fd8072c7c4d Greg Thelen 2013-11-12   62  	CHECK(ul, ulong_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   63  	CHECK(ul, ulong_counter, ULONG_MAX);
623fd8072c7c4d Greg Thelen 2013-11-12   64  
623fd8072c7c4d Greg Thelen 2013-11-12   65  	l += -ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   66  	__this_cpu_add(long_counter, -ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   67  	CHECK(l, long_counter, 0xffffffff);
623fd8072c7c4d Greg Thelen 2013-11-12   68  
623fd8072c7c4d Greg Thelen 2013-11-12   69  	l += ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   70  	__this_cpu_add(long_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   71  	CHECK(l, long_counter, (long)0x100000000LL);
623fd8072c7c4d Greg Thelen 2013-11-12   72  
623fd8072c7c4d Greg Thelen 2013-11-12   73  
623fd8072c7c4d Greg Thelen 2013-11-12   74  	l = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   75  	__this_cpu_write(long_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   76  
623fd8072c7c4d Greg Thelen 2013-11-12   77  	l -= ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   78  	__this_cpu_sub(long_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   79  	CHECK(l, long_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   80  
623fd8072c7c4d Greg Thelen 2013-11-12   81  	l = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   82  	__this_cpu_write(long_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   83  
623fd8072c7c4d Greg Thelen 2013-11-12   84  	l += ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   85  	__this_cpu_add(long_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   86  	CHECK(l, long_counter, 1);
623fd8072c7c4d Greg Thelen 2013-11-12   87  
623fd8072c7c4d Greg Thelen 2013-11-12   88  	l += -ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   89  	__this_cpu_add(long_counter, -ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   90  	CHECK(l, long_counter, (long)0x100000000LL);
623fd8072c7c4d Greg Thelen 2013-11-12   91  
623fd8072c7c4d Greg Thelen 2013-11-12   92  	l = 0;
623fd8072c7c4d Greg Thelen 2013-11-12   93  	__this_cpu_write(long_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12   94  
623fd8072c7c4d Greg Thelen 2013-11-12   95  	l -= ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12   96  	this_cpu_sub(long_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12   97  	CHECK(l, long_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12   98  	CHECK(l, long_counter, ULONG_MAX);
623fd8072c7c4d Greg Thelen 2013-11-12   99  
623fd8072c7c4d Greg Thelen 2013-11-12  100  	ul = 0;
623fd8072c7c4d Greg Thelen 2013-11-12  101  	__this_cpu_write(ulong_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12  102  
623fd8072c7c4d Greg Thelen 2013-11-12  103  	ul += ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12  104  	__this_cpu_add(ulong_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12  105  	CHECK(ul, ulong_counter, 1);
623fd8072c7c4d Greg Thelen 2013-11-12  106  
623fd8072c7c4d Greg Thelen 2013-11-12  107  	ul = 0;
623fd8072c7c4d Greg Thelen 2013-11-12  108  	__this_cpu_write(ulong_counter, 0);
623fd8072c7c4d Greg Thelen 2013-11-12  109  
623fd8072c7c4d Greg Thelen 2013-11-12  110  	ul -= ui_one;
623fd8072c7c4d Greg Thelen 2013-11-12  111  	__this_cpu_sub(ulong_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12  112  	CHECK(ul, ulong_counter, -1);
623fd8072c7c4d Greg Thelen 2013-11-12  113  	CHECK(ul, ulong_counter, ULONG_MAX);
623fd8072c7c4d Greg Thelen 2013-11-12  114  
623fd8072c7c4d Greg Thelen 2013-11-12  115  	ul = 3;
623fd8072c7c4d Greg Thelen 2013-11-12  116  	__this_cpu_write(ulong_counter, 3);
623fd8072c7c4d Greg Thelen 2013-11-12  117  
623fd8072c7c4d Greg Thelen 2013-11-12 @118  	ul = this_cpu_sub_return(ulong_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12  119  	CHECK(ul, ulong_counter, 2);
623fd8072c7c4d Greg Thelen 2013-11-12  120  
623fd8072c7c4d Greg Thelen 2013-11-12  121  	ul = __this_cpu_sub_return(ulong_counter, ui_one);
623fd8072c7c4d Greg Thelen 2013-11-12  122  	CHECK(ul, ulong_counter, 1);
623fd8072c7c4d Greg Thelen 2013-11-12  123  
623fd8072c7c4d Greg Thelen 2013-11-12  124  	preempt_enable();
623fd8072c7c4d Greg Thelen 2013-11-12  125  
623fd8072c7c4d Greg Thelen 2013-11-12  126  	pr_info("percpu test done\n");
623fd8072c7c4d Greg Thelen 2013-11-12  127  	return -EAGAIN;  /* Fail will directly unload the module */
623fd8072c7c4d Greg Thelen 2013-11-12  128  }
623fd8072c7c4d Greg Thelen 2013-11-12  129  

:::::: The code at line 118 was first introduced by commit
:::::: 623fd8072c7c4d77a184bc9e35192acf480c18e4 percpu: add test module for various percpu operations

:::::: TO: Greg Thelen <gthelen@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
