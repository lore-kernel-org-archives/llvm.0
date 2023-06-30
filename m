Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5517C6;
	Fri, 30 Jun 2023 01:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688088070; x=1719624070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujwKAsxrkHjGlGR4a9B49pTV73FX87nxzN5eLqWkPS0=;
  b=hCWvTOTigyvfVMS/R2KaLhojK0mo7zWrQmozQrRZIXpsGwIvrdLjKP/a
   GrBSUNWc1WUH8zx/Db40V09+Uy7Txb556jRDtqaBKkeULdVATUHnWxjSq
   4mWxplZDw9o9FiEY27JBo6VwaPEu8Wlffo5bJzsmm7E5KvmO26Yeojn9b
   nR1LiTVVVuhGaRvgoqWzUUSnJsSBgP2kQLVZ5HvTWbH8Nx+olmP1fFi+3
   Gih3ARaWIh5hD/9mHoIxkepmPeeAYW50BafcuOOnAeNCi2o3I3Q2Aj/9f
   jU0fhC8sG+b0W+fR3MIg44K8vE4AQXXwENCPSqShMW+WyCkjlbq/CIKjj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342616239"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="342616239"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 18:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="720766442"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="720766442"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2023 18:21:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF2os-000EZZ-0P;
	Fri, 30 Jun 2023 01:21:06 +0000
Date: Fri, 30 Jun 2023 09:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split 23/26]
 arch/arm/include/asm/uaccess.h:45:2: warning: use of a '#elifdef' directive
 is a C2x extension
Message-ID: <202306300935.VrmUlMGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
head:   d0cf2fe7497259ee8a7308da99a8cbafaab5e5b5
commit: f568e0b0cf6225d4d5a6fc568d94e7f64f24b9d6 [23/26] ARM: kernel/userspace address separation
config: arm-randconfig-r036-20230630 (https://download.01.org/0day-ci/archive/20230630/202306300935.VrmUlMGL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300935.VrmUlMGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300935.VrmUlMGL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:976:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
>> arch/arm/include/asm/uaccess.h:45:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      45 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   arch/arm/include/asm/uaccess.h:68:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      68 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   2 warnings generated.
--
   In file included from drivers/platform/goldfish/goldfish_pipe.c:57:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
>> arch/arm/include/asm/uaccess.h:45:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      45 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   arch/arm/include/asm/uaccess.h:68:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      68 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   drivers/platform/goldfish/goldfish_pipe.c:926:36: warning: unused variable 'goldfish_pipe_acpi_match' [-Wunused-const-variable]
     926 | static const struct acpi_device_id goldfish_pipe_acpi_match[] = {
         |                                    ^
   3 warnings generated.
--
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:976:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
>> arch/arm/include/asm/uaccess.h:45:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      45 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   arch/arm/include/asm/uaccess.h:68:2: warning: use of a '#elifdef' directive is a C2x extension [-Wc2x-extensions]
      68 | #elifdef CONFIG_ARM_KERNEL_SEPARATION
         |  ^
   2 warnings generated.


vim +45 arch/arm/include/asm/uaccess.h

    28	
    29	/*
    30	 * These two functions allow hooking accesses to userspace to increase
    31	 * system integrity by ensuring that the kernel can not inadvertantly
    32	 * perform such accesses (eg, via list poison values) which could then
    33	 * be exploited for priviledge escalation.
    34	 */
    35	static __always_inline unsigned int uaccess_save_and_enable(void)
    36	{
    37	#ifdef CONFIG_CPU_SW_DOMAIN_PAN
    38		unsigned int old_domain = get_domain();
    39	
    40		/* Set the current domain access to permit user accesses */
    41		set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
    42			   domain_val(DOMAIN_USER, DOMAIN_CLIENT));
    43	
    44		return old_domain;
  > 45	#elifdef CONFIG_ARM_KERNEL_SEPARATION
    46		/*
    47		 * Intended semantics: switch to the userspace MM context (enable
    48		 * userspace), then return (save) the previous kernelspace TTBR0
    49		 * value.
    50		 */
    51		u64 user_ttbr, kernel_ttbr;
    52	
    53		user_ttbr = current_user_ttbr();
    54		kernel_ttbr = read_sysreg(TTBR1);
    55		write_sysreg(user_ttbr, TTBR0);
    56	
    57		return kernel_ttbr;
    58	#else
    59		return 0;
    60	#endif
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
