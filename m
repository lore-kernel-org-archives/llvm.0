Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCF1DF987;
	Tue,  1 Jul 2025 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369119; cv=none; b=n6k3O5g0y5F223j2G8G7xJcbnhB7erBj7T1mo3T2923BrDTlDWUrUdQ58cltrhZv8qhotVwXfSW2BaGyJKFcaS88PAL5/MXLqdVfYB7ZOwx7hHF13lqTPbFDOObAutA5zX5+cvRNCXBvPDLnPQguyGGCBaiT4zwavSxXVVzhwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369119; c=relaxed/simple;
	bh=kcgRM6dP4IaAchZaKxst2U3+jSIaSJXj80x0WBduMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHoOoJLJgoj3r/snjd1Vn2heccKQDugjpdkVS9pEN8XIaUlHmk4zYPAZWIeTRRF49lstUD3a1IZXEUyr0kfzBH6mMCH3jpqHfATkJXRcdPKgTLWaZnFKk9k1TTfeU8hstV1F3bvQg0id1dFAwftiwnjDL8EGGR3ls+yXlxThoeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGt7rerf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGt7rerf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751369118; x=1782905118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcgRM6dP4IaAchZaKxst2U3+jSIaSJXj80x0WBduMnI=;
  b=NGt7rerfp9nUFwK7OUQZO3MjPmlyAN8tb20mHOO9DwIzmSC9ADM7WKtC
   5H/IqYKpUH3BZlw9gJ+fiZyrkLYx4rBcaKvVWbBFDLulyt9z0PpcaUg11
   w6orW6+mpAULEKxS0pkphWZhdK+VNJCXMFZjuOZ3Zqm86AWHXK+ei8p9d
   N8DioQn6X6B713tfXhTnLbGPeZcvkUBBAc/p6Rbn+VJsyFm/GnXoBPQKy
   I2oz7Iz1spGIXkarOG389WURXYEtn9B76rKbhhlT7iEReaZXX77lawCPW
   hF6ms6WSdm7INX7exIzAO93fEHq6UnqW4o07B1TvPzGmc/eHIeGXK75cR
   A==;
X-CSE-ConnectionGUID: 2i4YnG4sTMKcleOxZ7Ytag==
X-CSE-MsgGUID: 5tkKJOPoRK2drxFexUG8/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71191785"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71191785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:25:17 -0700
X-CSE-ConnectionGUID: xvt5yXNxQZybacDGzIxPgA==
X-CSE-MsgGUID: XJdFd6zbShiO9QowGxvfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153355508"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jul 2025 04:25:16 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWZ6w-00004B-0D;
	Tue, 01 Jul 2025 11:25:14 +0000
Date: Tue, 1 Jul 2025 13:24:17 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 944/6384] ERROR: modpost:
 "input_register_handler" [sound/usb/snd-usb-audio.ko] undefined!
Message-ID: <202507011359.gdERkLIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f804361f3b9af33e00b90ec9cb5afcc96831e60
commit: 79d561c4ec0497669f19a9550cfb74812f60938b [944/6384] ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
config: x86_64-buildonly-randconfig-2003-20250701 (https://download.01.org/0day-ci/archive/20250701/202507011359.gdERkLIK-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011359.gdERkLIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011359.gdERkLIK-lkp@intel.com/

Note: the linux-next/master HEAD 3f804361f3b9af33e00b90ec9cb5afcc96831e60 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "input_register_handler" [sound/usb/snd-usb-audio.ko] undefined!
>> ERROR: modpost: "input_unregister_handler" [sound/usb/snd-usb-audio.ko] undefined!
>> ERROR: modpost: "input_register_handle" [sound/usb/snd-usb-audio.ko] undefined!
>> ERROR: modpost: "input_open_device" [sound/usb/snd-usb-audio.ko] undefined!
>> ERROR: modpost: "input_unregister_handle" [sound/usb/snd-usb-audio.ko] undefined!
>> ERROR: modpost: "input_close_device" [sound/usb/snd-usb-audio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
