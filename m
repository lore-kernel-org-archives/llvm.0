Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14202C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641461419; x=1672997419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8I0J4izNXxXkIN6vEUQC3vPe1VVLMTNagn0bV6wM8o=;
  b=Wl75TBuQOXi7dhKjyOFowCRpAtyoV0AfUVS4dipqDA6qtG4BfLOpyyMl
   wvNG8vETdKA+ZBdQq8ml7rXQ6v2/5RwbygYuBMuCVeBJuMiqgHvo8n/zu
   S7Dq0MFJElu15F978pYdcZK2tuhj4fttFGrdV47TOsIPc/5WUkGS+1DEW
   ZI8Il5xoxleOFJtA8j8v64mk7xbl5XS0TPtxBE0FxB5gvdG79NevKbKFZ
   iHZMWIUmIHCdJynCytqExT4Cw/7VLcq9fGduHGPAdDuDRxbRvDUCxDqqc
   Fm7yl8gLYcL/FNlwrMiCptJk95u+SnniDjmuxHIg9ZqsUfdEqIVzWNWCC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229439009"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="229439009"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 01:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="488884424"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 01:30:11 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5P62-000HX7-Sx; Thu, 06 Jan 2022 09:30:10 +0000
Date: Thu, 6 Jan 2022 17:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15
 1113/2496] kernel/module.c:4789:6: warning: no previous prototype for
 function 'android_debug_for_each_module'
Message-ID: <202201061725.15rSGzxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15
head:   f8bd6cf70dec3961c8b15b987866af33be2ce82b
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/2496] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-a006-20220106 (https://download.01.org/0day-ci/archive/20220106/202201061725.15rSGzxq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/b2df67a932b5cbd6535de9f1a6e63004992ad014
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15
        git checkout b2df67a932b5cbd6535de9f1a6e63004992ad014
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

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
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on HAS_IOMEM && DRM
   Selected by
   - GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on HAS_IOMEM && DRM
   Selected by
   - GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on SOUND && !UML && SND && SND_JACK
   Selected by
   - GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on HAS_IOMEM && DRM
   Selected by
   - GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on SOUND && !UML && SND
   Selected by
   - GKI_HIDDEN_SND_CONFIGS && ACPI


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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
