Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F106F2F25
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643768368; x=1675304368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E28kCt+OZeErpyk5GHPOGbi+QPQ0zNns5TgklhKxG+I=;
  b=hZUf0S9FatJf77egwY18BBZzPw/olsOPc2JjoR4cJJbFEsFrSVGjXrTO
   Kv3sxp2CKcuURYenQor/9DJ5yiOwp6QaxF+01BlBdmWVt0lYPmdxwPruM
   +Cw1f0w4HjxnFHHBFTXMUHFyN6szIfI2cBZwnKWZ/MlHGHJoDrZ3v91ra
   U59H1TmyqIPb4Doh8vy7IAMUfl0NtywFjnGLqH5e2OputYX/Lf48l834C
   xh6aB7rEVny7hvkztLfrYE+wlmQYXzuKNS3jYVCG8UoOaKd+TrXPVG5lw
   SduAfK8x2hiwYo4chO6USDPqa3GqOkcbHYDjg0cEQdQMGpdwMfaYIfinY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311147207"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="311147207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 18:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="771311311"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2022 18:19:24 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF5Ex-000TzC-G7; Wed, 02 Feb 2022 02:19:23 +0000
Date: Wed, 2 Feb 2022 10:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Dan Carpenter <error27@gmail.com>,
	Sam <Ravnborgsam@ravnborg.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Roland Scheidegger <sroland@vmware.com>,
	Zack Rusin <zackr@vmware.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <202202021046.VCIJuXWN-lkp@intel.com>
References: <20220201154821.3058-2-15330273260@189.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201154821.3058-2-15330273260@189.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on robh/for-next drm-intel/for-linux-next drm-tip/drm-tip v5.17-rc2 next-20220201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220201-234916
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r005-20220130 (https://download.01.org/0day-ci/archive/20220202/202202021046.VCIJuXWN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/c285d3ad507c42cbed4a71aa0974b2183f7d02ad
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220201-234916
        git checkout c285d3ad507c42cbed4a71aa0974b2183f7d02ad
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/lsdc/ drivers/gpu/drm/msm/ drivers/gpu/drm/sprd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/lsdc/lsdc_pll.c:399:12: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
           u64 val = readq(reg);
                     ^
>> drivers/gpu/drm/lsdc/lsdc_pll.c:405:2: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
           writeq(val, reg);
           ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:450:8: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
           val = readq(reg);
                 ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:452:2: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
           writeq(val, reg);
           ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:509:20: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
                   parms.qword[0] = readq(this->mmio);
                                    ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:513:20: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
                   parms.qword[0] = readq(this->mmio);
                                    ^
   6 errors generated.


vim +/readq +399 drivers/gpu/drm/lsdc/lsdc_pll.c

   384	
   385	
   386	/*
   387	 * Update the pll parameters to hardware, target to the pixpll in ls2k1000
   388	 *
   389	 * @this: point to the object which calling this function
   390	 * @param: pointer to where the parameters passed in
   391	 *
   392	 *  Return true if a parameter is found, otherwise return false.
   393	 */
   394	static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
   395				const struct lsdc_pll_core_values * const param)
   396	{
   397		void __iomem *reg = this->mmio;
   398		unsigned int counter = 0;
 > 399		u64 val = readq(reg);
   400		bool locked;
   401	
   402		val &= ~(1 << 0);    /* Bypass the PLL, using refclk directly */
   403		val |= (1 << 19);    /* powerdown the PLL */
   404		val &= ~(1 << 2);    /* don't use the software configure param */
 > 405		writeq(val, reg);
   406	
   407		val = (1L << 7) | (1ULL << 42) | (3L << 10);   /* allow L1 PLL locked */
   408		val |= (u64)param->loopc << 32;    /* set loopc   */
   409		val |= (u64)param->div_ref << 26;  /* set div_ref */
   410		writeq(val, reg);
   411		writeq(param->div_out, reg + 8);   /* set div_out */
   412	
   413		val = readq(reg);
   414		val |= (1 << 2);     /* use the software configure param */
   415		val &= ~(1 << 19);   /* powerup the PLL */
   416		writeq(val, reg);
   417	
   418		/* wait pll setup and locked */
   419		do {
   420			val = readl(reg);
   421			locked = val & 0x10000;
   422			counter++;
   423		} while (locked == false);
   424	
   425		drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
   426	
   427		val = readq(reg);
   428		val |= (1 << 0);    /* switch to the software configured pll */
   429		writeq(val, reg);
   430	
   431		return 0;
   432	}
   433	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
