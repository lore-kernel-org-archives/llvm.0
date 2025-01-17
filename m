Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03701FCCEE;
	Fri, 17 Jan 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737119564; cv=none; b=LroIYpy45OharZiHkuG78iN0tl59+U9LoZ6yWywIzVJwleAP8CUC6YB1Up6Orl65EAlxl7VDnFLy2OZtEJAL6UGG2qMcKyOehQNO5z+NlluVWvzcwnEwjZeTg1BDMWYCsF/66gi39QQBr52G7nNlra+zJvIRUe+sf9GN9BUbZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737119564; c=relaxed/simple;
	bh=lVdRxp+ddpxdFG2GBWqbP8LAUKT3tZ9Yu+BmmTnsJKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+zM406DaqFmNLe8WT82ikgVVnuw5px3wKKNoOXahgGgiVZlCRdcIe4cDjU6UhM8TecjDZV7GCGFFQULHNafJuU9vyowaqL1N0EkSDlfUZGXoVoGXJVNKc0dOOlDqHVlWnsbOlYg9+BLlG/PERSNSWhJrVjxFX92x/0K6Ulv45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj6LLFo/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj6LLFo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737119563; x=1768655563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVdRxp+ddpxdFG2GBWqbP8LAUKT3tZ9Yu+BmmTnsJKI=;
  b=Mj6LLFo/5HfZazWyBaAzWVKLbXpo6t+5jEgI8Bufm/gpdljj97mKQeRo
   YffXkEvlXcFq4fyBLEMutsYBrXkV1nmSTYuYL4QmzqE13/b0hZi6mmiVw
   duqfKNTYwKkG5EAAmKfSd/4tMQ9G6CvpNNYZBiLP9DzX++RxAMx5ts5hr
   Nco+7K3QD74dFeSc8T6wZit3PMxB2b105OMOiDDwCbx4LbGX7FnqglIVk
   hFyK/QSbN5+caUNILPqp/IJEMdwZKhC4LfBl7tStxR2gS6yFX/EbctXvj
   q8wNIpOQWba3sGShGh4KleqdPgArg38sxGCNpoAJn+jVdEq0KG+l/qsUP
   g==;
X-CSE-ConnectionGUID: 21rte27hSNea/Oi4d5j6TQ==
X-CSE-MsgGUID: 8W9m/zeDTYuPWuIYSvdiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37461532"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37461532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:12:42 -0800
X-CSE-ConnectionGUID: brvEa7IPQDS0ejtOvyIgkg==
X-CSE-MsgGUID: XLp9RR0tTbOcvcafKvFAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105981846"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2025 05:12:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYm9P-000TER-0H;
	Fri, 17 Jan 2025 13:12:39 +0000
Date: Fri, 17 Jan 2025 21:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: [linux-next:master 7211/9563]
 drivers/net/wireless/realtek/rtw88/led.c:19:6: error: redefinition of
 'rtw_led_init'
Message-ID: <202501172139.9wCzBpW1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 4b6652bc6d8d5fb0648b3a7a16ef8af4e0345bcd [7211/9563] wifi: rtw88: Add support for LED blinking
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501172139.9wCzBpW1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172139.9wCzBpW1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172139.9wCzBpW1-lkp@intel.com/

Note: the linux-next/master HEAD 0907e7fb35756464aa34c35d6abb02998418164b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtw88/led.c:19:6: error: redefinition of 'rtw_led_init'
      19 | void rtw_led_init(struct rtw_dev *rtwdev)
         |      ^
   drivers/net/wireless/realtek/rtw88/led.h:15:20: note: previous definition is here
      15 | static inline void rtw_led_init(struct rtw_dev *rtwdev)
         |                    ^
>> drivers/net/wireless/realtek/rtw88/led.c:64:6: error: redefinition of 'rtw_led_deinit'
      64 | void rtw_led_deinit(struct rtw_dev *rtwdev)
         |      ^
   drivers/net/wireless/realtek/rtw88/led.h:19:20: note: previous definition is here
      19 | static inline void rtw_led_deinit(struct rtw_dev *rtwdev)
         |                    ^
   2 errors generated.


vim +/rtw_led_init +19 drivers/net/wireless/realtek/rtw88/led.c

    18	
  > 19	void rtw_led_init(struct rtw_dev *rtwdev)
    20	{
    21		static const struct ieee80211_tpt_blink rtw_tpt_blink[] = {
    22			{ .throughput = 0 * 1024, .blink_time = 334 },
    23			{ .throughput = 1 * 1024, .blink_time = 260 },
    24			{ .throughput = 5 * 1024, .blink_time = 220 },
    25			{ .throughput = 10 * 1024, .blink_time = 190 },
    26			{ .throughput = 20 * 1024, .blink_time = 170 },
    27			{ .throughput = 50 * 1024, .blink_time = 150 },
    28			{ .throughput = 70 * 1024, .blink_time = 130 },
    29			{ .throughput = 100 * 1024, .blink_time = 110 },
    30			{ .throughput = 200 * 1024, .blink_time = 80 },
    31			{ .throughput = 300 * 1024, .blink_time = 50 },
    32		};
    33		struct led_classdev *led = &rtwdev->led_cdev;
    34		int err;
    35	
    36		if (!rtwdev->chip->ops->led_set)
    37			return;
    38	
    39		if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE)
    40			led->brightness_set = rtwdev->chip->ops->led_set;
    41		else
    42			led->brightness_set_blocking = rtw_led_set_blocking;
    43	
    44		snprintf(rtwdev->led_name, sizeof(rtwdev->led_name),
    45			 "rtw88-%s", dev_name(rtwdev->dev));
    46	
    47		led->name = rtwdev->led_name;
    48		led->max_brightness = LED_ON;
    49		led->default_trigger =
    50			ieee80211_create_tpt_led_trigger(rtwdev->hw,
    51							 IEEE80211_TPT_LEDTRIG_FL_RADIO,
    52							 rtw_tpt_blink,
    53							 ARRAY_SIZE(rtw_tpt_blink));
    54	
    55		err = led_classdev_register(rtwdev->dev, led);
    56		if (err) {
    57			rtw_warn(rtwdev, "Failed to register the LED, error %d\n", err);
    58			return;
    59		}
    60	
    61		rtwdev->led_registered = true;
    62	}
    63	
  > 64	void rtw_led_deinit(struct rtw_dev *rtwdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
