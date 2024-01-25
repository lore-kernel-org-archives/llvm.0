Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33E135407;
	Thu, 25 Jan 2024 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706202671; cv=none; b=tN/04/G+FeuULzkPQGF6BbnGXUgEHcBZCvOAX9Ei0AXRsOuo/PzVu05U9H1D4BLx/iQgqVeAE3C/Sg2YUJpvQRPsLqfOHJC/es8roynozXsgZDI77BoP28HH/nXV4322rmPRI1Fq59yg9PPcPp6oKYIb8QWpPGmRZoVDCrq5bH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706202671; c=relaxed/simple;
	bh=U5wQYQ3cu9vysPI5MCfehIzFnStJDNyMSdpVnQjjGK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5q6JzKgY6MPLcPGtVPS401rm5s42BMFx5+OwrY+LqXIDiS3li2aFQAyuYNylLysCGbxxloAKDX7jV2fDjBpz1Y0WTS9ykMaUjBZSUUnOgVO6rFRrW3KU8KCeMXzvrxb8w+HRR4aaIRLAu4WLSh1QIPhsSLNioSUOgCwatmAkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJlwguyb; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJlwguyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706202669; x=1737738669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5wQYQ3cu9vysPI5MCfehIzFnStJDNyMSdpVnQjjGK0=;
  b=BJlwguybQHkJsPYEGqoOY8ylSTEjy0wH+ueeccEurWEWuD00VxIQqAQU
   xZYQXQzTmj0hQTOw6G7ZOii70wo+WEC0TV7OLrI4B+s4m45w/j3Z3HLLM
   S7fkXbNRYArVUBstfOGdizqFk1XkT6bWG9jqA1hcr7js3U3KM+9ZIzRiV
   5RC8SrvFEfbR7yVuff7gNbVlPGulbIF4Kjuf5ReZf0UW+SXFCuKjQZbNh
   VGw24I4ANH9easD8q1OZh/6VGMObCeImTs8P+XI+f10/Gh4tFBoaxMUyS
   ei+bCDGS6DLbmmL9T0J46vMyrbyFyaJTUIMiJst6NC7SDCkgUZO7wck5t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="405971914"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405971914"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 09:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2326651"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2024 09:11:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT3Fn-0000EV-0O;
	Thu, 25 Jan 2024 17:11:03 +0000
Date: Fri, 26 Jan 2024 01:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 8/21] drivers/hid/hid-magicmouse.c:570:
 warning: Excess struct member 'crc16' description in 'tp_finger'
Message-ID: <202401260106.VKth8fll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   253645613d55bc9e62bb0b1811d009cd987f301f
commit: c09e6b2eb869c1427a5991a82e4357c2ab5271d7 [8/21] HID: magicmouse: add support for Macbook trackpads
config: i386-buildonly-randconfig-005-20240124 (https://download.01.org/0day-ci/archive/20240126/202401260106.VKth8fll-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260106.VKth8fll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260106.VKth8fll-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:169: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:169: warning: Function parameter or struct member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:169: warning: Function parameter or struct member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:169: warning: Function parameter or struct member 'battery_timer' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:169: warning: Function parameter or struct member 'input_ops' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:570: warning: Excess struct member 'crc16' description in 'tp_finger'
   drivers/hid/hid-magicmouse.c:592: warning: expecting prototype for struct trackpad. Prototype was for struct tp_header instead


vim +570 drivers/hid/hid-magicmouse.c

   533	
   534	/**
   535	 * struct tp_finger - single trackpad finger structure, le16-aligned
   536	 *
   537	 * @unknown1:		unknown
   538	 * @unknown2:		unknown
   539	 * @abs_x:		absolute x coordinate
   540	 * @abs_y:		absolute y coordinate
   541	 * @rel_x:		relative x coordinate
   542	 * @rel_y:		relative y coordinate
   543	 * @tool_major:		tool area, major axis
   544	 * @tool_minor:		tool area, minor axis
   545	 * @orientation:	16384 when point, else 15 bit angle
   546	 * @touch_major:	touch area, major axis
   547	 * @touch_minor:	touch area, minor axis
   548	 * @unused:		zeros
   549	 * @pressure:		pressure on forcetouch touchpad
   550	 * @multi:		one finger: varies, more fingers: constant
   551	 * @crc16:		on last finger: crc over the whole message struct
   552	 *			(i.e. message header + this struct) minus the last
   553	 *			@crc16 field; unknown on all other fingers.
   554	 */
   555	struct tp_finger {
   556		__le16 unknown1;
   557		__le16 unknown2;
   558		__le16 abs_x;
   559		__le16 abs_y;
   560		__le16 rel_x;
   561		__le16 rel_y;
   562		__le16 tool_major;
   563		__le16 tool_minor;
   564		__le16 orientation;
   565		__le16 touch_major;
   566		__le16 touch_minor;
   567		__le16 unused[2];
   568		__le16 pressure;
   569		__le16 multi;
 > 570	} __attribute__((packed, aligned(2)));
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
