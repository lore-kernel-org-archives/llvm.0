Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2BA367;
	Sat, 18 Mar 2023 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679097987; x=1710633987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XhTjIvpHzw0sWxBaHVQ8rD9/hEwzpTj35ai0SwL6A2s=;
  b=SxibE9iD/TLixVTIxe+L2a9rG3dOBu8Eun0ZkSOgfhvNDHyq2U41SjF8
   FInAd9BLG9KD1J128OS/Q+q0E7kYgvdZ+OI00kCBxHv9xcMLkFSVfR85+
   50X5VkLerTIgVlH7hSSq70ElOT0i08PdG1uZSpHnUVLBN5G8nDSC5JZlq
   /4KcLQRHr38smLevrcanenKqSLGL9ceafL+bi+EaRzNxKj83MjNxM6rhr
   sy6Ej22lEvNr64Vj64sk+wXQzfnAhZux5nTl1MzfWubtDM1wHpaFywpzU
   yEjVz1p6xbUXKdslhxioC5mGDEB/kpAEndsdik+BEM6GfPtWRAnZ/ZWpS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339926930"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="339926930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 17:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744734166"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744734166"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 17:06:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdK5Y-0009fw-04;
	Sat, 18 Mar 2023 00:06:24 +0000
Date: Sat, 18 Mar 2023 08:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"Ap, Kamal" <kamal.ap@intel.corp-partner.google.com>,
	Ben Zhang <benzh@google.com>
Subject: [jsarha:topic/chromeos-4.19-s0ix 3632/9999]
 sound/soc/sof/sof-acpi-dev.c:283:36: warning: unused variable
 'sof_acpi_match'
Message-ID: <202303180831.InjZIMzs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liam,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: f05fac60091358fb9805b6a6c6dc38a995361910 [3632/9999] FROMLIST: ASoC: SOF: Add Build support for SOF core and Intel drivers
config: mips-randconfig-r006-20230317 (https://download.01.org/0day-ci/archive/20230318/202303180831.InjZIMzs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/jsarha/linux/commit/f05fac60091358fb9805b6a6c6dc38a995361910
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout f05fac60091358fb9805b6a6c6dc38a995361910
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=sound/soc/sof

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180831.InjZIMzs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from sound/soc/sof/sof-acpi-dev.c:11:
   In file included from include/linux/acpi.h:26:
   In file included from include/linux/resource_ext.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:88:
   In file included from arch/mips/include/asm/spinlock.h:13:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:75:36: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                                                cnts, cnts | _QW_LOCKED) == cnts);
                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from sound/soc/sof/sof-acpi-dev.c:11:
   In file included from include/linux/acpi.h:26:
   In file included from include/linux/resource_ext.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:88:
   In file included from arch/mips/include/asm/spinlock.h:13:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:75:36: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                                                cnts, cnts | _QW_LOCKED) == cnts);
                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from sound/soc/sof/sof-acpi-dev.c:11:
   In file included from include/linux/acpi.h:26:
   In file included from include/linux/resource_ext.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:984:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   In file included from sound/soc/sof/sof-acpi-dev.c:11:
   In file included from include/linux/acpi.h:26:
   In file included from include/linux/resource_ext.h:19:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:984:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   In file included from sound/soc/sof/sof-acpi-dev.c:17:
   In file included from include/sound/sof.h:14:
   In file included from include/linux/pci.h:1346:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:26:
   In file included from include/linux/page_ref.h:7:
   include/linux/page-flags.h:162:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
           return page->flags == PAGE_POISON_PATTERN;
                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/sof/sof-acpi-dev.c:17:
   In file included from include/sound/sof.h:14:
   In file included from include/linux/pci.h:1346:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1157:
   include/linux/vmstat.h:221:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from sound/soc/sof/sof-acpi-dev.c:17:
   In file included from include/sound/sof.h:15:
   In file included from include/sound/soc.h:23:
   include/sound/pcm.h:1412:17: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
                   if (s->number == idx)
                       ~~~~~~~~~ ^  ~~~
>> sound/soc/sof/sof-acpi-dev.c:283:36: warning: unused variable 'sof_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id sof_acpi_match[] = {
                                      ^
   12 warnings generated.
   Assembler messages:
   Fatal error: invalid -march= option: `mips32'
   clang: error: assembler command failed with exit code 1 (use -v to see invocation)


vim +/sof_acpi_match +283 sound/soc/sof/sof-acpi-dev.c

7ded5a51b17461 Liam Girdwood 2019-02-13  282  
7ded5a51b17461 Liam Girdwood 2019-02-13 @283  static const struct acpi_device_id sof_acpi_match[] = {
7ded5a51b17461 Liam Girdwood 2019-02-13  284  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HASWELL)
7ded5a51b17461 Liam Girdwood 2019-02-13  285  	{ "INT33C8", (unsigned long)&sof_acpi_haswell_desc },
7ded5a51b17461 Liam Girdwood 2019-02-13  286  #endif
7ded5a51b17461 Liam Girdwood 2019-02-13  287  #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
7ded5a51b17461 Liam Girdwood 2019-02-13  288  	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
7ded5a51b17461 Liam Girdwood 2019-02-13  289  #endif
7ded5a51b17461 Liam Girdwood 2019-02-13  290  #if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
7ded5a51b17461 Liam Girdwood 2019-02-13  291  	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
7ded5a51b17461 Liam Girdwood 2019-02-13  292  	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
7ded5a51b17461 Liam Girdwood 2019-02-13  293  #endif
7ded5a51b17461 Liam Girdwood 2019-02-13  294  	{ }
7ded5a51b17461 Liam Girdwood 2019-02-13  295  };
7ded5a51b17461 Liam Girdwood 2019-02-13  296  MODULE_DEVICE_TABLE(acpi, sof_acpi_match);
7ded5a51b17461 Liam Girdwood 2019-02-13  297  

:::::: The code at line 283 was first introduced by commit
:::::: 7ded5a51b17461f62a4e0e3bf0090980a5292f2f FROMLIST: ASoC: SOF: Add ACPI device support

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
