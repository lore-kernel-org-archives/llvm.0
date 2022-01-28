Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1402C80
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643390861; x=1674926861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cqDNPT7cB2u3KKQRoycfIA7AubTrJMgURIF61dYTCcM=;
  b=IpV0gi7BvqKUSNYhfN7OK/zjwonkPu2TDQS7uCnme853hqOX5Zn6CYt5
   Y+zAeFelOutztRSrmxiVfOTtIDfoqdqo+dC17rABUAUl84eBWycNowJzn
   EAghv4jEPNiVvlBOWPed6dRJsSqdqMBjHgPnLfcEwwtv+wErX8GGy/clk
   bb2giBb0eMitqs+F7JFRc5H7T4pEPpnvVUmN3Ei/pgjB/r25CjEm2vXVn
   ca4W2/aOi+5zPJ1QQgUlYJ4ZZn6wFF3uUlmLDf8IJ/RILOJ2zfH+Ndzje
   6jm6mUWa+3bSXnLlTv7z0odqqbW3xHoo5eAsyN+iQ/cyMJLVxVl7YSPqp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247112511"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="247112511"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 09:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="564258572"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2022 09:27:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDV2A-000O8l-Lr; Fri, 28 Jan 2022 17:27:38 +0000
Date: Sat, 29 Jan 2022 01:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 2464/2855] arch/arm/kernel/setup.c:1028:49:
 error: use of undeclared identifier 'SECTION_SIZE'
Message-ID: <202201290101.JjTXjbCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: 35f56ebeffca44e35eda0a5c6a6ce2cf632b03f9 [2464/2855] arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
config: arm-randconfig-r011-20220127 (https://download.01.org/0day-ci/archive/20220129/202201290101.JjTXjbCK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=35f56ebeffca44e35eda0a5c6a6ce2cf632b03f9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 35f56ebeffca44e35eda0a5c6a6ce2cf632b03f9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/kernel/setup.c:1028:49: error: use of undeclared identifier 'SECTION_SIZE'
                   start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
                                                                 ^
   1 error generated.


vim +/SECTION_SIZE +1028 arch/arm/kernel/setup.c

3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   989  
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   990  /**
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   991   * reserve_crashkernel() - reserves memory are for crash kernel
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   992   *
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   993   * This function reserves memory area given in "crashkernel=" kernel command
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   994   * line parameter. The memory reserved is used by a dump capture kernel when
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   995   * primary kernel is crashing.
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   996   */
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   997  static void __init reserve_crashkernel(void)
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   998  {
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10   999  	unsigned long long crash_size, crash_base;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1000  	unsigned long long total_mem;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1001  	int ret;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1002  
35f56ebeffca44e Jisheng Zhang   2022-01-27  1003  	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
35f56ebeffca44e Jisheng Zhang   2022-01-27  1004  		return;
35f56ebeffca44e Jisheng Zhang   2022-01-27  1005  
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1006  	total_mem = get_total_mem();
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1007  	ret = parse_crashkernel(boot_command_line, total_mem,
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1008  				&crash_size, &crash_base);
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1009  	if (ret)
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1010  		return;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1011  
61603016e2122bf Russell King    2016-03-14  1012  	if (crash_base <= 0) {
d0506a2395eb07b Russell King    2016-04-01  1013  		unsigned long long crash_max = idmap_to_phys((u32)~0);
67556d7a851c201 Russell King    2017-07-19  1014  		unsigned long long lowmem_max = __pa(high_memory - 1) + 1;
67556d7a851c201 Russell King    2017-07-19  1015  		if (crash_max > lowmem_max)
67556d7a851c201 Russell King    2017-07-19  1016  			crash_max = lowmem_max;
a7259df7670240e Mike Rapoport   2021-09-02  1017  
a7259df7670240e Mike Rapoport   2021-09-02  1018  		crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
a7259df7670240e Mike Rapoport   2021-09-02  1019  						       CRASH_ALIGN, crash_max);
61603016e2122bf Russell King    2016-03-14  1020  		if (!crash_base) {
61603016e2122bf Russell King    2016-03-14  1021  			pr_err("crashkernel reservation failed - No suitable area found.\n");
61603016e2122bf Russell King    2016-03-14  1022  			return;
61603016e2122bf Russell King    2016-03-14  1023  		}
61603016e2122bf Russell King    2016-03-14  1024  	} else {
a7259df7670240e Mike Rapoport   2021-09-02  1025  		unsigned long long crash_max = crash_base + crash_size;
61603016e2122bf Russell King    2016-03-14  1026  		unsigned long long start;
61603016e2122bf Russell King    2016-03-14  1027  
a7259df7670240e Mike Rapoport   2021-09-02 @1028  		start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
a7259df7670240e Mike Rapoport   2021-09-02  1029  						  crash_base, crash_max);
a7259df7670240e Mike Rapoport   2021-09-02  1030  		if (!start) {
61603016e2122bf Russell King    2016-03-14  1031  			pr_err("crashkernel reservation failed - memory is in use.\n");
61603016e2122bf Russell King    2016-03-14  1032  			return;
61603016e2122bf Russell King    2016-03-14  1033  		}
61603016e2122bf Russell King    2016-03-14  1034  	}
61603016e2122bf Russell King    2016-03-14  1035  
1b0f6681fcbc0e6 Olof Johansson  2013-12-05  1036  	pr_info("Reserving %ldMB of memory at %ldMB for crashkernel (System RAM: %ldMB)\n",
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1037  		(unsigned long)(crash_size >> 20),
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1038  		(unsigned long)(crash_base >> 20),
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1039  		(unsigned long)(total_mem >> 20));
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1040  
f7f0b7dc720f81b Russell King    2016-08-02  1041  	/* The crashk resource must always be located in normal mem */
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1042  	crashk_res.start = crash_base;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1043  	crashk_res.end = crash_base + crash_size - 1;
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1044  	insert_resource(&iomem_resource, &crashk_res);
f7f0b7dc720f81b Russell King    2016-08-02  1045  
f7f0b7dc720f81b Russell King    2016-08-02  1046  	if (arm_has_idmap_alias()) {
f7f0b7dc720f81b Russell King    2016-08-02  1047  		/*
f7f0b7dc720f81b Russell King    2016-08-02  1048  		 * If we have a special RAM alias for use at boot, we
f7f0b7dc720f81b Russell King    2016-08-02  1049  		 * need to advertise to kexec tools where the alias is.
f7f0b7dc720f81b Russell King    2016-08-02  1050  		 */
f7f0b7dc720f81b Russell King    2016-08-02  1051  		static struct resource crashk_boot_res = {
f7f0b7dc720f81b Russell King    2016-08-02  1052  			.name = "Crash kernel (boot alias)",
f7f0b7dc720f81b Russell King    2016-08-02  1053  			.flags = IORESOURCE_BUSY | IORESOURCE_MEM,
f7f0b7dc720f81b Russell King    2016-08-02  1054  		};
f7f0b7dc720f81b Russell King    2016-08-02  1055  
f7f0b7dc720f81b Russell King    2016-08-02  1056  		crashk_boot_res.start = phys_to_idmap(crash_base);
f7f0b7dc720f81b Russell King    2016-08-02  1057  		crashk_boot_res.end = crashk_boot_res.start + crash_size - 1;
f7f0b7dc720f81b Russell King    2016-08-02  1058  		insert_resource(&iomem_resource, &crashk_boot_res);
f7f0b7dc720f81b Russell King    2016-08-02  1059  	}
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1060  }
3c57fb43c8fcbe4 Mika Westerberg 2010-05-10  1061  

:::::: The code at line 1028 was first introduced by commit
:::::: a7259df7670240ee03b0cfce8a3e5d3773911e24 memblock: make memblock_find_in_range method private

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
