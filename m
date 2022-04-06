Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428F17EC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649232596; x=1680768596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5K79mEV1CCFIReve/kwqvRwazn/Jt0n+JFw0qbdoN0=;
  b=gbRJZBA86ObU2s1siG5jnSSzjCbIudB+sqMZ5hBW1ItCJ7KnkeRel3t7
   jipTvNU3YGrciUN1i+Ngu7gkzmeSBtLhRH3NIpIKNioiI5kcTVnnDqrvu
   kzHFxEdRedH0eW+q9/xQX6DuBbn0dZZsSvuF1u8OlKeVNKf8ZnE5M9jv5
   i+6UESBWFQB9T3n1yyLJtbQ6sYSrKMiqwegZyED5ZTZ1zVpLE8vLu/6sc
   IxsMGT7CWfCugy6nr2TDjoJ6gdbitMt7dDFTUWGWBrnVFTtTNywLM3nUb
   nVp3BTDRSPpel8YJHRwkjCxb8KWiwFmnPfdoYndHwja4ztmHg/bHad7xH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="243122354"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="243122354"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 01:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="524370488"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2022 01:09:54 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nc0jh-0004Cf-Dn;
	Wed, 06 Apr 2022 08:09:53 +0000
Date: Wed, 6 Apr 2022 16:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v5.18-rc1 18/21]
 drivers/input/misc/isa1200.c:171:6: warning: no previous prototype for
 function 'isa1200_start'
Message-ID: <202204061654.b8z1eMrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v5.18-rc1
head:   7d27ddbe075c07508ab045a63d23aeca798514ee
commit: 0baaba96c1a1116b9fc698a263657cb9b6ab8198 [18/21] Input: isa1200 - new driver for Immersion ISA1200
config: hexagon-randconfig-r025-20220406 (https://download.01.org/0day-ci/archive/20220406/202204061654.b8z1eMrm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=0baaba96c1a1116b9fc698a263657cb9b6ab8198
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-janice-v5.18-rc1
        git checkout 0baaba96c1a1116b9fc698a263657cb9b6ab8198
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/input/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/misc/isa1200.c:171:6: warning: no previous prototype for function 'isa1200_start' [-Wmissing-prototypes]
   void isa1200_start(struct isa1200 *isa)
        ^
   drivers/input/misc/isa1200.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void isa1200_start(struct isa1200 *isa)
   ^
   static 
>> drivers/input/misc/isa1200.c:228:6: warning: no previous prototype for function 'isa1200_stop' [-Wmissing-prototypes]
   void isa1200_stop(struct isa1200 *isa)
        ^
   drivers/input/misc/isa1200.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void isa1200_stop(struct isa1200 *isa)
   ^
   static 
   2 warnings generated.


vim +/isa1200_start +171 drivers/input/misc/isa1200.c

   170	
 > 171	void isa1200_start(struct isa1200 *isa)
   172	{
   173		const struct isa1200_config *cfg = isa->conf;
   174		u8 hctrl0;
   175		u8 hctrl1;
   176		u8 hctrl3;
   177	
   178		clk_prepare_enable(isa->clk);
   179		gpiod_set_value(isa->hen, 1);
   180		gpiod_set_value(isa->len, 1);
   181	
   182		udelay(200);
   183	
   184		regmap_write(isa->map, ISA1200_SCTRL, cfg->ldo_voltage);
   185	
   186		if (!cfg->pwm_in) {
   187			hctrl0 = ISA1200_HCTRL0_PWM_GEN_MODE;
   188			hctrl1 = ISA1200_HCTRL1_EXT_CLOCK;
   189		} else {
   190			hctrl0 = ISA1200_HCTRL0_PWM_INPUT_MODE;
   191			hctrl1 = 0;
   192		}
   193		hctrl0 |= cfg->clkdiv;
   194		hctrl1 |= ISA1200_HCTRL1_DAC_INVERT;
   195		if (cfg->erm)
   196			hctrl1 |= ISA1200_HCTRL1_ERM;
   197	
   198		regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
   199		regmap_write(isa->map, ISA1200_HCTRL1, hctrl1);
   200	
   201		/* Make sure to de-assert software reset */
   202		regmap_write(isa->map, ISA1200_HCTRL2, 0x00);
   203	
   204		/* PLL divisor */
   205		hctrl3 = ISA1200_HCTRL3_DEFAULT;
   206		hctrl3 |= (cfg->plldiv << ISA1200_HCTRL3_PLLDIV_SHIFT);
   207		regmap_write(isa->map, ISA1200_HCTRL3, hctrl3);
   208	
   209		/* Frequency */
   210		regmap_write(isa->map, ISA1200_HCTRL4, cfg->freq);
   211		/* Duty cycle */
   212		regmap_write(isa->map, ISA1200_HCTRL5, cfg->duty);
   213		/* Period */
   214		regmap_write(isa->map, ISA1200_HCTRL6, cfg->period);
   215	
   216		/* Turn on PWM generation in BIT(7) */
   217		hctrl0 |= ISA1200_HCTRL0_PWM_GEN_ENABLE;
   218		regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
   219	
   220		/*
   221		 * This is done in the vendor tree with the commment
   222		 * "Duty 0x64 == nForce 90", and no force feedback happens
   223		 * unless we do this.
   224		 */
   225		regmap_write(isa->map, ISA1200_HCTRL5, 0x64);
   226	}
   227	
 > 228	void isa1200_stop(struct isa1200 *isa)
   229	{
   230		regmap_write(isa->map, ISA1200_HCTRL0, 0);
   231		gpiod_set_value(isa->len, 0);
   232		gpiod_set_value(isa->hen, 0);
   233		clk_disable_unprepare(isa->clk);
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
