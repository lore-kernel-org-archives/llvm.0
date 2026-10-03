Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B630FC26;
	Sat,  3 Oct 2026 04:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001314; cv=none; b=LKzH6KWOo+h5LIXKdQf6rheLoch71VQjFAV3AgRSyzlotM04HG45dNY2kUp70GHBqG2IIupsVmhwqAdggt36YZ7C4bdGPGqoZBwJTlNxJH/Y+cXkwx+++TuQ7mcT0BfWN3Oyxv+8LH3/kOxfScrYGyGA/fwyGNKxeWddQgbuXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001314; c=relaxed/simple;
	bh=ZLwjAKhUnAV8q8UjP0O92xarz69/WTd5uH5s6U4Ar6s=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O69AsRBvfq2EaoTvwQyCats8XTVp5idYJRZeLyvi5Lfa/cD0qTPd2Z1+0F7kNVsr3rWANxFH3hFm37pYoq75y9oGyLJo0WXRk/HTKfmE+WpC9puSJOT/GmLoo/YPwNhD2P34d7wyxK279WW03mHfduSqYpfHvONtMguI83/z1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZETmWK3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZETmWK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791001312; x=1822537312;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=ZLwjAKhUnAV8q8UjP0O92xarz69/WTd5uH5s6U4Ar6s=;
  b=HZETmWK3h1KQgdsDB3xHcx7LHgv4jHa6IOCc3nPcw1mKZVAp/oL1M936
   zLriqvCLkxia8Jx4OazAkopqSl6MIKFOl6mmpjLj0pTBO4xPPc9IREO5N
   Kl/3//0PRw/UdYABD8DnkBZ9irOpZLdfVgIZw0mp4f4K8Q8KsNaMUZfrM
   lXzQdTSxXzOEk7PjxV1YxmVwM1LQP981we08mm5clqdZh7PWlQthYwnJl
   CQ6CKeFPFNLpXgK4OyHHXl7rzPUCiX/AiMzw7WKtsJe93jZ27ykxpW4wG
   NtPlIKfMUY79awRq0W1qUyycaXFYhLoJllNrBSiCW72VNeUvnY68s6y2s
   A==;
X-CSE-ConnectionGUID: Jw7UtCdPSfOzdhCeHjAD3g==
X-CSE-MsgGUID: VT7v/z4kTGmxvmO9URXWvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90715859"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90715859"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 21:21:52 -0700
X-CSE-ConnectionGUID: WHQvWXssRcK/kPsbdkhZlw==
X-CSE-MsgGUID: d2zZMTMkTqmmK1us65dU5w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Oct 2026 21:21:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCrFr-00000000TjR-2R6W;
	Sat, 03 Oct 2026 04:21:47 +0000
Date: Sat, 3 Oct 2026 12:20:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: ALSA: usb-audio: Add quirk flag for Creative Stage SE
Message-ID: <202610031200.bli3eqbg-lkp@intel.com>
References: <202610031200.bli3eqbg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610031200.bli3eqbg-lkp@intel.com>

Hi Yejung,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Yejung-Kim/ALSA-usb-audio-Add-quirk-flag-for-Creative-Stage-SE/20261002-145035
base:   
patch link:    https://lore.kernel.org/r/202610031200.bli3eqbg-lkp%40intel.com
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261003/202610031200.bli3eqbg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031200.bli3eqbg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610031200.bli3eqbg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/usb/quirks.c:2468:6: error: use of undeclared identifier 'QUIRK_FLAG_MIXER_GET_CUR_BROKEN'; did you mean 'QUIRK_TYPE_MIXER_GET_CUR_OK'?
    2468 |                    QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    QUIRK_TYPE_MIXER_GET_CUR_OK
   sound/usb/quirks.c:2396:38: note: expanded from macro 'DEVICE_FLG'
    2396 |         { .id = USB_ID(vid, pid), .flags = (_flags) }
         |                                             ^~~~~~
   sound/usb/usbaudio.h:298:2: note: 'QUIRK_TYPE_MIXER_GET_CUR_OK' declared here
     298 |         QUIRK_TYPE_MIXER_GET_CUR_OK             = 30,
         |         ^
   1 error generated.


vim +2468 sound/usb/quirks.c

  2430	
  2431	/*
  2432	 * Use as a last resort if using VENDOR_FLG() is prone to VID conflicts.
  2433	 *
  2434	 * Usage:
  2435	 *   // match vid, and "manufacturer"
  2436	 *   VENDOR_STRING_FLG(vid, "manufacturer", flags)
  2437	 *
  2438	 *   // match vid, and device must have no manufacturer string
  2439	 *   VENDOR_STRING_FLG(vid, "",             flags)
  2440	 */
  2441	#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
  2442		DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
  2443	
  2444	static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
  2445		/* Device and string descriptor matches */
  2446		DEVICE_STRING_FLG(0x05ac, 0x110b, /* VID conflicts with Apple */
  2447				  "JKY Technology", NULL, /* Q2A */
  2448				  QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2449	
  2450		/* Device matches */
  2451		DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
  2452			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2453		DEVICE_FLG(0x001f, 0x0b23, /* AB17X USB Audio */
  2454			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2455		DEVICE_FLG(0x0020, 0x0b21, /* GHW-123P */
  2456			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2457		DEVICE_FLG(0x0124, 0x0c21, /* Generic USB Headphone */
  2458			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2459		DEVICE_FLG(0x03f0, 0x0c56, /* HP Elite x3 Lap Dock */
  2460			   QUIRK_FLAG_FIXED_RATE),
  2461		DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
  2462			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2463		DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
  2464			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2465		DEVICE_FLG(0x041e, 0x324d, /* Creative Sound Blaster Play! 3 */
  2466			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2467		DEVICE_FLG(0x041e, 0x3289, /* Creative Stage SE */
> 2468			   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
  2469		DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
  2470			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2471		DEVICE_FLG(0x045e, 0x083c, /* MS USB Link headset */
  2472			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY |
  2473			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2474		DEVICE_FLG(0x045e, 0x070f, /* MS LifeChat LX-3000 Headset */
  2475			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2476		DEVICE_FLG(0x046d, 0x0807, /* Logitech Webcam C500 */
  2477			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2478		DEVICE_FLG(0x046d, 0x0808, /* Logitech Webcam C600 */
  2479			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2480		DEVICE_FLG(0x046d, 0x0809,
  2481			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2482		DEVICE_FLG(0x046d, 0x0819, /* Logitech Webcam C210 */
  2483			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2484		DEVICE_FLG(0x046d, 0x081b, /* HD Webcam c310 */
  2485			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2486		DEVICE_FLG(0x046d, 0x081d, /* HD Webcam c510 */
  2487			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2488		DEVICE_FLG(0x046d, 0x0825, /* HD Webcam c270 */
  2489			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2490		DEVICE_FLG(0x046d, 0x0826, /* HD Webcam c525 */
  2491			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2492		DEVICE_FLG(0x046d, 0x084c, /* Logitech ConferenceCam Connect */
  2493			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2494		DEVICE_FLG(0x046d, 0x08ca, /* Logitech Quickcam Fusion */
  2495			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2496		DEVICE_FLG(0x046d, 0x0991, /* Logitech QuickCam Pro */
  2497			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR |
  2498			   QUIRK_FLAG_MIC_RES_384),
  2499		DEVICE_FLG(0x046d, 0x09a2, /* QuickCam Communicate Deluxe/S7500 */
  2500			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
  2501		DEVICE_FLG(0x046d, 0x09a4, /* Logitech QuickCam E 3500 */
  2502			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
  2503		DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
  2504			   QUIRK_FLAG_CTL_MSG_DELAY_1M |
  2505			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2506		DEVICE_FLG(0x046d, 0x0aba, /* Logitech PRO X Wireless */
  2507			   QUIRK_FLAG_MIXER_GET_CUR_OK |
  2508			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2509		DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
  2510			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2511		DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
  2512			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2513		DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
  2514			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2515		DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
  2516			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2517		DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
  2518			   QUIRK_FLAG_SKIP_CLOCK_SELECTOR | QUIRK_FLAG_CTL_MSG_DELAY_5M),
  2519		DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
  2520			   QUIRK_FLAG_IFACE_SKIP_CLOSE),
  2521		DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
  2522			   QUIRK_FLAG_SET_IFACE_FIRST),
  2523		DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
  2524			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2525		DEVICE_FLG(0x0572, 0x1b08, /* Conexant Systems (Rockwell), Inc. */
  2526			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2527		DEVICE_FLG(0x0572, 0x1b09, /* Conexant Systems (Rockwell), Inc. */
  2528			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2529		DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
  2530			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2531		DEVICE_FLG(0x05a7, 0x1020, /* Bose Companion 5 */
  2532			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2533		DEVICE_FLG(0x05e1, 0x0408, /* Syntek STK1160 */
  2534			   QUIRK_FLAG_ALIGN_TRANSFER),
  2535		DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
  2536			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2537		DEVICE_FLG(0x05fc, 0x0231, /* JBL Pebbles */
  2538			   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL |
  2539			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2540		DEVICE_FLG(0x0624, 0x3d3f, /* AB13X USB Audio */
  2541			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2542		DEVICE_FLG(0x0644, 0x8043, /* TEAC UD-501/UD-501V2/UD-503/NT-503 */
  2543			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2544			   QUIRK_FLAG_IFACE_DELAY),
  2545		DEVICE_FLG(0x0644, 0x8044, /* Esoteric D-05X */
  2546			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2547			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2548		DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
  2549			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2550			   QUIRK_FLAG_IFACE_DELAY),
  2551		DEVICE_FLG(0x0644, 0x805f, /* TEAC Model 12 */
  2552			   QUIRK_FLAG_FORCE_IFACE_RESET),
  2553		DEVICE_FLG(0x0644, 0x806b, /* TEAC UD-701 */
  2554			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2555			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2556		DEVICE_FLG(0x0644, 0x807d, /* TEAC UD-507 */
  2557			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2558			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2559		DEVICE_FLG(0x0644, 0x806c, /* Esoteric XD */
  2560			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
  2561			   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
  2562		DEVICE_FLG(0x0661, 0x0883, /* iBasso DC04 Ultra */
  2563			   QUIRK_FLAG_DSD_RAW),
  2564		DEVICE_FLG(0x0666, 0x0880, /* SPACETOUCH USB Audio */
  2565			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY |
  2566			   QUIRK_FLAG_CTL_MSG_DELAY_5M),
  2567		DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
  2568			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2569		DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
  2570			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2571		DEVICE_FLG(0x0711, 0x5800, /* MCT Trigger 5 USB-to-HDMI */
  2572			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2573		DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
  2574			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2575		DEVICE_FLG(0x0763, 0x2030, /* M-Audio Fast Track C400 */
  2576			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2577		DEVICE_FLG(0x0763, 0x2031, /* M-Audio Fast Track C600 */
  2578			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2579		DEVICE_FLG(0x0763, 0x2080, /* M-Audio Fast Track Ultra */
  2580			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2581		DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
  2582			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2583		DEVICE_FLG(0x0763, 0x2084, /* M-Audio Venom */
  2584			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2585		DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
  2586			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2587		DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
  2588			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2589		DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
  2590			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2591		DEVICE_FLG(0x0a73, 0x003a, /* Mackie DLZ Creator XS */
  2592			   QUIRK_FLAG_ALWAYS_SET_RATE),
  2593		DEVICE_FLG(0x0b05, 0x1826, /* ASUS SupremeFX Hi-Fi */
  2594			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2595		DEVICE_FLG(0x0b05, 0x1827, /* ASUS SupremeFX Hi-Fi */
  2596			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2597		DEVICE_FLG(0x0b05, 0x18a6, /* ASUSTek Computer, Inc. */
  2598			   QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2599		DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
  2600			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2601		DEVICE_FLG(0x0bda, 0x498a, /* Realtek Semiconductor Corp. */
  2602			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2603		DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
  2604			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2605		DEVICE_FLG(0x0c45, 0x636b, /* Microdia JP001 USB Camera */
  2606			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2607		DEVICE_FLG(0x0d8c, 0x000c, /* C-Media */
  2608			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2609		DEVICE_FLG(0x0d8c, 0x0012, /* C-Media */
  2610			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2611		DEVICE_FLG(0x0d8c, 0x0014, /* C-Media */
  2612			   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2613		DEVICE_FLG(0x0d8c, 0x0102, /* C-Media CM6206 */
  2614			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2615		DEVICE_FLG(0x0e0b, 0xfa01, /* Feaulle Rainbow */
  2616			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2617		DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
  2618			   QUIRK_FLAG_FIXED_RATE),
  2619		DEVICE_FLG(0x0ecb, 0x2125, /* JBL Quantum650 Wireless */
  2620			   QUIRK_FLAG_FIXED_RATE),
  2621		DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
  2622			   QUIRK_FLAG_FIXED_RATE),
  2623		DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
  2624			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2625		DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
  2626			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2627		DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
  2628			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2629		DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
  2630			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE |
  2631			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2632		DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
  2633			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2634		DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
  2635			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2636		DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */
  2637			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2638		DEVICE_FLG(0x1397, 0x0508, /* Behringer UMC204HD */
  2639			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2640		DEVICE_FLG(0x1397, 0x0509, /* Behringer UMC404HD */
  2641			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2642		DEVICE_FLG(0x1397, 0x050c, /* Behringer Flow 8 */
  2643			   QUIRK_FLAG_IFB_SILENCE_ON_EMPTY),
  2644		DEVICE_FLG(0x1397, 0x0510, /* Behringer UV1 */
  2645			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2646		DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
  2647			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2648		DEVICE_FLG(0x152a, 0x85dd, /* SMSL USB DAC */
  2649			   QUIRK_FLAG_DSD_RAW | QUIRK_FLAG_DISABLE_AUTOSUSPEND |
  2650			   QUIRK_FLAG_SKIP_IFACE_SETUP),
  2651		DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
  2652			   0), /* Doesn't have the vendor quirk which would otherwise apply */
  2653		DEVICE_FLG(0x1532, 0x055e, /* Razer Nommo V2 X */
  2654			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2655		DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
  2656			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2657		DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
  2658			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2659		DEVICE_FLG(0x154e, 0x3005, /* Marantz HD-DAC1 */
  2660			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2661		DEVICE_FLG(0x154e, 0x3006, /* Marantz SA-14S1 */
  2662			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2663		DEVICE_FLG(0x154e, 0x300b, /* Marantz SA-KI RUBY / SA-12 */
  2664			   QUIRK_FLAG_DSD_RAW),
  2665		DEVICE_FLG(0x154e, 0x500e, /* Denon DN-X1600 */
  2666			   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
  2667		DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
  2668			   QUIRK_FLAG_TX_LENGTH | QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2669		DEVICE_FLG(0x16d0, 0x0ab1, /* PureAudio APA DAC */
  2670			   QUIRK_FLAG_DSD_RAW),
  2671		DEVICE_FLG(0x16d0, 0xeca1, /* PureAudio Lotus DAC5, DAC5 SE and DAC5 Pro */
  2672			   QUIRK_FLAG_DSD_RAW),
  2673		DEVICE_FLG(0x17aa, 0x1046, /* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
  2674			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2675		DEVICE_FLG(0x17aa, 0x104d, /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
  2676			   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
  2677		DEVICE_FLG(0x17ef, 0x3083, /* Lenovo TBT3 dock */
  2678			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2679		DEVICE_FLG(0x1852, 0x5062, /* Luxman D-08u */
  2680			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2681		DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
  2682			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2683		DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
  2684			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2685		DEVICE_FLG(0x19f7, 0x0003, /* RODE NT-USB */
  2686			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2687		DEVICE_FLG(0x19f7, 0x0035, /* RODE NT-USB+ */
  2688			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2689		DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
  2690			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2691		DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
  2692			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2693		DEVICE_FLG(0x1e0b, 0xd01e, /* Generic USB Audio Device */
  2694			   QUIRK_FLAG_PLAYBACK_URB_FIXUP),
  2695		DEVICE_FLG(0x1ff7, 0x0f81, /* SC13A Webcam */
  2696			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2697		DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
  2698			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2699		DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
  2700			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2701		DEVICE_FLG(0x2040, 0x7210, /* Hauppauge HVR-950Q */
  2702			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2703		DEVICE_FLG(0x2040, 0x7211, /* Hauppauge HVR-950Q-MXL */
  2704			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2705		DEVICE_FLG(0x2040, 0x7213, /* Hauppauge HVR-950Q */
  2706			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2707		DEVICE_FLG(0x2040, 0x7217, /* Hauppauge HVR-950Q */
  2708			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2709		DEVICE_FLG(0x2040, 0x721b, /* Hauppauge HVR-950Q */
  2710			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2711		DEVICE_FLG(0x2040, 0x721e, /* Hauppauge HVR-950Q */
  2712			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2713		DEVICE_FLG(0x2040, 0x721f, /* Hauppauge HVR-950Q */
  2714			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2715		DEVICE_FLG(0x2040, 0x7240, /* Hauppauge HVR-850 */
  2716			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2717		DEVICE_FLG(0x2040, 0x7260, /* Hauppauge HVR-950Q */
  2718			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2719		DEVICE_FLG(0x2040, 0x7270, /* Hauppauge HVR-950Q */
  2720			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2721		DEVICE_FLG(0x2040, 0x7280, /* Hauppauge HVR-950Q */
  2722			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2723		DEVICE_FLG(0x2040, 0x7281, /* Hauppauge HVR-950Q-MXL */
  2724			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2725		DEVICE_FLG(0x20b1, 0x2009, /* XMOS Ltd DIYINHK USB Audio 2.0 */
  2726			   QUIRK_FLAG_SKIP_IMPLICIT_FB | QUIRK_FLAG_DSD_RAW),
  2727		DEVICE_FLG(0x2040, 0x8200, /* Hauppauge Woodbury */
  2728			   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
  2729		DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
  2730			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2731		DEVICE_FLG(0x21b4, 0x0230, /* Ayre QB-9 Twenty */
  2732			   QUIRK_FLAG_DSD_RAW),
  2733		DEVICE_FLG(0x21b4, 0x0232, /* Ayre QX-5 Twenty */
  2734			   QUIRK_FLAG_DSD_RAW),
  2735		DEVICE_FLG(0x2522, 0x0007, /* LH Labs Geek Out HD Audio 1V5 */
  2736			   QUIRK_FLAG_SET_IFACE_FIRST),
  2737		DEVICE_FLG(0x25aa, 0x600b, /* TAE1159 */
  2738			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2739		DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
  2740			   QUIRK_FLAG_DSD_RAW),
  2741		DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
  2742			   0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor match */
  2743		DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
  2744			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2745		DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., Ltd. BE02T */
  2746			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE | QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
  2747		DEVICE_FLG(0x2b53, 0x0023, /* Fiero SC-01 (firmware v1.0.0 @ 48 kHz) */
  2748			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2749		DEVICE_FLG(0x2b53, 0x0024, /* Fiero SC-01 (firmware v1.0.0 @ 96 kHz) */
  2750			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2751		DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
  2752			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2753		DEVICE_FLG(0x2b73, 0x0047, /* AlphaTheta EUPHONIA */
  2754			   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2755		DEVICE_FLG(0x2d95, 0x8011, /* VIVO USB-C HEADSET */
  2756			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2757		DEVICE_FLG(0x2d95, 0x8021, /* VIVO USB-C-XE710 HEADSET */
  2758			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2759		DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
  2760			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2761		DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
  2762			   QUIRK_FLAG_CTL_MSG_DELAY),
  2763		DEVICE_FLG(0x2fc6, 0xf0b5, /* iBasso DC-Elite */
  2764			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2765		DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
  2766			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2767		DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
  2768			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2769		DEVICE_FLG(0x3255, 0x0000, /* Luxman D-10X */
  2770			   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
  2771		DEVICE_FLG(0x32bb, 0x0004, /* HiBy FC4 */
  2772			   QUIRK_FLAG_DSD_RAW),
  2773		DEVICE_FLG(0x3302, 0x17c2, /* TTGK Technology USB-C Audio */
  2774			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2775		DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
  2776			   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
  2777		DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
  2778			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
  2779		DEVICE_FLG(0x36f9, 0xc009, /* XIBERIA K03S */
  2780			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2781		DEVICE_FLG(0x3703, 0x2000, /* NUX NAI-24 */
  2782			   QUIRK_FLAG_SWAP_RATES),
  2783		DEVICE_FLG(0x3c20, 0x3d21, /* AB13X USB Audio */
  2784			   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
  2785		DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
  2786			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2787		DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
  2788			   QUIRK_FLAG_ALIGN_TRANSFER),
  2789		DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
  2790			   QUIRK_FLAG_ALIGN_TRANSFER),
  2791		DEVICE_FLG(0x84ef, 0x002a, /* Valeton GP-200 */
  2792			   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
  2793		DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
  2794			   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
  2795	
  2796		/* Vendor and string descriptor matches */
  2797		VENDOR_STRING_FLG(0x1235, /* Conflict with Focusrite Novation */
  2798				  "MV-SILICON",
  2799				  0), /* Stop matching */
  2800	
  2801		/* Vendor matches */
  2802		VENDOR_FLG(0x045e, /* MS Lifecam */
  2803			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2804		VENDOR_FLG(0x046d, /* Logitech */
  2805			   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  2806		VENDOR_FLG(0x047f, /* Plantronics */
  2807			   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY),
  2808		VENDOR_FLG(0x0644, /* TEAC Corp. */
  2809			   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
  2810		VENDOR_FLG(0x07fd, /* MOTU */
  2811			   QUIRK_FLAG_VALIDATE_RATES),
  2812		DEVICE_FLG(0x1235, 0x8006, 0), /* Focusrite Scarlett 2i2 1st Gen */
  2813		DEVICE_FLG(0x1235, 0x800a, 0), /* Focusrite Scarlett 2i4 1st Gen */
  2814		DEVICE_FLG(0x1235, 0x800c, 0), /* Focusrite Scarlett 18i20 1st Gen */
  2815		DEVICE_FLG(0x1235, 0x8016, 0), /* Focusrite Scarlett 2i2 1st Gen */
  2816		DEVICE_FLG(0x1235, 0x801c, 0), /* Focusrite Scarlett Solo 1st Gen */
  2817		VENDOR_FLG(0x1235, /* Focusrite Novation */
  2818			   QUIRK_FLAG_SKIP_CLOCK_SELECTOR |
  2819			   QUIRK_FLAG_SKIP_IFACE_SETUP),
  2820		VENDOR_FLG(0x1511, /* AURALiC */
  2821			   QUIRK_FLAG_DSD_RAW),
  2822		VENDOR_FLG(0x152a, /* Thesycon devices */
  2823			   QUIRK_FLAG_DSD_RAW),
  2824		VENDOR_FLG(0x18d1, /* iBasso devices */
  2825			   QUIRK_FLAG_DSD_RAW),
  2826		VENDOR_FLG(0x1de7, /* Phoenix Audio */
  2827			   QUIRK_FLAG_GET_SAMPLE_RATE),
  2828		VENDOR_FLG(0x20b1, /* XMOS based devices */
  2829			   QUIRK_FLAG_DSD_RAW),
  2830		VENDOR_FLG(0x21ed, /* Accuphase Laboratory */
  2831			   QUIRK_FLAG_DSD_RAW),
  2832		VENDOR_FLG(0x22d9, /* Oppo */
  2833			   QUIRK_FLAG_DSD_RAW),
  2834		VENDOR_FLG(0x23ba, /* Playback Design */
  2835			   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY |
  2836			   QUIRK_FLAG_DSD_RAW),
  2837		VENDOR_FLG(0x25ce, /* Mytek devices */
  2838			   QUIRK_FLAG_DSD_RAW),
  2839		VENDOR_FLG(0x2622, /* IAG Limited devices */
  2840			   QUIRK_FLAG_DSD_RAW),
  2841		VENDOR_FLG(0x2708, /* Audient devices */
  2842			   QUIRK_FLAG_IGNORE_CTL_ERROR),
  2843		VENDOR_FLG(0x2772, /* Musical Fidelity devices */
  2844			   QUIRK_FLAG_DSD_RAW),
  2845		VENDOR_FLG(0x278b, /* Rotel? */
  2846			   QUIRK_FLAG_DSD_RAW),
  2847		VENDOR_FLG(0x292b, /* Gustard/Ess based devices */
  2848			   QUIRK_FLAG_DSD_RAW),
  2849		VENDOR_FLG(0x2972, /* FiiO devices */
  2850			   QUIRK_FLAG_DSD_RAW),
  2851		VENDOR_FLG(0x2ab6, /* T+A devices */
  2852			   QUIRK_FLAG_DSD_RAW),
  2853		VENDOR_FLG(0x2afd, /* McIntosh Laboratory, Inc. */
  2854			   QUIRK_FLAG_DSD_RAW),
  2855		VENDOR_FLG(0x2d87, /* Cayin device */
  2856			   QUIRK_FLAG_DSD_RAW),
  2857		VENDOR_FLG(0x2fc6, /* Comture-inc devices */
  2858			   QUIRK_FLAG_DSD_RAW),
  2859		VENDOR_FLG(0x3336, /* HEM devices */
  2860			   QUIRK_FLAG_DSD_RAW),
  2861		VENDOR_FLG(0x3353, /* Khadas devices */
  2862			   QUIRK_FLAG_DSD_RAW),
  2863		VENDOR_FLG(0x35f4, /* MSB Technology */
  2864			   QUIRK_FLAG_DSD_RAW),
  2865		VENDOR_FLG(0x3842, /* EVGA */
  2866			   QUIRK_FLAG_DSD_RAW),
  2867		VENDOR_FLG(0xc502, /* HiBy devices */
  2868			   QUIRK_FLAG_DSD_RAW),
  2869	
  2870		{} /* terminator */
  2871	};
  2872	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
