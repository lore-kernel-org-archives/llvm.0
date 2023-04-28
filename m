Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8923A4;
	Fri, 28 Apr 2023 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682669978; x=1714205978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dcZgewPwrSPmsLdZR4E15639TTsYN4j0rB9eKfZUsjU=;
  b=GzC0m+lVmSxoOj4oLCq68nIhZ5OxsXyVKk9N3HcvzWrSzH73ar3DfxJ0
   tg5IbyPMc2zv8ZLICTCT5q8NpOkAZzH3Gjf2J5aG9SwgJg9iC9T3eQYGn
   UxJQn/mm0sgszwyKYjwQ0hIxadDxwJQ1buQvrr6HyqwbGtyrUSUFn2qRW
   QIYciOwEeP+VyxspWo5HOubBuWjVEnXA3auy4u2fo9CI5/r8J3hQbNsgm
   HNrlLO/2qW0AQR04GpUbBxSNP70Y0Nw6PzqY0tX1R16OC23kYPCeIEpSx
   E1Tx62trj3u57FyQCwvqKTcIopRSw1xMaUjxYlzi3RRBHRMNQX/ceMV2G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410774330"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="410774330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 01:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697448855"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="697448855"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2023 01:19:27 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psJKA-0000Ip-1v;
	Fri, 28 Apr 2023 08:19:26 +0000
Date: Fri, 28 Apr 2023 16:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
Message-ID: <202304281647.9vCSasdW-lkp@intel.com>
References: <20230428002009.2948020-6-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-6-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-6-vadfed%40meta.com
patch subject: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230428/202304281647.9vCSasdW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/08659ac96f7a68ef1966cf8784cfcfbe8cc96370
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 08659ac96f7a68ef1966cf8784cfcfbe8cc96370
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281647.9vCSasdW-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/net/ethernet/intel/ice/ice_dpll.c:156:7: warning: variable 'pin_num' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
if (pin == pf->dplls.rclk.pin)
^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:162:18: note: uninitialized use occurs here
for (i = 0; i < pin_num; i++)
^~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:156:3: note: remove the 'if' if its condition is always true
if (pin == pf->dplls.rclk.pin)
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:144:13: note: initialize the variable 'pin_num' to silence this warning
int pin_num, i;
^
= 0
>> drivers/net/ethernet/intel/ice/ice_dpll.c:419:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
} else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:423:6: note: uninitialized use occurs here
if (ret)
^~~
drivers/net/ethernet/intel/ice/ice_dpll.c:419:9: note: remove the 'if' if its condition is always true
} else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:414:9: note: initialize the variable 'ret' to silence this warning
int ret;
^
= 0
drivers/net/ethernet/intel/ice/ice_dpll.c:456:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
} else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:460:6: note: uninitialized use occurs here
if (ret)
^~~
drivers/net/ethernet/intel/ice/ice_dpll.c:456:9: note: remove the 'if' if its condition is always true
} else if (pin_type == ICE_DPLL_PIN_TYPE_OUTPUT) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:451:9: note: initialize the variable 'ret' to silence this warning
int ret;
^
= 0
>> drivers/net/ethernet/intel/ice/ice_dpll.c:486:1: warning: no previous prototype for function 'ice_dpll_pin_state_update' [-Wmissing-prototypes]
ice_dpll_pin_state_update(struct ice_pf *pf, struct ice_dpll_pin *pin,
^
drivers/net/ethernet/intel/ice/ice_dpll.c:485:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int
^
static
drivers/net/ethernet/intel/ice/ice_dpll.c:525:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
} else if (pin_type == ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:545:9: note: uninitialized use occurs here
return ret;
^~~
drivers/net/ethernet/intel/ice/ice_dpll.c:525:9: note: remove the 'if' if its condition is always true
} else if (pin_type == ICE_DPLL_PIN_TYPE_RCLK_SOURCE) {
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/intel/ice/ice_dpll.c:489:9: note: initialize the variable 'ret' to silence this warning
int ret;
^
= 0
>> drivers/net/ethernet/intel/ice/ice_dpll.c:1487:45: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
if (d->dpll_state == ICE_CGU_STATE_LOCKED &&
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
6 warnings generated.
--
>> ERROR: modpost: "__divdi3" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_phy_rclk_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_cgu_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_clock_mux_present_e810t" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_get_cgu_rclk_pin_info" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_get_cgu_state" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_name" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_type" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_cgu_get_pin_freq_supp" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
