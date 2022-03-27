Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6D2FAE
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 22:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648419699; x=1679955699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6DkAmUQZS/disVcR4AxxsxafJ4v3gjgDl0swelDO9LM=;
  b=EkcZeICiWq+YMWa2wrwnY0peXhi8SyJK2ZuQz0tqFeozdlGxfvHr36T/
   Q2fZ2/wsSYMQe+4rXAeoFLNA30F/f5kTnIqa4vM4k2N5MIRVjy4yJve7u
   d1NmMIidgBagXT17jvupt+Oe2DeNum25uYG54NZURbz3EubWuo7+tfBCs
   hlSsBsKHWuG+J6e10atttycKe9HQ84kN12zTY0vUxUQBuUEV/XoX6yKsB
   KYNspCX0A+4TlpGrjFmFDBHsttDDNgHCKRppbmqgHhLjlGanvt5OrR/PI
   QfBl6vyutTL4p7yYwKrwvOWT4hMh1p5lEgvVqn1r9dylv2OyF+7qcWt3R
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258595824"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="258595824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 15:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="502313173"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Mar 2022 15:21:36 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYbGS-0001TU-5r; Sun, 27 Mar 2022 22:21:36 +0000
Date: Mon, 28 Mar 2022 06:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15
 1113/5558] kernel/module.c:4789:6: warning: no previous prototype for
 function 'android_debug_for_each_module'
Message-ID: <202203280627.cOFGvbLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Prasad,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15
head:   4fa38f9405ba32011fe37e6e77bbbc770026b45d
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/5558] ANDROID: android: Create debug_symbols driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220328/202203280627.cOFGvbLV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/b2df67a932b5cbd6535de9f1a6e63004992ad014
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15
        git checkout b2df67a932b5cbd6535de9f1a6e63004992ad014
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/module.c:4789:6: warning: no previous prototype for function 'android_debug_for_each_module' [-Wmissing-prototypes]
   void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
        ^
   kernel/module.c:4789:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
   ^
   static 
   kernel/module.c:4809:6: warning: no previous prototype for function 'module_layout' [-Wmissing-prototypes]
   void module_layout(struct module *mod,
        ^
   kernel/module.c:4809:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void module_layout(struct module *mod,
   ^
   static 
   2 warnings generated.


vim +/android_debug_for_each_module +4789 kernel/module.c

  4787	
  4788	#ifdef CONFIG_ANDROID_DEBUG_SYMBOLS
> 4789	void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
  4790		void *data)
  4791	{
  4792		struct module *module;
  4793		preempt_disable();
  4794		list_for_each_entry_rcu(module, &modules, list) {
  4795			if (fn(module->name, module->core_layout.base, data))
  4796				goto out;
  4797		}
  4798	out:
  4799		preempt_enable();
  4800	}
  4801	EXPORT_SYMBOL_NS_GPL(android_debug_for_each_module, MINIDUMP);
  4802	#endif
  4803	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
