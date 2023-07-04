Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5426620;
	Tue,  4 Jul 2023 02:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688436095; x=1719972095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HRSuOFx7DkaSJG7Z821vP8cgrmBC8OCzC1VHmmm/3CQ=;
  b=RLauuz7XcA/OQv4ZVo2XzGUqfDOSRb5X7R5JQwnTaNAn/yVCOUrtM7Ee
   FEnn1E4OsjnTGeMzVvB9dAZZ8yBeiSyx9xRADwbY7z1Ugk4niRkvR0EYq
   XSFXdn+aWwLgKpJWsFE4C6avxYE2y1gCzDQWbRqqWOcoSTt3FJ9KzumZE
   Kp40G1vwPHtOcd9HgkWvTf1ln5C+99BDBLXroE8Tdr4RLOzPyVm3W3mac
   0ALBMnlR9PakyjLwq9IVVFxtLiMlbNwgA0NeSmxS+AMi0kPJL3jUAQfO4
   XoyaeP6WcZOtoRCf6REFiKBg75Q8+i9dRIvp1huAizFjP8XEHmAoekPuz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393747403"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="393747403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 19:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712724104"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="712724104"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Jul 2023 19:01:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGVM9-000Hn9-0P;
	Tue, 04 Jul 2023 02:01:29 +0000
Date: Tue, 4 Jul 2023 10:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] arm64: properly define SOFT_DIRTY for arm64
Message-ID: <202307040950.rfBxS8hh-lkp@intel.com>
References: <20230703135526.930004-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703135526.930004-1-npache@redhat.com>

Hi Nico,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.4 next-20230703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/arm64-properly-define-SOFT_DIRTY-for-arm64/20230703-220825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230703135526.930004-1-npache%40redhat.com
patch subject: [RFC] arm64: properly define SOFT_DIRTY for arm64
config: arm64-randconfig-r022-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040950.rfBxS8hh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040950.rfBxS8hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040950.rfBxS8hh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:163:
   In file included from include/linux/kasan.h:33:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:1110:6: error: call to undeclared function 'arch_faults_on_old_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1110 |         if (arch_faults_on_old_pte())
         |             ^
   arch/arm64/include/asm/pgtable.h:1118:6: error: call to undeclared function 'arch_faults_on_old_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1118 |         if (arch_faults_on_old_pte())
         |             ^
   arch/arm64/include/asm/pgtable.h:1126:6: error: call to undeclared function 'arch_faults_on_old_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1126 |         if (arch_faults_on_old_pte())
         |             ^
   arch/arm64/include/asm/pgtable.h:1134:6: error: call to undeclared function 'arch_faults_on_old_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1134 |         if (arch_faults_on_old_pte())
         |             ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     100 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:


vim +/arch_faults_on_old_pte +1110 arch/arm64/include/asm/pgtable.h

  1099	
  1100	#ifdef CONFIG_ARM64_HW_AFDBM
  1101	/*
  1102	 * if we have the DBM bit we can utilize the software dirty bit as
  1103	 * a mechanism to introduce the soft_dirty functionality; however, without
  1104	 * it this bit is crucial to determining if a entry is dirty and we cannot
  1105	 * clear it via software. DBM can also be disabled or broken on some early
  1106	 * armv8 devices, so check its availability before modifying it.
  1107	 */
  1108	static inline pte_t pte_clear_soft_dirty(pte_t pte)
  1109	{
> 1110		if (arch_faults_on_old_pte())
  1111			return pte;
  1112	
  1113		return clear_pte_bit(pte, __pgprot(PTE_DIRTY));
  1114	}
  1115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
