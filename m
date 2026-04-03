Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A537F01A;
	Fri,  3 Apr 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205734; cv=none; b=noaC8KLDVRVfDX0F7x8MwCSMjr7xkZd2EnYxIL435VyeOfITjznViOfaw6TPePFNDo1Bm6N3ZVvaKyQ2xTYuyPNOycSNicprKTZT29b3FH6OOWPECsnE7HNpd8a2/ghnNUT2mAEDdg1h2AN1tQDDLHsvGmYt7E2ryOfuTHz1IlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205734; c=relaxed/simple;
	bh=0/siu6ojtIlOtIPmvHrrx3ECNuGFsCxKvX4sHGKUdtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTduu30NEM4ldrFXi0hCjHBRvQt18ZPsaWqvGEux9xclA8AmgSjS3s2CuPDzpG16Gz54nXvHicY/vB8iFyx+QRpsbIB9HeYtbVirr7T+/EfNAlzVmKGWPFRVaCFUzci7YwoI6giA3z2PHfCXZuS08m+1TQSCaaxOWGv1pFHev4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO+yNibm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO+yNibm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205727; x=1806741727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/siu6ojtIlOtIPmvHrrx3ECNuGFsCxKvX4sHGKUdtI=;
  b=OO+yNibmCKxNBjB8r89MXibme7cym7Mb+Gho2vLrLlMknDHH6qAcOBDh
   SfiNnTg7xxWP4qO0EbWC8sWNxu3aUcs/zD6QG/twU7Pi0P13to2rsVOWf
   26pLZVlRP2o/DDjSfGWLJ3Cr/Gx/XuLvX22IlM7hfZha3o0x0i0iF+tDL
   odE2F//RemZcVuU4UgSrInTvdhlbd19HvcafzfaGo7kJej2pfivdhQTEU
   YvQi+2XCK8c44tzphwd7e4kMFTY9uvm2BNu9ZFjOkp0ZcLwJFediyQVTU
   GnxFf4Rwf/LvQOxk+Ljx44met6tT44U7r5p1v3rG/n4H0HLfDu1iaFQnw
   Q==;
X-CSE-ConnectionGUID: rKwpyaNtRb6u+7UrEadTig==
X-CSE-MsgGUID: +/xRHzN6Ru+8ulY5FPnkHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973961"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: upKj9jUOS7qVvaAqqCRCnw==
X-CSE-MsgGUID: IBok+HHqQB2i1RiCR8XVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834224"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-0000000012r-2Eje;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 3 Apr 2026 16:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Georg =?iso-8859-1?Q?M=FCller?= <georgmueller@gmx.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] wifi: rtl8xxxu: handle rate control for 8188e
 a per mac_id
Message-ID: <202604022256.vlcAGcJZ-lkp@intel.com>
References: <20260313131849.3148013-3-georgmueller@gmx.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313131849.3148013-3-georgmueller@gmx.net>

Hi Georg,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.0-rc6 next-20260401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Georg-M-ller/wifi-rtl8xxxu-move-dynamic_tx_rpt_timing_counter-from-ra_info-to-priv/20260314-231442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260313131849.3148013-3-georgmueller%40gmx.net
patch subject: [RFC PATCH v2 2/4] wifi: rtl8xxxu: handle rate control for 8188e a per mac_id
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260402/202604022256.vlcAGcJZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022256.vlcAGcJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022256.vlcAGcJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtl8xxxu/core.c:4398:19: error: too few arguments to function call, expected 3, have 2
    4398 |                 priv->ra_info = kmalloc_array(RTL8188E_MAX_MAC_ID_NUM, sizeof(*priv->ra_info));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1099:74: note: expanded from macro 'kmalloc_array'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/alloc_tag.h:265:31: note: expanded from macro 'alloc_hooks'
     265 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:251:9: note: expanded from macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1091:40: note: 'kmalloc_array_noprof' declared here
    1091 | static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t size, gfp_t flags)
         |                                        ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:4398:19: error: too few arguments to function call, expected 3, have 2
    4398 |                 priv->ra_info = kmalloc_array(RTL8188E_MAX_MAC_ID_NUM, sizeof(*priv->ra_info));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1099:74: note: expanded from macro 'kmalloc_array'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/alloc_tag.h:265:31: note: expanded from macro 'alloc_hooks'
     265 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:255:10: note: expanded from macro 'alloc_hooks_tag'
     255 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1091:40: note: 'kmalloc_array_noprof' declared here
    1091 | static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t size, gfp_t flags)
         |                                        ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:4398:19: error: too few arguments to function call, expected 3, have 2
    4398 |                 priv->ra_info = kmalloc_array(RTL8188E_MAX_MAC_ID_NUM, sizeof(*priv->ra_info));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1099:74: note: expanded from macro 'kmalloc_array'
    1099 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ~~~~~~~~~~~~~~~~~~~~            ^
   include/linux/alloc_tag.h:265:31: note: expanded from macro 'alloc_hooks'
     265 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:258:10: note: expanded from macro 'alloc_hooks_tag'
     258 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1091:40: note: 'kmalloc_array_noprof' declared here
    1091 | static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t size, gfp_t flags)
         |                                        ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +4398 drivers/net/wireless/realtek/rtl8xxxu/core.c

  3917	
  3918	static int rtl8xxxu_init_device(struct ieee80211_hw *hw)
  3919	{
  3920		struct rtl8xxxu_priv *priv = hw->priv;
  3921		struct device *dev = &priv->udev->dev;
  3922		struct rtl8xxxu_fileops *fops = priv->fops;
  3923		bool macpower;
  3924		u16 mac_id;
  3925		int ret;
  3926		u8 val8;
  3927		u16 val16;
  3928		u32 val32;
  3929	
  3930		/* Check if MAC is already powered on */
  3931		val8 = rtl8xxxu_read8(priv, REG_CR);
  3932		val16 = rtl8xxxu_read16(priv, REG_SYS_CLKR);
  3933	
  3934		/*
  3935		 * Fix 92DU-VC S3 hang with the reason is that secondary mac is not
  3936		 * initialized. First MAC returns 0xea, second MAC returns 0x00
  3937		 */
  3938		if (val8 == 0xea || !(val16 & SYS_CLK_MAC_CLK_ENABLE))
  3939			macpower = false;
  3940		else
  3941			macpower = true;
  3942	
  3943		if (fops->needs_full_init)
  3944			macpower = false;
  3945	
  3946		ret = fops->power_on(priv);
  3947		if (ret < 0) {
  3948			dev_warn(dev, "%s: Failed power on\n", __func__);
  3949			goto exit;
  3950		}
  3951	
  3952		if (!macpower)
  3953			rtl8xxxu_init_queue_reserved_page(priv);
  3954	
  3955		ret = rtl8xxxu_init_queue_priority(priv);
  3956		dev_dbg(dev, "%s: init_queue_priority %i\n", __func__, ret);
  3957		if (ret)
  3958			goto exit;
  3959	
  3960		/*
  3961		 * Set RX page boundary
  3962		 */
  3963		rtl8xxxu_write16(priv, REG_TRXFF_BNDY + 2, fops->trxff_boundary);
  3964	
  3965		for (int retry = 5; retry >= 0 ; retry--) {
  3966			ret = rtl8xxxu_download_firmware(priv);
  3967			dev_dbg(dev, "%s: download_firmware %i\n", __func__, ret);
  3968			if (ret != -EAGAIN)
  3969				break;
  3970			if (retry)
  3971				dev_dbg(dev, "%s: retry firmware download\n", __func__);
  3972		}
  3973		if (ret)
  3974			goto exit;
  3975		ret = rtl8xxxu_start_firmware(priv);
  3976		dev_dbg(dev, "%s: start_firmware %i\n", __func__, ret);
  3977		if (ret)
  3978			goto exit;
  3979	
  3980		if (fops->phy_init_antenna_selection)
  3981			fops->phy_init_antenna_selection(priv);
  3982	
  3983		ret = rtl8xxxu_init_mac(priv);
  3984	
  3985		dev_dbg(dev, "%s: init_mac %i\n", __func__, ret);
  3986		if (ret)
  3987			goto exit;
  3988	
  3989		ret = rtl8xxxu_init_phy_bb(priv);
  3990		dev_dbg(dev, "%s: init_phy_bb %i\n", __func__, ret);
  3991		if (ret)
  3992			goto exit;
  3993	
  3994		ret = fops->init_phy_rf(priv);
  3995		if (ret)
  3996			goto exit;
  3997	
  3998		/* Mac APLL Setting */
  3999		if (priv->rtl_chip == RTL8192F)
  4000			rtl8xxxu_write16_set(priv, REG_AFE_CTRL4, BIT(4) | BIT(15));
  4001	
  4002		/* RFSW Control - clear bit 14 ?? */
  4003		if (priv->rtl_chip != RTL8723B && priv->rtl_chip != RTL8192E &&
  4004		    priv->rtl_chip != RTL8188E && priv->rtl_chip != RTL8710B &&
  4005		    priv->rtl_chip != RTL8192F)
  4006			rtl8xxxu_write32(priv, REG_FPGA0_TX_INFO, 0x00000003);
  4007	
  4008		val32 = FPGA0_RF_TRSW | FPGA0_RF_TRSWB | FPGA0_RF_ANTSW |
  4009			FPGA0_RF_ANTSWB |
  4010			((FPGA0_RF_ANTSW | FPGA0_RF_ANTSWB) << FPGA0_RF_BD_CTRL_SHIFT);
  4011		if (!priv->no_pape) {
  4012			val32 |= (FPGA0_RF_PAPE |
  4013				  (FPGA0_RF_PAPE << FPGA0_RF_BD_CTRL_SHIFT));
  4014		}
  4015		rtl8xxxu_write32(priv, REG_FPGA0_XAB_RF_SW_CTRL, val32);
  4016	
  4017		/* 0x860[6:5]= 00 - why? - this sets antenna B */
  4018		if (priv->rtl_chip != RTL8192E && priv->rtl_chip != RTL8188E &&
  4019		    priv->rtl_chip != RTL8710B && priv->rtl_chip != RTL8192F)
  4020			rtl8xxxu_write32(priv, REG_FPGA0_XA_RF_INT_OE, 0x66f60210);
  4021	
  4022		if (!macpower) {
  4023			/*
  4024			 * Set TX buffer boundary
  4025			 */
  4026			val8 = fops->total_page_num + 1;
  4027	
  4028			rtl8xxxu_write8(priv, REG_TXPKTBUF_BCNQ_BDNY, val8);
  4029			rtl8xxxu_write8(priv, REG_TXPKTBUF_MGQ_BDNY, val8);
  4030			rtl8xxxu_write8(priv, REG_TXPKTBUF_WMAC_LBK_BF_HD, val8);
  4031			rtl8xxxu_write8(priv, REG_TRXFF_BNDY, val8);
  4032			rtl8xxxu_write8(priv, REG_TDECTRL + 1, val8);
  4033		}
  4034	
  4035		/*
  4036		 * The vendor drivers set PBP for all devices, except 8192e.
  4037		 * There is no explanation for this in any of the sources.
  4038		 */
  4039		val8 = (fops->pbp_rx << PBP_PAGE_SIZE_RX_SHIFT) |
  4040			(fops->pbp_tx << PBP_PAGE_SIZE_TX_SHIFT);
  4041		if (priv->rtl_chip != RTL8192E)
  4042			rtl8xxxu_write8(priv, REG_PBP, val8);
  4043	
  4044		dev_dbg(dev, "%s: macpower %i\n", __func__, macpower);
  4045		if (!macpower) {
  4046			ret = fops->llt_init(priv);
  4047			if (ret) {
  4048				dev_warn(dev, "%s: LLT table init failed\n", __func__);
  4049				goto exit;
  4050			}
  4051	
  4052			/*
  4053			 * Chip specific quirks
  4054			 */
  4055			fops->usb_quirks(priv);
  4056	
  4057			/*
  4058			 * Enable TX report and TX report timer for 8723bu/8188eu/...
  4059			 */
  4060			if (fops->has_tx_report) {
  4061				/*
  4062				 * The RTL8188EU has two types of TX reports:
  4063				 * rpt_sel=1:
  4064				 *   One report for one frame. We can use this for frames
  4065				 *   with IEEE80211_TX_CTL_REQ_TX_STATUS.
  4066				 * rpt_sel=2:
  4067				 *   One report for many frames transmitted over a period
  4068				 *   of time. (This is what REG_TX_REPORT_TIME is for.) The
  4069				 *   report includes the number of frames transmitted
  4070				 *   successfully, and the number of unsuccessful
  4071				 *   transmissions. We use this for software rate control.
  4072				 *
  4073				 * Bit 0 of REG_TX_REPORT_CTRL is required for both types.
  4074				 * Bit 1 (TX_REPORT_CTRL_TIMER_ENABLE) is required for
  4075				 * type 2.
  4076				 */
  4077				val8 = rtl8xxxu_read8(priv, REG_TX_REPORT_CTRL);
  4078				if (priv->rtl_chip == RTL8188E)
  4079					val8 |= BIT(0);
  4080				val8 |= TX_REPORT_CTRL_TIMER_ENABLE;
  4081				rtl8xxxu_write8(priv, REG_TX_REPORT_CTRL, val8);
  4082				/* Set MAX RPT MACID */
  4083				rtl8xxxu_write8(priv, REG_TX_REPORT_CTRL + 1, 0x02);
  4084				/* TX report Timer. Unit: 32us */
  4085				rtl8xxxu_write16(priv, REG_TX_REPORT_TIME, 0xcdf0);
  4086	
  4087				/* tmp ps ? */
  4088				val8 = rtl8xxxu_read8(priv, 0xa3);
  4089				val8 &= 0xf8;
  4090				rtl8xxxu_write8(priv, 0xa3, val8);
  4091			}
  4092	
  4093			if (priv->rtl_chip == RTL8710B || priv->rtl_chip == RTL8192F)
  4094				rtl8xxxu_write8(priv, REG_EARLY_MODE_CONTROL_8710B, 0);
  4095		}
  4096	
  4097		/*
  4098		 * Unit in 8 bytes.
  4099		 * Get Rx PHY status in order to report RSSI and others.
  4100		 */
  4101		rtl8xxxu_write8(priv, REG_RX_DRVINFO_SZ, 4);
  4102	
  4103		if (priv->rtl_chip == RTL8192E) {
  4104			rtl8xxxu_write32(priv, REG_HIMR0, 0x00);
  4105			rtl8xxxu_write32(priv, REG_HIMR1, 0x00);
  4106		} else if (priv->rtl_chip == RTL8188F) {
  4107			rtl8xxxu_write32(priv, REG_HISR0, 0xffffffff);
  4108			rtl8xxxu_write32(priv, REG_HISR1, 0xffffffff);
  4109		} else if (priv->rtl_chip == RTL8188E) {
  4110			rtl8xxxu_write32(priv, REG_HISR0, 0xffffffff);
  4111			val32 = IMR0_PSTIMEOUT | IMR0_TBDER | IMR0_CPWM | IMR0_CPWM2;
  4112			rtl8xxxu_write32(priv, REG_HIMR0, val32);
  4113			val32 = IMR1_TXERR | IMR1_RXERR | IMR1_TXFOVW | IMR1_RXFOVW;
  4114			rtl8xxxu_write32(priv, REG_HIMR1, val32);
  4115			val8 = rtl8xxxu_read8(priv, REG_USB_SPECIAL_OPTION);
  4116			val8 |= USB_SPEC_INT_BULK_SELECT;
  4117			rtl8xxxu_write8(priv, REG_USB_SPECIAL_OPTION, val8);
  4118		} else if (priv->rtl_chip == RTL8710B) {
  4119			rtl8xxxu_write32(priv, REG_HIMR0_8710B, 0);
  4120		} else if (priv->rtl_chip != RTL8192F) {
  4121			/*
  4122			 * Enable all interrupts - not obvious USB needs to do this
  4123			 */
  4124			rtl8xxxu_write32(priv, REG_HISR, 0xffffffff);
  4125			rtl8xxxu_write32(priv, REG_HIMR, 0xffffffff);
  4126		}
  4127	
  4128		/*
  4129		 * Configure initial WMAC settings
  4130		 */
  4131		val32 = RCR_ACCEPT_PHYS_MATCH | RCR_ACCEPT_MCAST | RCR_ACCEPT_BCAST |
  4132			RCR_ACCEPT_MGMT_FRAME | RCR_HTC_LOC_CTRL |
  4133			RCR_APPEND_PHYSTAT | RCR_APPEND_ICV | RCR_APPEND_MIC;
  4134		rtl8xxxu_write32(priv, REG_RCR, val32);
  4135		priv->regrcr = val32;
  4136	
  4137		if (fops->init_reg_rxfltmap) {
  4138			/* Accept all data frames */
  4139			rtl8xxxu_write16(priv, REG_RXFLTMAP2, 0xffff);
  4140	
  4141			/*
  4142			 * Since ADF is removed from RCR, ps-poll will not be indicate to driver,
  4143			 * RxFilterMap should mask ps-poll to gurantee AP mode can rx ps-poll.
  4144			 */
  4145			rtl8xxxu_write16(priv, REG_RXFLTMAP1, 0x400);
  4146	
  4147			/* Accept all management frames */
  4148			rtl8xxxu_write16(priv, REG_RXFLTMAP0, 0xffff);
  4149		} else {
  4150			/*
  4151			 * Accept all multicast
  4152			 */
  4153			rtl8xxxu_write32(priv, REG_MAR, 0xffffffff);
  4154			rtl8xxxu_write32(priv, REG_MAR + 4, 0xffffffff);
  4155		}
  4156	
  4157		/*
  4158		 * Init adaptive controls
  4159		 */
  4160		val32 = rtl8xxxu_read32(priv, REG_RESPONSE_RATE_SET);
  4161		val32 &= ~RESPONSE_RATE_BITMAP_ALL;
  4162		val32 |= RESPONSE_RATE_RRSR_CCK_ONLY_1M;
  4163		rtl8xxxu_write32(priv, REG_RESPONSE_RATE_SET, val32);
  4164	
  4165		/* CCK = 0x0a, OFDM = 0x10 */
  4166		rtl8xxxu_set_spec_sifs(priv, 0x10, 0x10);
  4167		rtl8xxxu_set_retry(priv, 0x30, 0x30);
  4168		rtl8xxxu_set_spec_sifs(priv, 0x0a, 0x10);
  4169	
  4170		/*
  4171		 * Init EDCA
  4172		 */
  4173		rtl8xxxu_write16(priv, REG_MAC_SPEC_SIFS, 0x100a);
  4174	
  4175		/* Set CCK SIFS */
  4176		rtl8xxxu_write16(priv, REG_SIFS_CCK, 0x100a);
  4177	
  4178		/* Set OFDM SIFS */
  4179		rtl8xxxu_write16(priv, REG_SIFS_OFDM, 0x100a);
  4180	
  4181		/* TXOP */
  4182		rtl8xxxu_write32(priv, REG_EDCA_BE_PARAM, 0x005ea42b);
  4183		rtl8xxxu_write32(priv, REG_EDCA_BK_PARAM, 0x0000a44f);
  4184		rtl8xxxu_write32(priv, REG_EDCA_VI_PARAM, 0x005ea324);
  4185		rtl8xxxu_write32(priv, REG_EDCA_VO_PARAM, 0x002fa226);
  4186	
  4187		/* Set data auto rate fallback retry count */
  4188		rtl8xxxu_write32(priv, REG_DARFRC, 0x00000000);
  4189		rtl8xxxu_write32(priv, REG_DARFRC + 4, 0x10080404);
  4190		rtl8xxxu_write32(priv, REG_RARFRC, 0x04030201);
  4191		rtl8xxxu_write32(priv, REG_RARFRC + 4, 0x08070605);
  4192	
  4193		val8 = rtl8xxxu_read8(priv, REG_FWHW_TXQ_CTRL);
  4194		val8 |= FWHW_TXQ_CTRL_AMPDU_RETRY;
  4195		rtl8xxxu_write8(priv, REG_FWHW_TXQ_CTRL, val8);
  4196	
  4197		/*  Set ACK timeout */
  4198		rtl8xxxu_write8(priv, REG_ACKTO, 0x40);
  4199	
  4200		/*
  4201		 * Initialize beacon parameters
  4202		 */
  4203		val16 = BEACON_DISABLE_TSF_UPDATE | (BEACON_DISABLE_TSF_UPDATE << 8);
  4204		rtl8xxxu_write16(priv, REG_BEACON_CTRL, val16);
  4205		rtl8xxxu_write16(priv, REG_TBTT_PROHIBIT, 0x6404);
  4206		if (priv->rtl_chip != RTL8188F && priv->rtl_chip != RTL8710B &&
  4207		    priv->rtl_chip != RTL8192F)
  4208			/* Firmware will control REG_DRVERLYINT when power saving is enable, */
  4209			/* so don't set this register on STA mode. */
  4210			rtl8xxxu_write8(priv, REG_DRIVER_EARLY_INT, DRIVER_EARLY_INT_TIME);
  4211		rtl8xxxu_write8(priv, REG_BEACON_DMA_TIME, BEACON_DMA_ATIME_INT_TIME);
  4212		rtl8xxxu_write16(priv, REG_BEACON_TCFG, 0x660F);
  4213	
  4214		/*
  4215		 * Initialize burst parameters
  4216		 */
  4217		if (priv->fops->init_burst)
  4218			priv->fops->init_burst(priv);
  4219	
  4220		if (fops->init_aggregation)
  4221			fops->init_aggregation(priv);
  4222	
  4223		if (fops->init_reg_pkt_life_time) {
  4224			rtl8xxxu_write16(priv, REG_PKT_VO_VI_LIFE_TIME, 0x0400); /* unit: 256us. 256ms */
  4225			rtl8xxxu_write16(priv, REG_PKT_BE_BK_LIFE_TIME, 0x0400); /* unit: 256us. 256ms */
  4226		}
  4227	
  4228		/*
  4229		 * Enable CCK and OFDM block
  4230		 */
  4231		val32 = rtl8xxxu_read32(priv, REG_FPGA0_RF_MODE);
  4232		val32 |= (FPGA_RF_MODE_CCK | FPGA_RF_MODE_OFDM);
  4233		rtl8xxxu_write32(priv, REG_FPGA0_RF_MODE, val32);
  4234	
  4235		/*
  4236		 * Invalidate all CAM entries - bit 30 is undocumented
  4237		 */
  4238		rtl8xxxu_write32(priv, REG_CAM_CMD, CAM_CMD_POLLING | BIT(30));
  4239	
  4240		/*
  4241		 * Start out with default power levels for channel 6, 20MHz
  4242		 */
  4243		fops->set_tx_power(priv, 1, false);
  4244	
  4245		/* Let the 8051 take control of antenna setting */
  4246		if (priv->rtl_chip != RTL8192E && priv->rtl_chip != RTL8188F &&
  4247		    priv->rtl_chip != RTL8710B && priv->rtl_chip != RTL8192C) {
  4248			val8 = rtl8xxxu_read8(priv, REG_LEDCFG2);
  4249			val8 |= LEDCFG2_DPDT_SELECT;
  4250			rtl8xxxu_write8(priv, REG_LEDCFG2, val8);
  4251		}
  4252	
  4253		rtl8xxxu_write8(priv, REG_HWSEQ_CTRL, 0xff);
  4254	
  4255		/* Disable BAR - not sure if this has any effect on USB */
  4256		rtl8xxxu_write32(priv, REG_BAR_MODE_CTRL, 0x0201ffff);
  4257	
  4258		if (priv->rtl_chip != RTL8188F && priv->rtl_chip != RTL8188E &&
  4259		    priv->rtl_chip != RTL8710B && priv->rtl_chip != RTL8192F)
  4260			rtl8xxxu_write16(priv, REG_FAST_EDCA_CTRL, 0);
  4261	
  4262		if (fops->init_statistics)
  4263			fops->init_statistics(priv);
  4264	
  4265		if (priv->rtl_chip == RTL8192E) {
  4266			/*
  4267			 * 0x4c6[3] 1: RTS BW = Data BW
  4268			 * 0: RTS BW depends on CCA / secondary CCA result.
  4269			 */
  4270			val8 = rtl8xxxu_read8(priv, REG_QUEUE_CTRL);
  4271			val8 &= ~BIT(3);
  4272			rtl8xxxu_write8(priv, REG_QUEUE_CTRL, val8);
  4273			/*
  4274			 * Reset USB mode switch setting
  4275			 */
  4276			rtl8xxxu_write8(priv, REG_ACLK_MON, 0x00);
  4277		} else if (priv->rtl_chip == RTL8188F || priv->rtl_chip == RTL8188E ||
  4278			   priv->rtl_chip == RTL8192F) {
  4279			/*
  4280			 * Init GPIO settings for 8188f, 8188e, 8192f
  4281			 */
  4282			val8 = rtl8xxxu_read8(priv, REG_GPIO_MUXCFG);
  4283			val8 &= ~GPIO_MUXCFG_IO_SEL_ENBT;
  4284			rtl8xxxu_write8(priv, REG_GPIO_MUXCFG, val8);
  4285		}
  4286	
  4287		if (priv->rtl_chip == RTL8188F)
  4288			/* CCK PD */
  4289			rtl8xxxu_write8(priv, REG_CCK_PD_THRESH, CCK_PD_TYPE1_LV1_TH);
  4290	
  4291		fops->phy_lc_calibrate(priv);
  4292	
  4293		fops->phy_iq_calibrate(priv);
  4294	
  4295		/*
  4296		 * This should enable thermal meter
  4297		 */
  4298		if (fops->gen2_thermal_meter) {
  4299			if (priv->rtl_chip == RTL8188F || priv->rtl_chip == RTL8710B) {
  4300				val32 = rtl8xxxu_read_rfreg(priv, RF_A, RF6052_REG_T_METER_8723B);
  4301				val32 |= 0x30000;
  4302				rtl8xxxu_write_rfreg(priv, RF_A, RF6052_REG_T_METER_8723B, val32);
  4303			} else {
  4304				rtl8xxxu_write_rfreg(priv,
  4305						     RF_A, RF6052_REG_T_METER_8723B, 0x37cf8);
  4306			}
  4307		} else {
  4308			rtl8xxxu_write_rfreg(priv, RF_A, RF6052_REG_T_METER, 0x60);
  4309		}
  4310	
  4311		/* Set NAV_UPPER to 30000us */
  4312		val8 = ((30000 + NAV_UPPER_UNIT - 1) / NAV_UPPER_UNIT);
  4313		rtl8xxxu_write8(priv, REG_NAV_UPPER, val8);
  4314	
  4315		if (priv->rtl_chip == RTL8723A) {
  4316			/*
  4317			 * 2011/03/09 MH debug only, UMC-B cut pass 2500 S5 test,
  4318			 * but we need to find root cause.
  4319			 * This is 8723au only.
  4320			 */
  4321			val32 = rtl8xxxu_read32(priv, REG_FPGA0_RF_MODE);
  4322			if ((val32 & 0xff000000) != 0x83000000) {
  4323				val32 |= FPGA_RF_MODE_CCK;
  4324				rtl8xxxu_write32(priv, REG_FPGA0_RF_MODE, val32);
  4325			}
  4326		} else if (priv->rtl_chip == RTL8192E || priv->rtl_chip == RTL8188E) {
  4327			rtl8xxxu_write8(priv, REG_USB_HRPWM, 0x00);
  4328		}
  4329	
  4330		val32 = rtl8xxxu_read32(priv, REG_FWHW_TXQ_CTRL);
  4331		val32 |= FWHW_TXQ_CTRL_XMIT_MGMT_ACK;
  4332		/* ack for xmit mgmt frames. */
  4333		rtl8xxxu_write32(priv, REG_FWHW_TXQ_CTRL, val32);
  4334	
  4335		if (priv->rtl_chip == RTL8192E) {
  4336			/*
  4337			 * Fix LDPC rx hang issue.
  4338			 */
  4339			val32 = rtl8xxxu_read32(priv, REG_AFE_MISC);
  4340			rtl8xxxu_write8(priv, REG_8192E_LDOV12_CTRL, 0x75);
  4341			val32 &= 0xfff00fff;
  4342			val32 |= 0x0007e000;
  4343			rtl8xxxu_write32(priv, REG_AFE_MISC, val32);
  4344	
  4345			/*
  4346			 * 0x824[9] = 0x82C[9] = 0xA80[7] those registers setting
  4347			 * should be equal or CCK RSSI report may be incorrect
  4348			 */
  4349			val32 = rtl8xxxu_read32(priv, REG_FPGA0_XA_HSSI_PARM2);
  4350			priv->cck_agc_report_type =
  4351				u32_get_bits(val32, FPGA0_HSSI_PARM2_CCK_HIGH_PWR);
  4352	
  4353			val32 = rtl8xxxu_read32(priv, REG_FPGA0_XB_HSSI_PARM2);
  4354			if (priv->cck_agc_report_type !=
  4355			    u32_get_bits(val32, FPGA0_HSSI_PARM2_CCK_HIGH_PWR)) {
  4356				if (priv->cck_agc_report_type)
  4357					val32 |= FPGA0_HSSI_PARM2_CCK_HIGH_PWR;
  4358				else
  4359					val32 &= ~FPGA0_HSSI_PARM2_CCK_HIGH_PWR;
  4360				rtl8xxxu_write32(priv, REG_FPGA0_XB_HSSI_PARM2, val32);
  4361			}
  4362	
  4363			val32 = rtl8xxxu_read32(priv, REG_AGC_RPT);
  4364			if (priv->cck_agc_report_type)
  4365				val32 |= AGC_RPT_CCK;
  4366			else
  4367				val32 &= ~AGC_RPT_CCK;
  4368			rtl8xxxu_write32(priv, REG_AGC_RPT, val32);
  4369		}
  4370	
  4371		if (priv->rtl_chip == RTL8710B) {
  4372			/*
  4373			 * 0x76D[5:4] is Port0,Port1 Enable Bit.
  4374			 * This is only for 8710B, 2b'00 for MP and 2b'11 for Normal Driver
  4375			 */
  4376			val8 = rtl8xxxu_read8(priv, REG_PORT_CONTROL_8710B);
  4377			val8 |= BIT(5) | BIT(4);
  4378			rtl8xxxu_write8(priv, REG_PORT_CONTROL_8710B, val8);
  4379	
  4380			/* Set 0x5c[8] and [2:0] = 1, LDO mode */
  4381			val32 = rtl8xxxu_read32(priv, REG_WL_RF_PSS_8710B);
  4382			val32 |= 0x107;
  4383			rtl8xxxu_write32(priv, REG_WL_RF_PSS_8710B, val32);
  4384		}
  4385	
  4386		val32 = rtl8xxxu_read32(priv, 0xa9c);
  4387		priv->cck_new_agc = u32_get_bits(val32, BIT(17));
  4388	
  4389		/* Initialise the center frequency offset tracking */
  4390		if (priv->fops->set_crystal_cap) {
  4391			val32 = rtl8xxxu_read32(priv, REG_OFDM1_CFO_TRACKING);
  4392			priv->cfo_tracking.atc_status = val32 & CFO_TRACKING_ATC_STATUS;
  4393			priv->cfo_tracking.adjust = true;
  4394			priv->cfo_tracking.crystal_cap = priv->default_crystal_cap;
  4395		}
  4396	
  4397		if (priv->rtl_chip == RTL8188E)	{
> 4398			priv->ra_info = kmalloc_array(RTL8188E_MAX_MAC_ID_NUM, sizeof(*priv->ra_info));
  4399			if (!priv->ra_info) {
  4400				ret = -ENOMEM;
  4401				goto exit;
  4402			}
  4403			for (mac_id = 0; mac_id < RTL8188E_MAX_MAC_ID_NUM; mac_id++) {
  4404				rtl8188e_ra_info_init_all(&priv->ra_info[mac_id]);
  4405			}
  4406		}
  4407		set_bit(RTL8XXXU_BC_MC_MACID, priv->mac_id_map);
  4408		set_bit(RTL8XXXU_BC_MC_MACID1, priv->mac_id_map);
  4409	
  4410	exit:
  4411		return ret;
  4412	}
  4413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
