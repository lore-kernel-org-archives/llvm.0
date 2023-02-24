Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF791AD58;
	Fri, 24 Feb 2023 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677268329; x=1708804329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wJQQKJXhn0zDFMiXITO9NUG88kZkszeHGbyiK46HK0=;
  b=Tc51mDyalR3/4RzGZAZfRn811Q6o9Rl+2Q9PfUDfcWs8wCpYFhQOCR5y
   ir44OKIjBIC/MPJtSTcZwJqW1L6lP1+xX47MIw4lNjHWbnk7YtmhuGZeC
   uyjDxgAHUhopQPumlzwhF0IkeeAeUXYbCPOloKAMtUqkPTm6Oa4WhwDU2
   IkwnW3VPK00iHWlOQdPGrgNCjC+I41FHDdBdXKEv4tcTh3uH+JtaDnBb3
   rcKdfYm6LawgSldaKCVy2AQ5JBLjaVNtk2mPhFdYYKyuQ81YVwnQO6tjS
   eOS8k4gxnypr0fVmQwRQy2DnMSaKaLiIKziP8Vf6YRef9eI6ckz4Vi0iS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361074002"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="361074002"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 11:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="847051864"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="847051864"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 11:52:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVe6v-0002gx-21;
	Fri, 24 Feb 2023 19:52:05 +0000
Date: Sat, 25 Feb 2023 03:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/30]
 arch/arm/kernel/entry-armv.S:271:23: error: cannot mix positional and
 keyword arguments
Message-ID: <202302250306.elni46RL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   35ac5a9a53d2554bda395cdfa3236d278715caac
commit: 0bf7902c72bece7c368367ab29582834a7fff130 [29/30] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r035-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250306.elni46RL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0bf7902c72bece7c368367ab29582834a7fff130
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0bf7902c72bece7c368367ab29582834a7fff130
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250306.elni46RL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/entry-armv.S:271:23: error: cannot mix positional and keyword arguments
    svc_entry uaccess=0, 64
                         ^


vim +271 arch/arm/kernel/entry-armv.S

   264	
   265		.align	5
   266	__und_svc:
   267	#ifdef CONFIG_KPROBES
   268		@ If a kprobe is about to simulate a "stmdb sp..." instruction,
   269		@ it obviously needs free stack space which then will belong to
   270		@ the saved context.
 > 271		svc_entry uaccess=0, MAX_STACK_SIZE
   272	#else
   273		svc_entry uaccess=0
   274	#endif
   275	
   276		mov	r1, #4				@ PC correction to apply
   277	 THUMB(	tst	r5, #PSR_T_BIT		)	@ exception taken in Thumb mode?
   278	 THUMB(	movne	r1, #2			)	@ if so, fix up PC correction
   279		mov	r0, sp				@ struct pt_regs *regs
   280		bl	__und_fault
   281	
   282	__und_svc_finish:
   283		get_thread_info tsk
   284		ldr	r5, [sp, #S_PSR]		@ Get SVC cpsr
   285		svc_exit rpsr=r5, uaccess=0		@ return from exception
   286	 UNWIND(.fnend		)
   287	ENDPROC(__und_svc)
   288	
   289		.align	5
   290	__pabt_svc:
   291		svc_entry uaccess=0
   292		mov	r2, sp				@ regs
   293		pabt_helper
   294		svc_exit rpsr=r5, uaccess=0		@ return from exception
   295	 UNWIND(.fnend		)
   296	ENDPROC(__pabt_svc)
   297	
   298		.align	5
   299	__fiq_svc:
   300		svc_entry trace=0, uaccess=0
   301		mov	r0, sp				@ struct pt_regs *regs
   302		bl	handle_fiq_as_nmi
   303		svc_exit_via_fiq uaccess=0
   304	 UNWIND(.fnend		)
   305	ENDPROC(__fiq_svc)
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
