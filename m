Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450E1B69
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645001253; x=1676537253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jU7IgOo1J60Xh+g2FKZz7jx7XsfEo3Y3rV5M/9NqOjo=;
  b=HHSkZUTt/rQL727zM2CgMhkLJykVLj9G8EgLO8kaj9GoPFJZvNyHVLG6
   ZsVkMaJ1ofai0N5VGdS0ey2ZetCL/7+C2+sWDjvkkyMaSfQnQbhaWCvIM
   to9x8lrX482DlfiyUN4VZBBu7g7ZQ/YdAfnDEDcSuI66Eqi27ZE3vtHkA
   xaSyoLBOwlQXQg8AXlXgIdfNevP+KQLqYb77BShILEX9KLXVwk8VEttQf
   +Biq2RcQIUBXROD1tl0xJD0rMmAaxFFiwufqpszjphsp+9gXKvgZsP60v
   3kaF4E6zPydz24GzBTsaRP2SKEOd888Qo8C5mFGFnP+4qeRPZtv6RKF4O
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="234093774"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="234093774"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 00:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="539908050"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Feb 2022 00:47:31 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKFyE-000Acw-Gl; Wed, 16 Feb 2022 08:47:30 +0000
Date: Wed, 16 Feb 2022 16:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3838/5952] drivers/gpu/drm/vc4/vc4_hdmi.c:196:7:
 error: implicit declaration of function 'gpiod_get_value_cansleep'
Message-ID: <202202161638.Q6uhVami-lkp@intel.com>
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
head:   b593b8979eac3f6255401663fa42f3473b8f6cb1
commit: 44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f [3838/5952] ASoC: simple-amplifier: Remove spurious gpiolib select
config: s390-randconfig-r032-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161638.Q6uhVami-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/vc4/ sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:34:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:18:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:34:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:18:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:34:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:31:
   In file included from include/linux/fb.h:18:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:196:7: error: implicit declaration of function 'gpiod_get_value_cansleep' [-Werror,-Wimplicit-function-declaration]
                   if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
                       ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:196:7: note: did you mean 'gpio_get_value_cansleep'?
   include/linux/gpio.h:181:19: note: 'gpio_get_value_cansleep' declared here
   static inline int gpio_get_value_cansleep(unsigned gpio)
                     ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2529:23: error: implicit declaration of function 'devm_gpiod_get_optional' [-Werror,-Wimplicit-function-declaration]
           vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
                                ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:2529:23: note: did you mean 'devm_clk_get_optional'?
   include/linux/clk.h:470:13: note: 'devm_clk_get_optional' declared here
   struct clk *devm_clk_get_optional(struct device *dev, const char *id);
               ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2529:59: error: use of undeclared identifier 'GPIOD_IN'
           vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
                                                                    ^
   12 warnings and 3 errors generated.
--
   In file included from sound/soc/codecs/tlv320adc3xxx.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/soc/codecs/tlv320adc3xxx.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/soc/codecs/tlv320adc3xxx.c:19:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> sound/soc/codecs/tlv320adc3xxx.c:1209:21: error: implicit declaration of function 'devm_gpiod_get' [-Werror,-Wimplicit-function-declaration]
           adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
                              ^
   sound/soc/codecs/tlv320adc3xxx.c:1209:21: note: did you mean 'devm_gpio_free'?
   include/linux/gpio.h:243:20: note: 'devm_gpio_free' declared here
   static inline void devm_gpio_free(struct device *dev, unsigned int gpio)
                      ^
>> sound/soc/codecs/tlv320adc3xxx.c:1209:50: error: use of undeclared identifier 'GPIOD_OUT_LOW'
           adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
                                                           ^
>> sound/soc/codecs/tlv320adc3xxx.c:1257:2: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror,-Wimplicit-function-declaration]
           gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);
           ^
   sound/soc/codecs/tlv320adc3xxx.c:1257:2: note: did you mean 'gpio_set_value_cansleep'?
   include/linux/gpio.h:188:20: note: 'gpio_set_value_cansleep' declared here
   static inline void gpio_set_value_cansleep(unsigned gpio, int value)
                      ^
   12 warnings and 3 errors generated.


vim +/gpiod_get_value_cansleep +196 drivers/gpu/drm/vc4/vc4_hdmi.c

b7551457c5d0b3 Maxime Ripard 2021-10-25  184  
c8b75bca92cbf0 Eric Anholt   2015-03-02  185  static enum drm_connector_status
c8b75bca92cbf0 Eric Anholt   2015-03-02  186  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
c8b75bca92cbf0 Eric Anholt   2015-03-02  187  {
5dfbcae63f1098 Maxime Ripard 2020-09-03  188  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
4d8602b8ec16f5 Dom Cobley    2021-01-11  189  	bool connected = false;
c8b75bca92cbf0 Eric Anholt   2015-03-02  190  
82cb88af12d29e Maxime Ripard 2021-10-25  191  	mutex_lock(&vc4_hdmi->mutex);
82cb88af12d29e Maxime Ripard 2021-10-25  192  
0f5251339eda7f Maxime Ripard 2021-09-22  193  	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
0f5251339eda7f Maxime Ripard 2021-09-22  194  
e32e5723256a99 Maxime Ripard 2021-10-25  195  	if (vc4_hdmi->hpd_gpio) {
e32e5723256a99 Maxime Ripard 2021-10-25 @196  		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
4d8602b8ec16f5 Dom Cobley    2021-01-11  197  			connected = true;
81fb55e500a82a Maxime Ripard 2021-10-25  198  	} else {
81fb55e500a82a Maxime Ripard 2021-10-25  199  		unsigned long flags;
81fb55e500a82a Maxime Ripard 2021-10-25  200  		u32 hotplug;
81fb55e500a82a Maxime Ripard 2021-10-25  201  
81fb55e500a82a Maxime Ripard 2021-10-25  202  		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  203  		hotplug = HDMI_READ(HDMI_HOTPLUG);
81fb55e500a82a Maxime Ripard 2021-10-25  204  		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  205  
81fb55e500a82a Maxime Ripard 2021-10-25  206  		if (hotplug & VC4_HDMI_HOTPLUG_CONNECTED)
4d8602b8ec16f5 Dom Cobley    2021-01-11  207  			connected = true;
c8b75bca92cbf0 Eric Anholt   2015-03-02  208  	}
c8b75bca92cbf0 Eric Anholt   2015-03-02  209  
4d8602b8ec16f5 Dom Cobley    2021-01-11  210  	if (connected) {
4d8602b8ec16f5 Dom Cobley    2021-01-11  211  		if (connector->status != connector_status_connected) {
4d8602b8ec16f5 Dom Cobley    2021-01-11  212  			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
4d8602b8ec16f5 Dom Cobley    2021-01-11  213  
4d8602b8ec16f5 Dom Cobley    2021-01-11  214  			if (edid) {
4d8602b8ec16f5 Dom Cobley    2021-01-11  215  				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
4d8602b8ec16f5 Dom Cobley    2021-01-11  216  				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
4d8602b8ec16f5 Dom Cobley    2021-01-11  217  				kfree(edid);
4d8602b8ec16f5 Dom Cobley    2021-01-11  218  			}
4d8602b8ec16f5 Dom Cobley    2021-01-11  219  		}
9d44abbbb8d530 Eric Anholt   2016-09-14  220  
b7551457c5d0b3 Maxime Ripard 2021-10-25  221  		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
0f5251339eda7f Maxime Ripard 2021-09-22  222  		pm_runtime_put(&vc4_hdmi->pdev->dev);
82cb88af12d29e Maxime Ripard 2021-10-25  223  		mutex_unlock(&vc4_hdmi->mutex);
c8b75bca92cbf0 Eric Anholt   2015-03-02  224  		return connector_status_connected;
4d8602b8ec16f5 Dom Cobley    2021-01-11  225  	}
4d8602b8ec16f5 Dom Cobley    2021-01-11  226  
b10db9a4242bd5 Maxime Ripard 2020-09-03  227  	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
0f5251339eda7f Maxime Ripard 2021-09-22  228  	pm_runtime_put(&vc4_hdmi->pdev->dev);
82cb88af12d29e Maxime Ripard 2021-10-25  229  	mutex_unlock(&vc4_hdmi->mutex);
c8b75bca92cbf0 Eric Anholt   2015-03-02  230  	return connector_status_disconnected;
c8b75bca92cbf0 Eric Anholt   2015-03-02  231  }
c8b75bca92cbf0 Eric Anholt   2015-03-02  232  

:::::: The code at line 196 was first introduced by commit
:::::: e32e5723256a99c5324824503572f743377dd0fe drm/vc4: hdmi: Fix HPD GPIO detection

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
