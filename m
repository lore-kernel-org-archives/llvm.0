Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872A1848;
	Sun, 12 Mar 2023 06:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678601115; x=1710137115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GqM9SJXNTvruDHAagcebGs0pNAHJ4/ouP1lpaieiGDM=;
  b=FS3ngrLTSpcb1zY+p5x+ZZ4ZzuN0NnJz/Dlu7S+8CIVcRV7PvAfYkQd6
   xTjnvtEK6IYj/NxC+I4AASFsN/FnS2iTmJ048K4Rc8TOzMtG62/RD7zGL
   rzfZC1uiePraAFqHZNUcXNdQCsN8vXSgVxSC6ydcBDRwTi+4yd/CE+yZz
   jG4+MpJQ5iYcY7Q/C9JwivFcOEZiCptBL3XtbvUKM63txQHNqqjuhfjQB
   bdExxU6i/yaKt5y9Q5Zz4g/RmJPGYgOD5d3CUFPg+WYbhLGnpp1DDoo3w
   0UgKOg5NmUfRgVGVuB0uHU05WUVCqP0NJIGi/r8X7RFLfLiAQ1MuCMtaJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364621812"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="364621812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 22:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="628264796"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="628264796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2023 22:05:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbEpU-00052J-2p;
	Sun, 12 Mar 2023 06:05:12 +0000
Date: Sun, 12 Mar 2023 14:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 5/6] ice: implement dpll interface to control cgu
Message-ID: <202303121331.swxKROtl-lkp@intel.com>
References: <20230312022807.278528-6-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-6-vadfed@meta.com>

Hi Vadim,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc1 next-20230310]
[cannot apply to tnguy-next-queue/dev-queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
patch link:    https://lore.kernel.org/r/20230312022807.278528-6-vadfed%40meta.com
patch subject: [PATCH RFC v6 5/6] ice: implement dpll interface to control cgu
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230312/202303121331.swxKROtl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c4acb622eb0fd3120fc9cdcaf33fddfa7da04a50
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
        git checkout c4acb622eb0fd3120fc9cdcaf33fddfa7da04a50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121331.swxKROtl-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/net/ethernet/intel/ice/ice_dpll.c:155:7: warning: variable 'pin_num' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (pin == pf->dplls.rclk.pin)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:161:18: note: uninitialized use occurs here
           for (i = 0; i < pin_num; i++)
                           ^~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:155:3: note: remove the 'if' if its condition is always true
                   if (pin == pf->dplls.rclk.pin)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:143:13: note: initialize the variable 'pin_num' to silence this warning
           int pin_num, i;
                      ^
                       = 0
>> drivers/net/ethernet/intel/ice/ice_dpll.c:412:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:416:6: note: uninitialized use occurs here
           if (ret)
               ^~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:412:9: note: remove the 'if' if its condition is always true
           } else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:407:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/net/ethernet/intel/ice/ice_dpll.c:449:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:453:6: note: uninitialized use occurs here
           if (ret)
               ^~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:449:9: note: remove the 'if' if its condition is always true
           } else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:444:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> drivers/net/ethernet/intel/ice/ice_dpll.c:478:1: warning: no previous prototype for function 'ice_dpll_pin_state_update' [-Wmissing-prototypes]
   ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
   ^
   drivers/net/ethernet/intel/ice/ice_dpll.c:477:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   drivers/net/ethernet/intel/ice/ice_dpll.c:499:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pin_type == ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:519:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:499:9: note: remove the 'if' if its condition is always true
           } else if (pin_type == ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_dpll.c:481:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   5 warnings generated.
--
   ERROR: modpost: "__divdi3" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_phy_rclk_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_cgu_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_clock_mux_present_e810t" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_get_cgu_rclk_pin_info" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_get_cgu_state" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_name" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_type" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_freq_mask" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
