Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30311C3B;
	Tue,  4 Jul 2023 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688510885; x=1720046885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P36ftsdxZdbUKK2EiKfumvu0G/SlBi2JvwPg8WM9O04=;
  b=KAU3JzTnLb8GbHkqzjRRl6ITW+umvfYciQYdj2AucWm1Qp3b5BAkH0To
   Kogmkw/lznxZ2rjgHvdYM3BwwoKezhQNmjU1Sq0Bz4ZNSYgTq5sEptlFM
   YV8i/QekCS4ItiB9dPp4Lrszj4lBIxDTERBlXjolCugxzIk2V6qN/S/EG
   rnpwQhFtO456aAo5/ja9O3YrnjA1a/HEx28OokYOjrLJomkvwsCNo1Hlh
   dGUt0SfydsvsVZTznLeEJMmmi7gnFPqV0tqGAIBj5Hy/BK8okR4m2FWPK
   INH6/IdExkweloIM8EvxgI1/Rd4it16uK6imKgAngCifaSlPB7woH5xCg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362067217"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="362067217"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 15:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965607729"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="965607729"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 15:48:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGooU-000IbL-1F;
	Tue, 04 Jul 2023 22:48:02 +0000
Date: Wed, 5 Jul 2023 06:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12982/13166] kernel/kexec_core.c:1061:4: error:
 implicit declaration of function 'crash_setup_regs' is invalid in C99
Message-ID: <202307050646.lQceIAoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 62c177f4ed72c8c34d818f92f0d067a6c1b7cb80 [12982/13166] arm/kexec: refactor for kernel/Kconfig.kexec
config: arm-randconfig-r002-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050646.lQceIAoV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050646.lQceIAoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050646.lQceIAoV-lkp@intel.com/

Note: the linux-next/master HEAD 1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:15:
   include/linux/kexec.h:41:2: error: KEXEC_SOURCE_MEMORY_LIMIT not defined
   #error KEXEC_SOURCE_MEMORY_LIMIT not defined
    ^
   include/linux/kexec.h:45:2: error: KEXEC_DESTINATION_MEMORY_LIMIT not defined
   #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
    ^
   include/linux/kexec.h:49:2: error: KEXEC_CONTROL_MEMORY_LIMIT not defined
   #error KEXEC_CONTROL_MEMORY_LIMIT not defined
    ^
   include/linux/kexec.h:57:2: error: KEXEC_CONTROL_PAGE_SIZE not defined
   #error KEXEC_CONTROL_PAGE_SIZE not defined
    ^
   include/linux/kexec.h:61:2: error: KEXEC_ARCH not defined
   #error KEXEC_ARCH not defined
    ^
   kernel/kexec_core.c:179:15: error: use of undeclared identifier 'KEXEC_DESTINATION_MEMORY_LIMIT'
                   if (mend >= KEXEC_DESTINATION_MEMORY_LIMIT)
                               ^
   kernel/kexec_core.c:388:17: error: use of undeclared identifier 'KEXEC_CONTROL_MEMORY_LIMIT'
                   if ((epfn >= (KEXEC_CONTROL_MEMORY_LIMIT >> PAGE_SHIFT)) ||
                                 ^
   kernel/kexec_core.c:454:18: error: use of undeclared identifier 'KEXEC_CONTROL_MEMORY_LIMIT'
                   if (hole_end > KEXEC_CRASH_CONTROL_MEMORY_LIMIT)
                                  ^
   include/linux/kexec.h:65:42: note: expanded from macro 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'
   #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
                                            ^
   kernel/kexec_core.c:721:6: error: use of undeclared identifier 'KEXEC_SOURCE_MEMORY_LIMIT'
                                   (KEXEC_SOURCE_MEMORY_LIMIT >> PAGE_SHIFT)) {
                                    ^
>> kernel/kexec_core.c:1061:4: error: implicit declaration of function 'crash_setup_regs' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           crash_setup_regs(&fixed_regs, regs);
                           ^
   10 errors generated.


vim +/crash_setup_regs +1061 kernel/kexec_core.c

7e99f8b69c11c1 Ricardo Ribalda    2023-01-04  1041  
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1042  /*
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1043   * No panic_cpu check version of crash_kexec().  This function is called
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1044   * only when panic_cpu holds the current CPU number; this is the only CPU
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1045   * which processes crash_kexec routines.
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1046   */
c207aee48037ab Josh Poimboeuf     2017-06-28  1047  void __noclone __crash_kexec(struct pt_regs *regs)
2965faa5e03d1e Dave Young         2015-09-09  1048  {
05c6257433b721 Valentin Schneider 2022-06-30  1049  	/* Take the kexec_lock here to prevent sys_kexec_load
2965faa5e03d1e Dave Young         2015-09-09  1050  	 * running on one cpu from replacing the crash kernel
2965faa5e03d1e Dave Young         2015-09-09  1051  	 * we are using after a panic on a different cpu.
2965faa5e03d1e Dave Young         2015-09-09  1052  	 *
2965faa5e03d1e Dave Young         2015-09-09  1053  	 * If the crash kernel was not located in a fixed area
2965faa5e03d1e Dave Young         2015-09-09  1054  	 * of memory the xchg(&kexec_crash_image) would be
2965faa5e03d1e Dave Young         2015-09-09  1055  	 * sufficient.  But since I reuse the memory...
2965faa5e03d1e Dave Young         2015-09-09  1056  	 */
05c6257433b721 Valentin Schneider 2022-06-30  1057  	if (kexec_trylock()) {
2965faa5e03d1e Dave Young         2015-09-09  1058  		if (kexec_crash_image) {
2965faa5e03d1e Dave Young         2015-09-09  1059  			struct pt_regs fixed_regs;
2965faa5e03d1e Dave Young         2015-09-09  1060  
2965faa5e03d1e Dave Young         2015-09-09 @1061  			crash_setup_regs(&fixed_regs, regs);
2965faa5e03d1e Dave Young         2015-09-09  1062  			crash_save_vmcoreinfo();
2965faa5e03d1e Dave Young         2015-09-09  1063  			machine_crash_shutdown(&fixed_regs);
2965faa5e03d1e Dave Young         2015-09-09  1064  			machine_kexec(kexec_crash_image);
2965faa5e03d1e Dave Young         2015-09-09  1065  		}
05c6257433b721 Valentin Schneider 2022-06-30  1066  		kexec_unlock();
2965faa5e03d1e Dave Young         2015-09-09  1067  	}
2965faa5e03d1e Dave Young         2015-09-09  1068  }
c207aee48037ab Josh Poimboeuf     2017-06-28  1069  STACK_FRAME_NON_STANDARD(__crash_kexec);
2965faa5e03d1e Dave Young         2015-09-09  1070  

:::::: The code at line 1061 was first introduced by commit
:::::: 2965faa5e03d1e71e9ff9aa143fff39e0a77543a kexec: split kexec_load syscall from kexec core code

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
