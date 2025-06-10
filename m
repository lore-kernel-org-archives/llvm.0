Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54E27FD75;
	Tue, 10 Jun 2025 07:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542265; cv=none; b=kG0ztuatzGgXDhmyFf1Jcxh76RAzW5V09xuyyV2WR4fvDZUb+Er64xV1KQ6iQiEKDvFoGOpmwDGUzLP1zwUp943Mp35IS8e89E8nategkIVyQZKmuRkXg+dBHN8EHcJ7B9j+qADOPPnxrinWZm3u1aTwPHMduGzrTtkMsV3ffVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542265; c=relaxed/simple;
	bh=BbI52oMutO88pbApZG9kbF8fIp2U6gXYAYi+m7jn6KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itA8/vycjgC15ThTdnym9P4aNDY6ljJqGfgD0F35HeHphtWfVX5AFTJDYD37bhhoA+y626pdHusGiuuMpWitOOgtNDoBWc+0nHzANZe5apFYYfIATbLyog54S4xjoNbhrJJ/+qEREnG2yXj853MwHo4Fgg0MQzHfyjh9EHtOKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrRxLK73; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrRxLK73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749542264; x=1781078264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbI52oMutO88pbApZG9kbF8fIp2U6gXYAYi+m7jn6KQ=;
  b=QrRxLK73cRmYpPFFdpA34aFHPz4nBOHYdecrDUDApOdeA2RNCtgGcTYu
   2j0EvPZBLhAGejHnv5AfBfaM65eFShkDlgzC2sHFCC8Ch0Li1SJuXV1El
   1JZFkhfcTLZE11RrUAKDLoiAW/NkPVyza9PgppfOSOxoKlGzTYqHEpgLj
   dR2pooWXXg8M5S2pUiYIRQRWIKuvTxQyoE/9VnOYtVh8qstAZ08Ylj7e8
   GRfg5JLYtfrLhRmBQ/CJNQcR2uGZ+j8nHOFi8t8wddAXVOPZftuQkb/8s
   z3hyqohiMoOh1FJz/b/So76q7BvMA2eyKcwPGbUftL+ahxiBDMTC7xT2z
   w==;
X-CSE-ConnectionGUID: pjnHYpfYRa2OwcM7D9/zLQ==
X-CSE-MsgGUID: 6OWrce6mTpiH24oreVQZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69082749"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69082749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:57:43 -0700
X-CSE-ConnectionGUID: QiKzrLNSRou/lw0G4vm7og==
X-CSE-MsgGUID: kh+ckpbBT6qS+FHAxMPtsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147693681"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 00:57:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOtrX-0007wq-1n;
	Tue, 10 Jun 2025 07:57:39 +0000
Date: Tue, 10 Jun 2025 15:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 47/62] kernel/crash_core.c:127:1: warning:
 'patchable_function_entry' attribute only applies to functions and
 Objective-C methods
Message-ID: <202506101555.WXtnw1KZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   9936d838805eed652db144cfa0f44ba3ec967dbe
commit: 51efbdb6ccab6be6a55eb7d5c272e2fe2ed67a33 [47/62] objtool: Make STACK_FRAME_NON_STANDARD consistent
config: powerpc-randconfig-003-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101555.WXtnw1KZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101555.WXtnw1KZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101555.WXtnw1KZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/crash_core.c:127:1: warning: 'patchable_function_entry' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
     127 | STACK_FRAME_NON_STANDARD(__crash_kexec);
         | ^
   include/linux/objtool.h:39:30: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      39 | static void __used __noendbr __nopfx notrace                                    \
         |                              ^
   include/linux/compiler_types.h:436:33: note: expanded from macro '__nopfx'
     436 | # define __nopfx __attribute__((patchable_function_entry(0, 0)))
         |                                 ^
>> kernel/crash_core.c:127:1: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/objtool.h:39:38: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      39 | static void __used __noendbr __nopfx notrace                                    \
         |                                      ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
>> kernel/crash_core.c:127:1: warning: '__noinline__' attribute only applies to functions and statements [-Wignored-attributes]
   include/linux/objtool.h:40:6: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      40 |             __noinstr_section(".discard.text.func_stack_frame_non_standard")    \
         |             ^
   include/linux/compiler_types.h:383:2: note: expanded from macro '__noinstr_section'
     383 |         noinline notrace __attribute((__section__(section)))            \
         |         ^
   include/linux/compiler_attributes.h:231:56: note: expanded from macro 'noinline'
     231 | #define   noinline                      __attribute__((__noinline__))
         |                                                        ^
>> kernel/crash_core.c:127:1: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/objtool.h:40:6: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      40 |             __noinstr_section(".discard.text.func_stack_frame_non_standard")    \
         |             ^
   include/linux/compiler_types.h:383:11: note: expanded from macro '__noinstr_section'
     383 |         noinline notrace __attribute((__section__(section)))            \
         |                  ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
>> kernel/crash_core.c:127:1: warning: '__no_profile_instrument_function__' attribute only applies to functions [-Wignored-attributes]
   include/linux/objtool.h:40:6: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      40 |             __noinstr_section(".discard.text.func_stack_frame_non_standard")    \
         |             ^
   include/linux/compiler_types.h:384:35: note: expanded from macro '__noinstr_section'
     384 |         __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
         |                                          ^
   include/linux/compiler_attributes.h:252:55: note: expanded from macro '__no_profile'
     252 | # define __no_profile                  __attribute__((__no_profile_instrument_function__))
         |                                                       ^
>> kernel/crash_core.c:127:1: error: variable has incomplete type 'void'
   include/linux/objtool.h:39:20: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      39 | static void __used __noendbr __nopfx notrace                                    \
         |                    ^
>> kernel/crash_core.c:127:1: error: expected ';' after top level declarator
   include/linux/objtool.h:41:6: note: expanded from macro 'STACK_FRAME_NON_STANDARD'
      41 |             ____annotate_non_standard_##func(void)                              \
         |             ^
   <scratch space>:115:1: note: expanded from here
     115 | ____annotate_non_standard___crash_kexec
         | ^
   5 warnings and 2 errors generated.


vim +/patchable_function_entry +127 kernel/crash_core.c

02aff848053381 Baoquan He 2024-01-24   99  
02aff848053381 Baoquan He 2024-01-24  100  /*
02aff848053381 Baoquan He 2024-01-24  101   * No panic_cpu check version of crash_kexec().  This function is called
02aff848053381 Baoquan He 2024-01-24  102   * only when panic_cpu holds the current CPU number; this is the only CPU
02aff848053381 Baoquan He 2024-01-24  103   * which processes crash_kexec routines.
02aff848053381 Baoquan He 2024-01-24  104   */
02aff848053381 Baoquan He 2024-01-24  105  void __noclone __crash_kexec(struct pt_regs *regs)
02aff848053381 Baoquan He 2024-01-24  106  {
02aff848053381 Baoquan He 2024-01-24  107  	/* Take the kexec_lock here to prevent sys_kexec_load
02aff848053381 Baoquan He 2024-01-24  108  	 * running on one cpu from replacing the crash kernel
02aff848053381 Baoquan He 2024-01-24  109  	 * we are using after a panic on a different cpu.
02aff848053381 Baoquan He 2024-01-24  110  	 *
02aff848053381 Baoquan He 2024-01-24  111  	 * If the crash kernel was not located in a fixed area
02aff848053381 Baoquan He 2024-01-24  112  	 * of memory the xchg(&kexec_crash_image) would be
02aff848053381 Baoquan He 2024-01-24  113  	 * sufficient.  But since I reuse the memory...
02aff848053381 Baoquan He 2024-01-24  114  	 */
02aff848053381 Baoquan He 2024-01-24  115  	if (kexec_trylock()) {
02aff848053381 Baoquan He 2024-01-24  116  		if (kexec_crash_image) {
02aff848053381 Baoquan He 2024-01-24  117  			struct pt_regs fixed_regs;
02aff848053381 Baoquan He 2024-01-24  118  
02aff848053381 Baoquan He 2024-01-24  119  			crash_setup_regs(&fixed_regs, regs);
02aff848053381 Baoquan He 2024-01-24  120  			crash_save_vmcoreinfo();
02aff848053381 Baoquan He 2024-01-24  121  			machine_crash_shutdown(&fixed_regs);
02aff848053381 Baoquan He 2024-01-24  122  			machine_kexec(kexec_crash_image);
02aff848053381 Baoquan He 2024-01-24  123  		}
02aff848053381 Baoquan He 2024-01-24  124  		kexec_unlock();
02aff848053381 Baoquan He 2024-01-24  125  	}
02aff848053381 Baoquan He 2024-01-24  126  }
02aff848053381 Baoquan He 2024-01-24 @127  STACK_FRAME_NON_STANDARD(__crash_kexec);
02aff848053381 Baoquan He 2024-01-24  128  

:::::: The code at line 127 was first introduced by commit
:::::: 02aff8480533817a29e820729360866441d7403d crash: split crash dumping code out from kexec_core.c

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
