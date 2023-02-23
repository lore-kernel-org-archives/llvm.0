Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDC2C9E;
	Thu, 23 Feb 2023 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677170350; x=1708706350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ku0/3I75k+SI3oFdVCzcRhcw+fhpwjDHzz5mSYtdhso=;
  b=T6pWnzzbMZeH33fZax08uZmx8IvfTCVcsMn44wbVkWYe963pR52Xjygn
   H9Ru1fdKZx9PNxmCllXgIOaSf+WBvLR3Xy2onynDhXM885RHF9JJMg8vL
   D+7femsb2FwwuUr4C+hv9P6wtPvLjDlh8BOP5xoZWfbmBpRT/yY86TtSq
   U/50bG+J2XI1WrDnIyzL9TOFb7eWksyuS1d80DfwUoKpUdUJmHwuII2ZG
   ++IvIMQdG8nw+RVCv3MkwOg42q2LYIxPsX/zq1ddt6tCNl1BHR6tHwKZo
   aqI0bPnlt4v6SmHXdjpOekAiHaW7VgrSbusawf0tDxOY2M4O6ag0pBRwM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335490130"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="335490130"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 08:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702845727"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="702845727"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 08:39:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVEce-0001Un-1x;
	Thu, 23 Feb 2023 16:39:08 +0000
Date: Fri, 24 Feb 2023 00:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v3 11/22] drm/i915/mtl: C20 port clock
 calculation
Message-ID: <202302240031.fM6Kbmbi-lkp@intel.com>
References: <20230223134021.2236889-12-mika.kahola@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223134021.2236889-12-mika.kahola@intel.com>

Hi Mika,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Initial-DDI-port-setup/20230223-214803
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230223134021.2236889-12-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH v3 11/22] drm/i915/mtl: C20 port clock calculation
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230224/202302240031.fM6Kbmbi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d475e7f151cc7d6a8eefba91da632680aaa84007
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mika-Kahola/drm-i915-mtl-Initial-DDI-port-setup/20230223-214803
        git checkout d475e7f151cc7d6a8eefba91da632680aaa84007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240031.fM6Kbmbi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:2159:13: warning: variable 'tx_clk_div' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pll_state->mplla[6] & C20_MPLLA_FRACEN) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2169:13: note: uninitialized use occurs here
                                    10 << (tx_clk_div + 16));
                                           ^~~~~~~~~~
   include/linux/math.h:103:24: note: expanded from macro 'DIV_ROUND_CLOSEST_ULL'
           typeof(divisor) __d = divisor;                  \
                                 ^~~~~~~
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2159:9: note: remove the 'if' if its condition is always true
           } else if (pll_state->mplla[6] & C20_MPLLA_FRACEN) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2151:37: note: initialize the variable 'tx_clk_div' to silence this warning
           unsigned int multiplier, tx_clk_div, refclk = 38400;
                                              ^
                                               = 0
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:2159:13: warning: variable 'multiplier' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (pll_state->mplla[6] & C20_MPLLA_FRACEN) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2167:52: note: uninitialized use occurs here
           return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(refclk, (multiplier << 16) + frac_quot) +
                                                             ^~~~~~~~~~
   include/linux/math.h:104:29: note: expanded from macro 'DIV_ROUND_CLOSEST_ULL'
           unsigned long long _tmp = (x) + (__d) / 2;      \
                                      ^
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2159:9: note: remove the 'if' if its condition is always true
           } else if (pll_state->mplla[6] & C20_MPLLA_FRACEN) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:2151:25: note: initialize the variable 'multiplier' to silence this warning
           unsigned int multiplier, tx_clk_div, refclk = 38400;
                                  ^
                                   = 0
   2 warnings generated.


vim +2159 drivers/gpu/drm/i915/display/intel_cx0_phy.c

  2146	
  2147	int intel_c20pll_calc_port_clock(struct intel_encoder *encoder,
  2148					 const struct intel_c20pll_state *pll_state)
  2149	{
  2150		unsigned int frac_quot = 0, frac_rem = 0, frac_den = 1;
  2151		unsigned int multiplier, tx_clk_div, refclk = 38400;
  2152	
  2153		if (pll_state->mpllb[6] & C20_MPLLB_FRACEN) {
  2154			frac_quot = pll_state->mpllb[8];
  2155			frac_rem =  pll_state->mpllb[9];
  2156			frac_den =  pll_state->mpllb[7];
  2157			multiplier = REG_FIELD_GET(C20_MULTIPLIER_MASK, pll_state->mpllb[0]);
  2158			tx_clk_div = REG_FIELD_GET(C20_MPLLB_TX_CLK_DIV_MASK, pll_state->mpllb[0]);
> 2159		} else if (pll_state->mplla[6] & C20_MPLLA_FRACEN) {
  2160			frac_quot = pll_state->mplla[8];
  2161			frac_rem =  pll_state->mplla[9];
  2162			frac_den =  pll_state->mplla[7];
  2163			multiplier = REG_FIELD_GET(C20_MULTIPLIER_MASK, pll_state->mplla[0]);
  2164			tx_clk_div = REG_FIELD_GET(C20_MPLLA_TX_CLK_DIV_MASK, pll_state->mplla[1]);
  2165	       }
  2166	
  2167		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(refclk, (multiplier << 16) + frac_quot) +
  2168		       DIV_ROUND_CLOSEST(refclk * frac_rem, frac_den),
  2169					 10 << (tx_clk_div + 16));
  2170	}
  2171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
