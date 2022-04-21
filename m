Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C81FCD
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650564153; x=1682100153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+AdcSDTJ9BqO5L8K2PefeVi7JU8dKRkGs1Rx00xlAw4=;
  b=JczqUmUnzCkLeq148Iu5ti2ImxadOPYttOMeByse4I4C78e1KU9R3Chb
   /JOuJrkUf5lAP50CGCM7OF16AqQ3S5viqD7yYVgrsZK4rdLMe1qPBcBUX
   hcgOTxsaSdwX1/IpPmBWbf94jbQBnGAsl1ivsXoUboKz5ms8IZigJOLOS
   ZU1G6WI4l3CSE5pAbhQrCqxqTF9N62+JP+hrXFZLoNq7FyxBW7hSTgfzx
   qtRo3avJnRJErs3xbuH+AN8/oJZnXNrl12A3LM5t7IUJ9T22ureo2RqUx
   D4f90+OcdTqNwsG7GHeIfbY5GOefjbB5+i75pxTYmQzjvpiGQmYpo8w6c
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246334997"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="246334997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 11:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="648241915"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2022 11:02:30 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhb8P-0008dt-Io;
	Thu, 21 Apr 2022 18:02:29 +0000
Date: Fri, 22 Apr 2022 02:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 3076/5321] drivers/clk/bcm/clk-bcm2835.c:943:6:
 warning: variable 'rem' set but not used
Message-ID: <202204220101.mldVB7z8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   1052f9bce62982023737a95b7ff1ad26a5149af6
commit: b9c2343373f6bf19358db4e50197f5b3a17831db [3076/5321] clk: bcm-2835: Remove rounding up the dividers
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20220422/202204220101.mldVB7z8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b9c2343373f6bf19358db4e50197f5b3a17831db
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout b9c2343373f6bf19358db4e50197f5b3a17831db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/bcm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/bcm/clk-bcm2835.c:943:6: warning: variable 'rem' set but not used [-Wunused-but-set-variable]
           u64 rem;
               ^
   1 warning generated.


vim +/rem +943 drivers/clk/bcm/clk-bcm2835.c

41691b8862e2a3 Eric Anholt   2015-10-08  933  
41691b8862e2a3 Eric Anholt   2015-10-08  934  static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
41691b8862e2a3 Eric Anholt   2015-10-08  935  				    unsigned long rate,
b9c2343373f6bf Maxime Ripard 2021-09-22  936  				    unsigned long parent_rate)
41691b8862e2a3 Eric Anholt   2015-10-08  937  {
41691b8862e2a3 Eric Anholt   2015-10-08  938  	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
41691b8862e2a3 Eric Anholt   2015-10-08  939  	const struct bcm2835_clock_data *data = clock->data;
9c95b32ca09364 Remi Pommarel 2015-12-06  940  	u32 unused_frac_mask =
9c95b32ca09364 Remi Pommarel 2015-12-06  941  		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
41691b8862e2a3 Eric Anholt   2015-10-08  942  	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
9c95b32ca09364 Remi Pommarel 2015-12-06 @943  	u64 rem;
959ca92a3235fc Martin Sperl  2016-02-29  944  	u32 div, mindiv, maxdiv;
41691b8862e2a3 Eric Anholt   2015-10-08  945  
9c95b32ca09364 Remi Pommarel 2015-12-06  946  	rem = do_div(temp, rate);
41691b8862e2a3 Eric Anholt   2015-10-08  947  	div = temp;
41691b8862e2a3 Eric Anholt   2015-10-08  948  	div &= ~unused_frac_mask;
41691b8862e2a3 Eric Anholt   2015-10-08  949  
959ca92a3235fc Martin Sperl  2016-02-29  950  	/* different clamping limits apply for a mash clock */
959ca92a3235fc Martin Sperl  2016-02-29  951  	if (data->is_mash_clock) {
959ca92a3235fc Martin Sperl  2016-02-29  952  		/* clamp to min divider of 2 */
959ca92a3235fc Martin Sperl  2016-02-29  953  		mindiv = 2 << CM_DIV_FRAC_BITS;
959ca92a3235fc Martin Sperl  2016-02-29  954  		/* clamp to the highest possible integer divider */
959ca92a3235fc Martin Sperl  2016-02-29  955  		maxdiv = (BIT(data->int_bits) - 1) << CM_DIV_FRAC_BITS;
959ca92a3235fc Martin Sperl  2016-02-29  956  	} else {
997f16bd5d2e9b Martin Sperl  2016-02-29  957  		/* clamp to min divider of 1 */
959ca92a3235fc Martin Sperl  2016-02-29  958  		mindiv = 1 << CM_DIV_FRAC_BITS;
997f16bd5d2e9b Martin Sperl  2016-02-29  959  		/* clamp to the highest possible fractional divider */
959ca92a3235fc Martin Sperl  2016-02-29  960  		maxdiv = GENMASK(data->int_bits + CM_DIV_FRAC_BITS - 1,
959ca92a3235fc Martin Sperl  2016-02-29  961  				 CM_DIV_FRAC_BITS - data->frac_bits);
959ca92a3235fc Martin Sperl  2016-02-29  962  	}
959ca92a3235fc Martin Sperl  2016-02-29  963  
959ca92a3235fc Martin Sperl  2016-02-29  964  	/* apply the clamping  limits */
959ca92a3235fc Martin Sperl  2016-02-29  965  	div = max_t(u32, div, mindiv);
959ca92a3235fc Martin Sperl  2016-02-29  966  	div = min_t(u32, div, maxdiv);
41691b8862e2a3 Eric Anholt   2015-10-08  967  
41691b8862e2a3 Eric Anholt   2015-10-08  968  	return div;
41691b8862e2a3 Eric Anholt   2015-10-08  969  }
41691b8862e2a3 Eric Anholt   2015-10-08  970  

:::::: The code at line 943 was first introduced by commit
:::::: 9c95b32ca09364e4687b72c4e17b78dc1c420026 clk: bcm2835: add a round up ability to the clock divisor

:::::: TO: Remi Pommarel <repk@triplefau.lt>
:::::: CC: Michael Turquette <mturquette@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
