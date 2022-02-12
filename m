Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D27D
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644698421; x=1676234421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wp+6vwA3fO6erelf9olBJE88JqnOrXHPDMMrhtgssV0=;
  b=Y1ey8DDGoSXn7EfVd4PaZjOZ4TGQO05My5heNPMrsQMgkcGIznYlFC4J
   LhUg+zpwuR77sLS49TLD88FlmK3BIq8nviVVnQL+Z8S8ZhcLXuL/3WrUP
   Ci6UP3GTcUtkMO4qIWfUZzZOWO4cN3tmC1T/efIGpMlhz7t9Jdi0vPxoH
   +csB5+/T+yuPBbV2KoTR2obD3qrd4Qh6o2AvJAhuUGfwLoPJfKECum5Oc
   Cil+OeVU+G7wtHB65BmFnfA+1nenBaXZOG0BhjPJCD4wdo+VtNc1u4CSm
   aC5EjnQFJlKuNKW0kz4mkpvUpAcHF7ajKPYBk29F1OM4/S9dxB54CTfzD
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="336326425"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="336326425"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 12:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="702467290"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Feb 2022 12:40:18 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIzBp-0006d0-H4; Sat, 12 Feb 2022 20:40:17 +0000
Date: Sun, 13 Feb 2022 04:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kalle Valo <kvalo@kernel.org>,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [linux-next:master 3193/5417]
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:2228:24: error: implicit
 declaration of function 'rfkill_soft_blocked'
Message-ID: <202202130409.S6QHJomb-lkp@intel.com>
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
head:   6d9bd4ad4ca08b1114e814c2c42383b8b13be631
commit: 7cf800f46e07e6b75a43036c4389d6ca717fd017 [3193/5417] iwlwifi: mvm: don't feed the hardware RFKILL into iwlmei
config: riscv-randconfig-r042-20220213 (https://download.01.org/0day-ci/archive/20220213/202202130409.S6QHJomb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7cf800f46e07e6b75a43036c4389d6ca717fd017
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7cf800f46e07e6b75a43036c4389d6ca717fd017
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/fw.c:19:
>> drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:2228:24: error: implicit declaration of function 'rfkill_soft_blocked' [-Werror,-Wimplicit-function-declaration]
                   mvm->hw_registered ? rfkill_soft_blocked(mvm->hw->wiphy->rfkill) : false;
                                        ^
   drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:2228:24: note: did you mean 'rfkill_blocked'?
   include/linux/rfkill.h:306:20: note: 'rfkill_blocked' declared here
   static inline bool rfkill_blocked(struct rfkill *rfkill)
                      ^
   1 error generated.
--
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:9:
>> drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:2228:24: error: implicit declaration of function 'rfkill_soft_blocked' [-Werror,-Wimplicit-function-declaration]
                   mvm->hw_registered ? rfkill_soft_blocked(mvm->hw->wiphy->rfkill) : false;
                                        ^
   drivers/net/wireless/intel/iwlwifi/mvm/mvm.h:2228:24: note: did you mean 'rfkill_blocked'?
   include/linux/rfkill.h:306:20: note: 'rfkill_blocked' declared here
   static inline bool rfkill_blocked(struct rfkill *rfkill)
                      ^
   drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1109:47: warning: format specifies type 'unsigned char' but the argument has type 's16' (aka 'short') [-Wformat]
           IWL_DEBUG_INFO(mvm, "\tburst index: %hhu\n", res->ftm.burst_index);
                                               ~~~~     ^~~~~~~~~~~~~~~~~~~~
                                               %hd
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:175:68: note: expanded from macro 'IWL_DEBUG_INFO'
   #define IWL_DEBUG_INFO(p, f, a...)      IWL_DEBUG(p, IWL_DL_INFO, f, ## a)
                                                                     ~     ^
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:94:49: note: expanded from macro 'IWL_DEBUG'
           __IWL_DEBUG_DEV((m)->dev, level, false, fmt, ##args)
                                                   ~~~    ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:91:49: note: expanded from macro '__IWL_DEBUG_DEV'
                   __iwl_dbg(dev, level, limit, __func__, fmt, ##args);    \
                                                          ~~~    ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1112:47: warning: format specifies type 'unsigned char' but the argument has type 's32' (aka 'int') [-Wformat]
           IWL_DEBUG_INFO(mvm, "\trssi spread: %hhu\n", res->ftm.rssi_spread);
                                               ~~~~     ^~~~~~~~~~~~~~~~~~~~
                                               %d
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:175:68: note: expanded from macro 'IWL_DEBUG_INFO'
   #define IWL_DEBUG_INFO(p, f, a...)      IWL_DEBUG(p, IWL_DL_INFO, f, ## a)
                                                                     ~     ^
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:94:49: note: expanded from macro 'IWL_DEBUG'
           __IWL_DEBUG_DEV((m)->dev, level, false, fmt, ##args)
                                                   ~~~    ^~~~
   drivers/net/wireless/intel/iwlwifi/mvm/../iwl-debug.h:91:49: note: expanded from macro '__IWL_DEBUG_DEV'
                   __iwl_dbg(dev, level, limit, __func__, fmt, ##args);    \
                                                          ~~~    ^~~~
   2 warnings and 1 error generated.


vim +/rfkill_soft_blocked +2228 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h

  2224	
  2225	static inline void iwl_mvm_mei_set_sw_rfkill_state(struct iwl_mvm *mvm)
  2226	{
  2227		bool sw_rfkill =
> 2228			mvm->hw_registered ? rfkill_soft_blocked(mvm->hw->wiphy->rfkill) : false;
  2229	
  2230		if (mvm->mei_registered)
  2231			iwl_mei_set_rfkill_state(iwl_mvm_is_radio_killed(mvm),
  2232						 sw_rfkill);
  2233	}
  2234	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
