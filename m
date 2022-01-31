Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411A2CA2
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643611215; x=1675147215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x0TkqwpVmx+opy/tApw6xnnY5Y0YeOdcS+G8EYgC0Es=;
  b=EuvXorY1MAEEu8vFXdZH9RBbmXci3IQWxCyYKoNthMq19FoAao3qYCc7
   T8ON1WssRB8C5oY5buADaZ9SZA/AmvIsYRfAko5u4JTQsF90qfWVVo7fZ
   hQ9zF5Irl+WzEEZHE0+kPsqI2b8Dpdwc6Uld7us87TWu1Jq99/Lg37rzb
   xvrKvwnuicKZAb8nkaPCTnCEJBHlTMhoYgriFSIKkzjCvEQhLmbp/eu/b
   HdnbjWdJyJ9S8KYKNW8ejQIFljpE40C7RNwY1DEf3AyFF6C/YpuHvcnze
   pIz696XssVRsx3Zkuw/BcRU/u0EAF5yz4cF8V9IJTKmc/g/ZzhV4nt7ae
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="246243594"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="246243594"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 22:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="478977861"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2022 22:40:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEQMF-000RZy-BK; Mon, 31 Jan 2022 06:40:11 +0000
Date: Mon, 31 Jan 2022 14:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Roland Scheidegger <sroland@vmware.com>,
	Zack Rusin <zackr@vmware.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/1] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <202201311423.sZVV3fVK-lkp@intel.com>
References: <20220130193723.2923-2-15330273260@189.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130193723.2923-2-15330273260@189.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220131-043734
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r016-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311423.sZVV3fVK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/219048b8904ab97749c0bc3ea426b858d9562de0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driver-for-loongson-display-controller/20220131-043734
        git checkout 219048b8904ab97749c0bc3ea426b858d9562de0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/lsdc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/lsdc/lsdc_drv.c:581:55: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
           drm_info(ddev, "vram start: 0x%llx, size: %lluMB\n", base, size >> 20);
                                         ~~~~                   ^~~~
                                         %x
   include/drm/drm_print.h:429:36: note: expanded from macro 'drm_info'
           __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
                                      ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:425:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_drv.c:581:61: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
           drm_info(ddev, "vram start: 0x%llx, size: %lluMB\n", base, size >> 20);
                                                     ~~~~             ^~~~~~~~~~
                                                     %u
   include/drm/drm_print.h:429:36: note: expanded from macro 'drm_info'
           __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
                                      ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:425:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   2 warnings generated.
--
>> drivers/gpu/drm/lsdc/lsdc_pll.c:395:12: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
           u64 val = readq(reg);
                     ^
>> drivers/gpu/drm/lsdc/lsdc_pll.c:402:2: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
           writeq(val, reg);
           ^
>> drivers/gpu/drm/lsdc/lsdc_pll.c:404:24: warning: shift count >= width of type [-Wshift-count-overflow]
           val = (1L << 7) | (1L << 42) | (3L << 10);   /* allow L1 PLL locked */
                                 ^  ~~
   drivers/gpu/drm/lsdc/lsdc_pll.c:405:37: warning: shift count >= width of type [-Wshift-count-overflow]
           val |= (unsigned long)param->loopc << 32;    /* set loopc   */
                                              ^  ~~
   drivers/gpu/drm/lsdc/lsdc_pll.c:439:8: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
           val = readq(reg);
                 ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:441:2: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
           writeq(val, reg);
           ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:499:20: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
                   parms.qword[0] = readq(this->mmio);
                                    ^
   drivers/gpu/drm/lsdc/lsdc_pll.c:504:20: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-function-declaration]
                   parms.qword[0] = readq(this->mmio);
                                    ^
   2 warnings and 6 errors generated.


vim +/readq +395 drivers/gpu/drm/lsdc/lsdc_pll.c

   386	
   387	
   388	/*
   389	 * the PIX PLL be software configurable when SYS_CLKSEL[1:0] is 10b
   390	 */
   391	static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
   392				const struct lsdc_pll_core_values * const param)
   393	{
   394		void __iomem *reg = this->mmio;
 > 395		u64 val = readq(reg);
   396		bool locked;
   397		unsigned int counter = 0;
   398	
   399		val &= ~(1 << 0);    /* Bypass the PLL, using refclk directly */
   400		val |= (1 << 19);    /* powerdown the PLL */
   401		val &= ~(1 << 2);    /* don't use the software configure param */
 > 402		writeq(val, reg);
   403	
 > 404		val = (1L << 7) | (1L << 42) | (3L << 10);   /* allow L1 PLL locked */
   405		val |= (unsigned long)param->loopc << 32;    /* set loopc   */
   406		val |= (unsigned long)param->div_ref << 26;  /* set div_ref */
   407		writeq(val, reg);
   408		writeq(param->div_out, reg + 8);             /* set div_out */
   409	
   410		val = readq(reg);
   411		val |= (1 << 2);     /* use the software configure param */
   412		val &= ~(1 << 19);   /* powerup the PLL */
   413		writeq(val, reg);
   414	
   415		/* wait pll setup and locked */
   416		do {
   417			val = readl(reg);
   418			locked = val & 0x10000;
   419			counter++;
   420		} while (locked == false);
   421	
   422		drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
   423	
   424		val = readq(reg);
   425		val |= (1 << 0);    /* switch to the software configured pll */
   426		writeq(val, reg);
   427	
   428		return 0;
   429	}
   430	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
