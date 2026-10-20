Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483359;
	b=Dncw2ZKocfwfdkqwwHbrv02PgAaq+TR6fxqcxMYix4Vg5fZAji0M0gsMdYtLKgPXAmW2
	 eGEgTW9Ku/zf1VBQlg1daopHnnw0lJ+/6XKmCLnViGDXSU1LvXssJy6hfHrmtOILx0kzH
	 18r2s7r0PZnM4Xmew3Eo/iUADvV6WqzwVI9IDn29Fq1P4dAddt46MXeyfA7+C72uFAHtz
	 dnfIs532QKHxadPJ+aOefHhri3CR0/J5GlMkM/kFthB4JYJXxhsxxj49xcQ4irpkqi5Ng
	 YjKAiij0Y+tSk5EDui9ggFw9IBOXkC6P3BX2IMs80vztCV2H1xmcDcCz19y93F3Jgzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=H1H53f2tBYw7AlXIk6TsP4Y9NvtB9ypzC5m6clgaxO4=;
	b=3sOTREU7LV0klFhKjzChQobL3pxn+J/6kUTms3Zbd43y+BncbxX2CLMJf3WcaDyNsQuq
	 Eltj2loHZ3cbOcA+WjGgtT33Qezj3asIRT0aQYvKa+ECdpavcbVRkeSyi3L2NC+TGXcH2
	 5MmIYVDejJruMkbUfa9eQSGVLPFUldihqR6iaMWKRN6x/wo65urtuNsTuOKnicwynDQim
	 uVbaV8v8S+gmc5AvWXE9TDkEat7SMkdgCv45Qtx0AmocYJe0WJCDN8C6FY4Jq8yazSdII
	 T2YysrJkcB/bKshRWjgHkqn+pSuIKHuf6QR0HK72g52WQ1wK1VopXMcj7I79NjFF3LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YGqshRxr;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC2606A31B;
	Tue, 20 Oct 2026 08:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YGqshRxr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792483358; x=1824019358;
  h=date:from:to:cc:subject:message-id;
  bh=zQErPCxKGLshMLMVCuDm1Ugzlte1J2gCkM+PaHCLeY8=;
  b=YGqshRxr+SKfbFlHV7rORSh8oQk/98iq9Qz4c30Ftjp39p/n9pNmxfPN
   QPygXBk9v2oUdnWmg1cvmLy7EcjknZnoRPpQpPsuAQzaQKe6TIpAkVMSh
   mOUY5FXPbp1C+FHtmRVjNtWD3FsotfTsdIn/ZF7zYhGQSDMuzpk53jCi/
   Ep87ekjcxdWWNK5tXCRWuZ1XhKLnRzhFx0gCrDx2gEZY6eDHEof/RQVY8
   oTt3kTM1J36w+p51/yvidNR2jTYaywvE5XYvoFeYGqByn2MKGW4EqQvTG
   ysqvjhNN19Kv9/IDJ8gtfEaQ1UqXiIrzPMZj5vXTmVlKUdWwIWfsNDaQY
   w==;
X-CSE-ConnectionGUID: v8jg8WGPTNyZtZ7yQBSaBg==
X-CSE-MsgGUID: JkwnHfe/T22qebbuAq5I2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1195770"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1195770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:02:34 -0700
X-CSE-ConnectionGUID: pIQ2ojDrSXCqCV67pUAfJQ==
X-CSE-MsgGUID: vJbYO43ATl2eAcZ9Y9HGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2758735"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 01:02:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ4nm-000000006B5-3VKS;
	Tue, 20 Oct 2026 08:02:30 +0000
Date: Tue, 20 Oct 2026 10:01:46 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-19 16/24]
 include/linux/thread_info.h:237:20: error: redefinition of
 'arch_kernel_shstk_enabled'
Message-ID: <202610200912.3obIPJfU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-19
head:   b28e7d03a8472efab137c77cbb5dd666fa08e9a7
commit: 967449663fb3eb7dcca67c4652293712530809c8 [16/24] arch-shadow-stacks-enabled
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261020/202610200912.3obIPJfU-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200912.3obIPJfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200912.3obIPJfU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:62:
   arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for function 'arch_kernel_shstk_enabled' [-Wmissing-prototypes]
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   arch/x86/include/asm/thread_info.h:237:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     237 | bool arch_kernel_shstk_enabled(void)
         | ^
         | static 
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:23: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:36: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                    ^
   include/linux/compiler_types.h:257:31: note: expanded from macro '__inline_maybe_unused'
     257 | #define __inline_maybe_unused __maybe_unused
         |                               ^
   include/linux/compiler_attributes.h:352:56: note: expanded from macro '__maybe_unused'
     352 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
   include/linux/thread_info.h:237:8: warning: attribute declaration must precede definition [-Wignored-attributes]
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |        ^
   include/linux/compiler_types.h:235:58: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   arch/x86/include/asm/linkage.h:9:32: note: expanded from macro 'notrace'
       9 | #define notrace __attribute__((no_instrument_function))
         |                                ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/interrupt_rc.h:17:
   In file included from include/linux/smp.h:118:
>> include/linux/thread_info.h:237:20: error: redefinition of 'arch_kernel_shstk_enabled'
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |                    ^
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition is here
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/arch_kernel_shstk_enabled +237 include/linux/thread_info.h

e66101020b3651 Dave Hansen 2026-10-19  235  
5daba193b8cf42 Dave Hansen 2026-10-19  236  #ifndef arch_kernel_shstk_enabled
5daba193b8cf42 Dave Hansen 2026-10-19 @237  static inline bool arch_kernel_shstk_enabled(void)
5daba193b8cf42 Dave Hansen 2026-10-19  238  {
5daba193b8cf42 Dave Hansen 2026-10-19  239  	return false;
5daba193b8cf42 Dave Hansen 2026-10-19  240  }
5daba193b8cf42 Dave Hansen 2026-10-19  241  #endif
5daba193b8cf42 Dave Hansen 2026-10-19  242  

:::::: The code at line 237 was first introduced by commit
:::::: 5daba193b8cf422043348d59ff40fbda09a528d7 kernel/task: Add "runtime" check for shadow stack support

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
