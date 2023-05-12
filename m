Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08D7E9;
	Fri, 12 May 2023 02:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683859178; x=1715395178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrBRixNXTC6YblQw555jNmJTWEO78/6oICcr6TjjiJg=;
  b=RvUqh3B9xKGJEIHvF4vUYHr2ISDJKU8aS+KVtw7q7cen8b9STBM9DIFh
   Caap3ol7ad9+U/yP4yxncBAt0l3FPQuAHdQixMXbH2YHbQUeVBLBq8Ebf
   bIF3Jq01RhI/5R7YW7b7yM1nS8Ya+6psXamzlbwjZdJ+k4EY8hi94lrd8
   mlhTgjPWl77gRJof9Z8yxFSpu867xZA/fGH2D9COa6jiRp653M0WfVi1P
   h/ikaZS8Q2JhRybsqLFQO+l9zCkYTy3r2TxPxbVMXgraLaqFCyYzPCqZQ
   bkOJcLKEY36uqRTYvdM85pX5qzY7K+uR0Q7fQG3FQvlG/1iOPSuiOseji
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331051478"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331051478"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824201788"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824201788"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2023 19:39:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxIgv-0004RO-2i;
	Fri, 12 May 2023 02:39:33 +0000
Date: Fri, 12 May 2023 10:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 7/30] include/linux/acpi.h:1535:49: error:
 declaration of 'struct acpi_subtable_proc' will not be visible outside of
 this function
Message-ID: <202305121056.ixgdRdsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 216b67abb7e235c9a13ddf78f428cccf11a089f4 [7/30] acpi: move common tables helper functions to common lib
config: powerpc-buildonly-randconfig-r003-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121056.ixgdRdsG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=216b67abb7e235c9a13ddf78f428cccf11a089f4
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 216b67abb7e235c9a13ddf78f428cccf11a089f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ drivers/hid/i2c-hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121056.ixgdRdsG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/traps.c:32:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:13:
>> include/linux/acpi.h:1535:49: error: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Werror,-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   arch/powerpc/kernel/traps.c:1440:5: error: no previous prototype for function 'is_valid_bugaddr' [-Werror,-Wmissing-prototypes]
   int is_valid_bugaddr(unsigned long addr)
       ^
   arch/powerpc/kernel/traps.c:1440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int is_valid_bugaddr(unsigned long addr)
   ^
   static 
   2 errors generated.
--
   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:22:
   In file included from include/linux/i2c.h:13:
>> include/linux/acpi.h:1535:49: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
           struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
                                                          ^
   1 warning generated.


vim +1535 include/linux/acpi.h

  1526	
  1527	#ifdef CONFIG_ACPI_TABLES_LIB
  1528	int __init_or_acpilib acpi_parse_entries_array(
  1529		char *id, unsigned long table_size,
  1530		struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
  1531		int proc_num, unsigned int max_entries);
  1532	#else
  1533	static inline int acpi_parse_entries_array(
  1534		char *id, unsigned long table_size,
> 1535		struct acpi_table_header *table_header, struct acpi_subtable_proc *proc,
  1536		int proc_num, unsigned int max_entries)
  1537	{
  1538		return -EOPNOTSUPP;
  1539	}
  1540	#endif
  1541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
