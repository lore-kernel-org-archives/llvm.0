Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6A2C80
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 10:05:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="300065232"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="300065232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 02:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; 
   d="scan'208";a="477866074"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2021 02:05:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msixk-000G9p-N5; Thu, 02 Dec 2021 10:05:12 +0000
Date: Thu, 2 Dec 2021 18:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Rui <ray.huang@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rui:amd-pstate-dev-v5 6/22] include/acpi/processor.h:221:2: error:
 unknown type name 'phys_cpuid_t'
Message-ID: <202112021843.Qk1Pq4hR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git amd-pstate-dev-v5
head:   33ee93463b3b2fe05043d5be31bfb12475d7b142
commit: 912ee85e7c162de04823c6b061d5a9a482556d91 [6/22] cpufreq: amd: introduce a new amd pstate driver to support future processors
config: x86_64-buildonly-randconfig-r001-20211202 (https://download.01.org/0day-ci/archive/20211202/202112021843.Qk1Pq4hR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/commit/?id=912ee85e7c162de04823c6b061d5a9a482556d91
        git remote add rui https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git
        git fetch --no-tags rui amd-pstate-dev-v5
        git checkout 912ee85e7c162de04823c6b061d5a9a482556d91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/cpufreq/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/cpufreq/amd-pstate.c:27:
>> include/acpi/processor.h:221:2: error: unknown type name 'phys_cpuid_t'
           phys_cpuid_t phys_id;   /* CPU hardware ID such as APIC ID for x86 */
           ^
   include/acpi/processor.h:350:1: error: unknown type name 'phys_cpuid_t'
   phys_cpuid_t acpi_get_phys_id(acpi_handle, int type, u32 acpi_id);
   ^
   include/acpi/processor.h:351:1: error: unknown type name 'phys_cpuid_t'
   phys_cpuid_t acpi_map_madt_entry(u32 acpi_id);
   ^
   include/acpi/processor.h:352:20: error: unknown type name 'phys_cpuid_t'
   int acpi_map_cpuid(phys_cpuid_t phys_id, u32 acpi_id);
                      ^
   4 errors generated.


vim +/phys_cpuid_t +221 include/acpi/processor.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  217  
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  struct acpi_processor {
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  	acpi_handle handle;
^1da177e4c3f41 Linus Torvalds    2005-04-16  220  	u32 acpi_id;
828aef376d7a12 Catalin Marinas   2015-03-24 @221  	phys_cpuid_t phys_id;	/* CPU hardware ID such as APIC ID for x86 */
af8f3f514d193e Hanjun Guo        2015-01-04  222  	u32 id;		/* CPU logical ID allocated by OS */
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  	u32 pblk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  	int performance_platform_limit;
01854e697a77a4 Luming Yu         2007-05-26  225  	int throttling_platform_limit;
ff55a9cebab024 Len Brown         2007-06-02  226  	/* 0 - states 0..n-th state available */
01854e697a77a4 Luming Yu         2007-05-26  227  
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  	struct acpi_processor_flags flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  229  	struct acpi_processor_power power;
^1da177e4c3f41 Linus Torvalds    2005-04-16  230  	struct acpi_processor_performance *performance;
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	struct acpi_processor_throttling throttling;
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	struct acpi_processor_limit limit;
d9460fd227ed2c Zhang Rui         2008-01-17  233  	struct thermal_cooling_device *cdev;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  234  	struct device *dev; /* Processor device. */
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  235  	struct freq_qos_request perflib_req;
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  236  	struct freq_qos_request thermal_req;
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  

:::::: The code at line 221 was first introduced by commit
:::::: 828aef376d7a129547bc4ebb949965040177e3da ACPI / processor: Introduce phys_cpuid_t for CPU hardware ID

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
