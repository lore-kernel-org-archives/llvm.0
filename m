Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96492BE7B5;
	Sat,  9 Aug 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754752847; cv=none; b=cO4t3djWgPIQCHZ5jlCdRWyBYL12t6nAXghAW+KMcm7MuvoOgxRk1xyQEQ5wMi3VitOPjoJb7aOYL7e/tEbVrdEVoqGpBZYFslCKoQ9Rwasyl9ZaHxIcMgZnc8Nd9zQukYKYN/KpQDNYGpIHXM0vwRfR7wu4ZLlBUcr6sR6CKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754752847; c=relaxed/simple;
	bh=P/n9QgqspZXCvKMfHpPoWu78HUKNYA9yPvAIBHm5lkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a75VehGkAlGcHxjJFhXw17ZnHGYwpN+IKWe3nxZghHdT+/RM3tJN3RxK5fS/3SGL6mUM9ZgnFJ4kPmX9uvWPTTBIYWOdpZzpkgCwhLf2FWsD4UJqEyhEMN+12cmijKJgoQCaEQ6umhrEE/EEe6T7wicPpAMZ+FhBWhtQAhP6qro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hza+ZuSw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hza+ZuSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754752845; x=1786288845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/n9QgqspZXCvKMfHpPoWu78HUKNYA9yPvAIBHm5lkM=;
  b=Hza+ZuSw3JooJkpWzCCNYiLKWaX/pM8wLdEZiWSQMQp3FdTT0e7FkqGA
   oise05+nD8TWzsjDltTHkE5vW/kUADau3xvC4etVDcEJ8Jr/dUV3VLqNl
   R+UbF8UGlZgx8dmYngOj7Z1p8/eaZBFGbnTAu4vH0umJbxwrA4KX0KyDg
   hF2w74ObecKZ7Rl8Ux8DAJrlvUiqIR4SQJ1zmJs8yRfpp27q8uuFi0XTU
   r8Dwla+0sXW5Ls+G8vlb6YvIF3Wl7qVu5veRhW5JwX9x1hEobVFxFyc3k
   i2I5HBLAU0UqR/SNX/N/aE46xZ7Vo91wE7sFXeJ7VtPooMnFnFRTBgwyl
   A==;
X-CSE-ConnectionGUID: SKpYlVXhSGy/VhvHuymheA==
X-CSE-MsgGUID: AWzj0xsUTFSkb80YCWIMGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60919962"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60919962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 08:20:44 -0700
X-CSE-ConnectionGUID: 4sWFFCyJRxmpaaBB5H37/w==
X-CSE-MsgGUID: ryDVHuLjRm+YHfpGk9DCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166343738"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Aug 2025 08:20:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uklMz-0004s0-1b;
	Sat, 09 Aug 2025 15:20:32 +0000
Date: Sat, 9 Aug 2025 23:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 21/21]
 drivers/net/wireless/ath/ath9k/hw.c:2727:8: error: call to undeclared
 function 'devm_gpio_request_one'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202508092319.JNjFdNtT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   c0a2b3cd5b78ddb721e53baf675d7164a118bc2d
commit: c0a2b3cd5b78ddb721e53baf675d7164a118bc2d [21/21] gpiolib: turn off legacy interface by default
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250809/202508092319.JNjFdNtT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092319.JNjFdNtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508092319.JNjFdNtT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath9k/hw.c:2727:8: error: call to undeclared function 'devm_gpio_request_one'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2727 |         err = devm_gpio_request_one(ah->dev, gpio, out ? GPIOF_OUT_INIT_LOW : GPIOF_IN, label);
         |               ^
>> drivers/net/wireless/ath/ath9k/hw.c:2727:51: error: use of undeclared identifier 'GPIOF_OUT_INIT_LOW'; did you mean 'GPIOD_OUT_LOW'?
    2727 |         err = devm_gpio_request_one(ah->dev, gpio, out ? GPIOF_OUT_INIT_LOW : GPIOF_IN, label);
         |                                                          ^~~~~~~~~~~~~~~~~~
         |                                                          GPIOD_OUT_LOW
   include/linux/gpio/consumer.h:52:2: note: 'GPIOD_OUT_LOW' declared here
      52 |         GPIOD_OUT_LOW   = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
         |         ^
>> drivers/net/wireless/ath/ath9k/hw.c:2727:72: error: use of undeclared identifier 'GPIOF_IN'; did you mean 'GPIOD_IN'?
    2727 |         err = devm_gpio_request_one(ah->dev, gpio, out ? GPIOF_OUT_INIT_LOW : GPIOF_IN, label);
         |                                                                               ^~~~~~~~
         |                                                                               GPIOD_IN
   include/linux/gpio/consumer.h:51:2: note: 'GPIOD_IN' declared here
      51 |         GPIOD_IN        = GPIOD_FLAGS_BIT_DIR_SET,
         |         ^
>> drivers/net/wireless/ath/ath9k/hw.c:2826:9: error: call to undeclared function 'gpio_get_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2826 |                 val = gpio_get_value(gpio) & BIT(gpio);
         |                       ^
   drivers/net/wireless/ath/ath9k/hw.c:2826:9: note: did you mean 'gpiod_get_value'?
   include/linux/gpio/consumer.h:117:5: note: 'gpiod_get_value' declared here
     117 | int gpiod_get_value(const struct gpio_desc *desc);
         |     ^
>> drivers/net/wireless/ath/ath9k/hw.c:2850:3: error: call to undeclared function 'gpio_set_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2850 |                 gpio_set_value(gpio, val);
         |                 ^
   drivers/net/wireless/ath/ath9k/hw.c:2850:3: note: did you mean 'gpiod_set_value'?
   include/linux/gpio/consumer.h:122:5: note: 'gpiod_set_value' declared here
     122 | int gpiod_set_value(struct gpio_desc *desc, int value);
         |     ^
   5 errors generated.


vim +/devm_gpio_request_one +2727 drivers/net/wireless/ath/ath9k/hw.c

f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2716  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2717  /* BSP should set the corresponding MUX register correctly.
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2718   */
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2719  static void ath9k_hw_gpio_cfg_soc(struct ath_hw *ah, u32 gpio, bool out,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2720  				  const char *label)
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2721  {
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2722  	int err;
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2723  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2724  	if (ah->caps.gpio_requested & BIT(gpio))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2725  		return;
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2726  
8aabc03c7d2269 drivers/net/wireless/ath/ath9k/hw.c Rosen Penev             2024-07-31 @2727  	err = devm_gpio_request_one(ah->dev, gpio, out ? GPIOF_OUT_INIT_LOW : GPIOF_IN, label);
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2728  	if (err) {
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2729  		ath_err(ath9k_hw_common(ah), "request GPIO%d failed:%d\n",
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2730  			gpio, err);
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2731  		return;
7c48662b9d5666 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2021-08-09  2732  	}
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2733  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2734  	ah->caps.gpio_requested |= BIT(gpio);
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2735  }
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2736  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2737  static void ath9k_hw_gpio_cfg_wmac(struct ath_hw *ah, u32 gpio, bool out,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2738  				   u32 ah_signal_type)
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2739  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2740  	u32 gpio_set, gpio_shift = gpio;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2741  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2742  	if (AR_DEVID_7010(ah)) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2743  		gpio_set = out ?
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2744  			AR7010_GPIO_OE_AS_OUTPUT : AR7010_GPIO_OE_AS_INPUT;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2745  		REG_RMW(ah, AR7010_GPIO_OE, gpio_set << gpio_shift,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2746  			AR7010_GPIO_OE_MASK << gpio_shift);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2747  	} else if (AR_SREV_SOC(ah)) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2748  		gpio_set = out ? 1 : 0;
b3a663f0037d20 drivers/net/wireless/ath/ath9k/hw.c Wenli Looi              2022-12-06  2749  		REG_RMW(ah, AR_GPIO_OE_OUT(ah), gpio_set << gpio_shift,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2750  			gpio_set << gpio_shift);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2751  	} else {
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2752  		gpio_shift = gpio << 1;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2753  		gpio_set = out ?
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2754  			AR_GPIO_OE_OUT_DRV_ALL : AR_GPIO_OE_OUT_DRV_NO;
b3a663f0037d20 drivers/net/wireless/ath/ath9k/hw.c Wenli Looi              2022-12-06  2755  		REG_RMW(ah, AR_GPIO_OE_OUT(ah), gpio_set << gpio_shift,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2756  			AR_GPIO_OE_OUT_DRV << gpio_shift);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2757  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2758  		if (out)
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2759  			ath9k_hw_gpio_cfg_output_mux(ah, gpio, ah_signal_type);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2760  	}
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2761  }
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2762  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2763  static void ath9k_hw_gpio_request(struct ath_hw *ah, u32 gpio, bool out,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2764  				  const char *label, u32 ah_signal_type)
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2765  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2766  	WARN_ON(gpio >= ah->caps.num_gpio_pins);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2767  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2768  	if (BIT(gpio) & ah->caps.gpio_mask)
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2769  		ath9k_hw_gpio_cfg_wmac(ah, gpio, out, ah_signal_type);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2770  	else if (AR_SREV_SOC(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2771  		ath9k_hw_gpio_cfg_soc(ah, gpio, out, label);
cb33c4126ba982 drivers/net/wireless/ath9k/hw.c     Senthil Balasubramanian 2008-12-24  2772  	else
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2773  		WARN_ON(1);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2774  }
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2775  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2776  void ath9k_hw_gpio_request_in(struct ath_hw *ah, u32 gpio, const char *label)
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2777  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2778  	ath9k_hw_gpio_request(ah, gpio, false, label, 0);
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2779  }
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2780  EXPORT_SYMBOL(ath9k_hw_gpio_request_in);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2781  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2782  void ath9k_hw_gpio_request_out(struct ath_hw *ah, u32 gpio, const char *label,
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2783  			       u32 ah_signal_type)
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2784  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2785  	ath9k_hw_gpio_request(ah, gpio, true, label, ah_signal_type);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2786  }
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2787  EXPORT_SYMBOL(ath9k_hw_gpio_request_out);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2788  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2789  void ath9k_hw_gpio_free(struct ath_hw *ah, u32 gpio)
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2790  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2791  	if (!AR_SREV_SOC(ah))
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2792  		return;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2793  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2794  	WARN_ON(gpio >= ah->caps.num_gpio_pins);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2795  
8aabc03c7d2269 drivers/net/wireless/ath/ath9k/hw.c Rosen Penev             2024-07-31  2796  	if (ah->caps.gpio_requested & BIT(gpio))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2797  		ah->caps.gpio_requested &= ~BIT(gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2798  }
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2799  EXPORT_SYMBOL(ath9k_hw_gpio_free);
88c1f4f6dffe66 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-06-30  2800  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2801  u32 ath9k_hw_gpio_get(struct ath_hw *ah, u32 gpio)
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2802  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2803  	u32 val = 0xffffffff;
5b5fa3558db745 drivers/net/wireless/ath/ath9k/hw.c Sujith                  2010-03-17  2804  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2805  #define MS_REG_READ(x, y) \
b3a663f0037d20 drivers/net/wireless/ath/ath9k/hw.c Wenli Looi              2022-12-06  2806  	(MS(REG_READ(ah, AR_GPIO_IN_OUT(ah)), x##_GPIO_IN_VAL) & BIT(y))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2807  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2808  	WARN_ON(gpio >= ah->caps.num_gpio_pins);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2809  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2810  	if (BIT(gpio) & ah->caps.gpio_mask) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2811  		if (AR_SREV_9271(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2812  			val = MS_REG_READ(AR9271, gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2813  		else if (AR_SREV_9287(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2814  			val = MS_REG_READ(AR9287, gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2815  		else if (AR_SREV_9285(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2816  			val = MS_REG_READ(AR9285, gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2817  		else if (AR_SREV_9280(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2818  			val = MS_REG_READ(AR928X, gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2819  		else if (AR_DEVID_7010(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2820  			val = REG_READ(ah, AR7010_GPIO_IN) & BIT(gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2821  		else if (AR_SREV_9300_20_OR_LATER(ah))
b3a663f0037d20 drivers/net/wireless/ath/ath9k/hw.c Wenli Looi              2022-12-06  2822  			val = REG_READ(ah, AR_GPIO_IN(ah)) & BIT(gpio);
61b559dea40ec1 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2015-04-01  2823  		else
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2824  			val = MS_REG_READ(AR, gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2825  	} else if (BIT(gpio) & ah->caps.gpio_requested) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07 @2826  		val = gpio_get_value(gpio) & BIT(gpio);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2827  	} else {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2828  		WARN_ON(1);
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2829  	}
f078f209704849 drivers/net/wireless/ath9k/hw.c     Luis R. Rodriguez       2008-08-04  2830  
91851cc7a93903 drivers/net/wireless/ath/ath9k/hw.c Matthias Schiffer       2016-11-15  2831  	return !!val;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2832  }
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2833  EXPORT_SYMBOL(ath9k_hw_gpio_get);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2834  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2835  void ath9k_hw_set_gpio(struct ath_hw *ah, u32 gpio, u32 val)
61b559dea40ec1 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2015-04-01  2836  {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2837  	WARN_ON(gpio >= ah->caps.num_gpio_pins);
61b559dea40ec1 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2015-04-01  2838  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2839  	if (AR_DEVID_7010(ah) || AR_SREV_9271(ah))
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2840  		val = !val;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2841  	else
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2842  		val = !!val;
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2843  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2844  	if (BIT(gpio) & ah->caps.gpio_mask) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2845  		u32 out_addr = AR_DEVID_7010(ah) ?
b3a663f0037d20 drivers/net/wireless/ath/ath9k/hw.c Wenli Looi              2022-12-06  2846  			AR7010_GPIO_OUT : AR_GPIO_IN_OUT(ah);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2847  
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2848  		REG_RMW(ah, out_addr, val << gpio, BIT(gpio));
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2849  	} else if (BIT(gpio) & ah->caps.gpio_requested) {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07 @2850  		gpio_set_value(gpio, val);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2851  	} else {
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2852  		WARN_ON(1);
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2853  	}
61b559dea40ec1 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2015-04-01  2854  }
b2d70d4944c178 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2016-03-07  2855  EXPORT_SYMBOL(ath9k_hw_set_gpio);
61b559dea40ec1 drivers/net/wireless/ath/ath9k/hw.c Miaoqing Pan            2015-04-01  2856  

:::::: The code at line 2727 was first introduced by commit
:::::: 8aabc03c7d226992b758a7bf5a53e05fc8a9ab01 wifi: ath9k: use devm for gpio_request_one()

:::::: TO: Rosen Penev <rosenp@gmail.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
