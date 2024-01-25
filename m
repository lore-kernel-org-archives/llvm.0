Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BF62B;
	Thu, 25 Jan 2024 00:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706142684; cv=none; b=pxWKuQzp+AbXVxB6OQHlRjQHzappIkmIyzPpnkZG5A/m0y3smK9x22tsTAVh0LK9jJq+zZkWP4KObzvGfwKVC3tlLygNgD8CnVYDqXH7srwODoAywkc5uIHGGsV3KHzhV1RUOVFPvMDA3NBH2WvCEX3c2GWrYywk94fh1hS65+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706142684; c=relaxed/simple;
	bh=5YKshcZi5h0wxs1BDUfbpcoRHRsI1fcPhN69b/qwu5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hE9c+1CHHilAzfbrPIhlJ3NDqWz6cGvyGLTomuqv7Vz71Ya3ivJ8spSwi4cLX19OCifN/+QTMQjJHBKcnbtHEWhrGjBM+6T43HEmmypjWnRDvlpjxLz2sqn0pdh1g7pdx2dtENA1RdypRBt2E/PGBaBuwoUNMy0rIeIRqHIgKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXXdoZT3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXXdoZT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706142681; x=1737678681;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5YKshcZi5h0wxs1BDUfbpcoRHRsI1fcPhN69b/qwu5c=;
  b=CXXdoZT3PJ1BiEs+KUOIR/YTItY8T9iPWE6ztSM8RE6WsmooamaI+xgl
   hHc1GSs1+o5OZW4hCm9VAT0mhgkSTyJzpAOkT7xkygDL7SLLp07sdmZWW
   3jnUIDGhujC92TEwAbkYzhBBjqNwwsIdqqZxUJNxQY35P68ZkUuALb3eS
   7CUl/c0XFN9dZqFjPmVu6JLWw1tRlhb6QiTbnx2g/lPO3K4WvHe+pLPZf
   Q+aBIHxWKiLUs0NP85rS1V5I9NV0v54Co0EztsxkztdzKE7NH9BKHD8AN
   hIcghpK2ni8UTNogNbpOErxBHoaWeyg4RGuxzdBN+aBo6HHqi1HccAdeL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1886817"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1886817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 16:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28581372"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2024 16:31:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSneG-0008XZ-2V;
	Thu, 25 Jan 2024 00:31:16 +0000
Date: Thu, 25 Jan 2024 08:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 6/21] drivers/hid/hid-magicmouse.c:149:
 warning: Function parameter or struct member 'pos' not described in
 'magicmouse_sc'
Message-ID: <202401250842.qzPO4wLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   253645613d55bc9e62bb0b1811d009cd987f301f
commit: 089b2bcdbc5e124db8548e789c2673b07b3a730a [6/21] HID: magicmouse: use struct input_mt_pos for X/Y
config: i386-buildonly-randconfig-005-20240124 (https://download.01.org/0day-ci/archive/20240125/202401250842.qzPO4wLV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250842.qzPO4wLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250842.qzPO4wLV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-magicmouse.c:149: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or struct member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or struct member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or struct member 'battery_timer' not described in 'magicmouse_sc'


vim +149 drivers/hid/hid-magicmouse.c

4f6fdf08681cec Chase Douglas 2011-08-05   93  
4f6fdf08681cec Chase Douglas 2011-08-05   94  #define TRACKPAD_DIMENSION_X (float)13000
4f6fdf08681cec Chase Douglas 2011-08-05   95  #define TRACKPAD_MIN_X -2909
4f6fdf08681cec Chase Douglas 2011-08-05   96  #define TRACKPAD_MAX_X 3167
4f6fdf08681cec Chase Douglas 2011-08-05   97  #define TRACKPAD_RES_X \
4f6fdf08681cec Chase Douglas 2011-08-05   98  	((TRACKPAD_MAX_X - TRACKPAD_MIN_X) / (TRACKPAD_DIMENSION_X / 100))
4f6fdf08681cec Chase Douglas 2011-08-05   99  #define TRACKPAD_DIMENSION_Y (float)11000
4f6fdf08681cec Chase Douglas 2011-08-05  100  #define TRACKPAD_MIN_Y -2456
4f6fdf08681cec Chase Douglas 2011-08-05  101  #define TRACKPAD_MAX_Y 2565
4f6fdf08681cec Chase Douglas 2011-08-05  102  #define TRACKPAD_RES_Y \
4f6fdf08681cec Chase Douglas 2011-08-05  103  	((TRACKPAD_MAX_Y - TRACKPAD_MIN_Y) / (TRACKPAD_DIMENSION_Y / 100))
4f6fdf08681cec Chase Douglas 2011-08-05  104  
9d7b18668956c4 Sean O'Brien  2018-10-02  105  #define TRACKPAD2_DIMENSION_X (float)16000
9d7b18668956c4 Sean O'Brien  2018-10-02  106  #define TRACKPAD2_MIN_X -3678
9d7b18668956c4 Sean O'Brien  2018-10-02  107  #define TRACKPAD2_MAX_X 3934
9d7b18668956c4 Sean O'Brien  2018-10-02  108  #define TRACKPAD2_RES_X \
9d7b18668956c4 Sean O'Brien  2018-10-02  109  	((TRACKPAD2_MAX_X - TRACKPAD2_MIN_X) / (TRACKPAD2_DIMENSION_X / 100))
9d7b18668956c4 Sean O'Brien  2018-10-02  110  #define TRACKPAD2_DIMENSION_Y (float)11490
9d7b18668956c4 Sean O'Brien  2018-10-02  111  #define TRACKPAD2_MIN_Y -2478
9d7b18668956c4 Sean O'Brien  2018-10-02  112  #define TRACKPAD2_MAX_Y 2587
9d7b18668956c4 Sean O'Brien  2018-10-02  113  #define TRACKPAD2_RES_Y \
9d7b18668956c4 Sean O'Brien  2018-10-02  114  	((TRACKPAD2_MAX_Y - TRACKPAD2_MIN_Y) / (TRACKPAD2_DIMENSION_Y / 100))
9d7b18668956c4 Sean O'Brien  2018-10-02  115  
128537cea464d9 Michael Poole 2010-02-06  116  /**
128537cea464d9 Michael Poole 2010-02-06  117   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  118   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  119   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  120   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  121   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  122   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  123   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  124   * @tracking_ids: Mapping of current touch input data to @touches.
128537cea464d9 Michael Poole 2010-02-06  125   */
128537cea464d9 Michael Poole 2010-02-06  126  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  127  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  128  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  129  
128537cea464d9 Michael Poole 2010-02-06  130  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  131  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  132  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  133  
089b2bcdbc5e12 Janne Grunau  2021-12-16  134  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  135  	struct {
c04266889b5911 Chase Douglas 2010-06-20  136  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  137  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  138  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  139  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  140  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  141  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  142  		bool scroll_y_active;
8aff5a2106ccfe Janne Grunau  2021-12-16  143  	} touches[MAX_CONTACTS];
8aff5a2106ccfe Janne Grunau  2021-12-16  144  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  145  
c0dc5582812dfa John Chen     2021-03-30  146  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  147  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  148  	struct timer_list battery_timer;
128537cea464d9 Michael Poole 2010-02-06 @149  };
128537cea464d9 Michael Poole 2010-02-06  150  

:::::: The code at line 149 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
