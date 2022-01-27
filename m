Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497482CA0
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643316079; x=1674852079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtXUQzPfEgkweEHkVOvRzld+rVCoXr9X4ootNwJo2Kc=;
  b=Y6CZZMGxmbAAVBkQ/pvw42xP/QCOiDbIwzF23bZETKQ2/SS70qoq+U13
   BnMkIYYnpJQ33kj63qbrPihGMT8rU79m3tKk1RqbJ/7wRPiY4yc7TRocg
   UCWbLcpDeuOAbWmkfrN92w2moXX4ksNj7AhT/7L0gbqK10sFAzakF39n7
   cOiO6dfjBg5eCnppty6xJ/XGpxHkev56I8TZlkqqc2oCP1uVIONLx4oLE
   KITEKHjjHPxaRs6mQjpH7riOJxfN0Dvu9CEAdflZ8uy6seSmDcBTTy7ED
   x47R8aljAl4prYfiaVVgjJU1JpIB81HER4PG1nF4uO4flm9NnsUFDXYgA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246735252"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="246735252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 12:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="597961775"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jan 2022 12:41:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDBa0-000N1Z-Dg; Thu, 27 Jan 2022 20:41:16 +0000
Date: Fri, 28 Jan 2022 04:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ramji Jiyani <ramjiyani@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 9410/9999] kernel/gki_module.c:35:6: warning: no previous prototype for
 function 'gki_is_module_protected_symbol'
Message-ID: <202201280406.7Em0aA4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   7edc8bc69d7def26c4528360c9ec96dbeadcd0a1
commit: 9ab6a242258a9ac17506b74c6ed7332703d536f4 [9410/9999] ANDROID: GKI: Add module load time protected symbol lookup
config: arm-randconfig-r023-20220127 (https://download.01.org/0day-ci/archive/20220128/202201280406.7Em0aA4W-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/9ab6a242258a9ac17506b74c6ed7332703d536f4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout 9ab6a242258a9ac17506b74c6ed7332703d536f4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_symbol' [-Wmissing-prototypes]
   bool gki_is_module_protected_symbol(const char *name)
        ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_protected_symbol(const char *name)
   ^
   static 
>> kernel/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_exported_symbol' [-Wmissing-prototypes]
   bool gki_is_module_exported_symbol(const char *name)
        ^
   kernel/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_exported_symbol(const char *name)
   ^
   static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on NETDEVICES
   Selected by
   - GKI_HIDDEN_ETHERNET_CONFIGS
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on NET && WIRELESS && (CFG80211_WEXT || WIRELESS_EXT
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on NET
   Selected by
   - GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on MMU
   Selected by
   - GKI_HIDDEN_GPU_CONFIGS
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on NET && WIRELESS && PROC_FS && WEXT_CORE
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on NET && WIRELESS
   Selected by
   - GKI_LEGACY_WEXT_ALLCONFIG
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on NET
   Selected by
   - GKI_HIDDEN_NET_CONFIGS


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
