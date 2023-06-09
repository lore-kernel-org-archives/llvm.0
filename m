Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087F186A;
	Fri,  9 Jun 2023 03:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686279674; x=1717815674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjTkefa1QLo0jLgb3+cNCQZg8G8Kq6HswgFN2t0oZ7o=;
  b=OeV3uifCdT/31NdFqsYZd96ezXQ6xG4+uhpCzeO5TRXRrEFw7wM/vWAd
   QTGXgoYX9jpRaMhGO4i75heKGW2tY0OHM7riO+K2bAapgH1uJBDGL6Ugl
   UFaVkJnSXRsjYqygE7/dDDtIi4/aVVKpHlBp60ZO1ZWVqX9VY4PJHvi1M
   4GK9KRdP5aoHqHhc/xQF0Q/oOCf1yFDxskFNTLTPlZ1FiJE0ZbbkkLPWS
   SscEdcYj4v0lBw1cEoJc+SspSSoO7jC/bYGNAjSjy28nNEYrLTaKw+lUY
   CoxhxqsldmKBLFXbdIS7jfgPE/tr+wcQhEUqoYR2gzcGINBqaAiSOU3co
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357501063"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="357501063"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713346305"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713346305"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 20:01:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SNA-0008Yo-34;
	Fri, 09 Jun 2023 03:01:08 +0000
Date: Fri, 9 Jun 2023 11:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [ulfh-mmc:next 14/14] drivers/mmc/host/mtk-sd.c:2468:12: error: call
 to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202306091026.vw1tQGJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   364dae3e80a48fcd22c9d4e57223d2918bcadd6f
commit: 364dae3e80a48fcd22c9d4e57223d2918bcadd6f [14/14] mmc: mtk-sd: reduce CIT for better performance
config: powerpc-randconfig-r021-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091026.vw1tQGJ1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?id=364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 364dae3e80a48fcd22c9d4e57223d2918bcadd6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/mmc/host/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091026.vw1tQGJ1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mmc/host/mtk-sd.c:2468:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2468 |         itcfmul = CQHCI_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
         |                   ^
   drivers/mmc/host/cqhci.h:27:27: note: expanded from macro 'CQHCI_ITCFMUL'
      27 | #define CQHCI_ITCFMUL(x)                FIELD_GET(CQHCI_CAP_ITCFMUL, (x))
         |                                         ^
>> drivers/mmc/host/mtk-sd.c:2471:3: warning: comparison of distinct pointer types ('typeof ((hclk_freq)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/mmc/host/mtk-sd.c:2471:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/mmc/host/mtk-sd.c:2474:3: warning: comparison of distinct pointer types ('typeof ((hclk_freq)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:2474:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/mmc/host/mtk-sd.c:2477:3: warning: comparison of distinct pointer types ('typeof ((hclk_freq)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:2477:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/mmc/host/mtk-sd.c:2471:3: warning: shift count >= width of type [-Wshift-count-overflow]
    2471 |                 do_div(hclk_freq, 1000);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2474:3: warning: shift count >= width of type [-Wshift-count-overflow]
    2474 |                 do_div(hclk_freq, 100);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mmc/host/mtk-sd.c:2477:3: warning: shift count >= width of type [-Wshift-count-overflow]
    2477 |                 do_div(hclk_freq, 10);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   6 warnings and 4 errors generated.


vim +/FIELD_GET +2468 drivers/mmc/host/mtk-sd.c

  2453	
  2454	static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
  2455	{
  2456		struct mmc_host *mmc = mmc_from_priv(host);
  2457		struct cqhci_host *cq_host = mmc->cqe_private;
  2458		u8 itcfmul;
  2459		unsigned long hclk_freq;
  2460		u64 value;
  2461	
  2462		/*
  2463		 * On MediaTek SoCs the MSDC controller's CQE uses msdc_hclk as ITCFVAL
  2464		 * so we multiply/divide the HCLK frequency by ITCFMUL to calculate the
  2465		 * Send Status Command Idle Timer (CIT) value.
  2466		 */
  2467		hclk_freq = clk_get_rate(host->h_clk);
> 2468		itcfmul = CQHCI_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
  2469		switch (itcfmul) {
  2470		case 0x0:
> 2471			do_div(hclk_freq, 1000);
  2472			break;
  2473		case 0x1:
  2474			do_div(hclk_freq, 100);
  2475			break;
  2476		case 0x2:
> 2477			do_div(hclk_freq, 10);
  2478			break;
  2479		case 0x3:
  2480			break;
  2481		case 0x4:
  2482			hclk_freq = hclk_freq * 10;
  2483			break;
  2484		default:
  2485			host->cq_ssc1_time = 0x40;
  2486			return;
  2487		}
  2488	
  2489		value = hclk_freq * timer_ns;
  2490		do_div(value, 1000000000);
  2491		host->cq_ssc1_time = value;
  2492	}
  2493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
