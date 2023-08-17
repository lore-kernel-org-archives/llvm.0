Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D914A84;
	Thu, 17 Aug 2023 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285946; x=1723821946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/pRVSExx+z/i2HbgDrMO1XF3axJk3F2Cu3I++FtuLk=;
  b=CvXPurcdTUwBG4mdLq8ZoVxBuVMgSFbhE3edG4tdkH5BQ2qhTIJPD+bu
   6VHtyTSzId25Kc29nyg3PF1QBbggvP0umvCGEkO4xyVMugfzL9NPDU50T
   oVs+FLeiAlLiE89r1sjeefmHneB9D5ASu378GKA2uJ8SyYfHr20RYy6aC
   F9KyK7YTmkDPUaaiReOgqqyGVXylI/A1pXf6KxqmC4eF6TeG+TeN1GdCF
   P6RbmxFYUYcxplcqNJlAcVjbDwY5i614ho0N0arAga0NHzs+jTSh/dF5u
   nDPrySoeT5L8nWZvKnKmhNQVXt5/qkbh3C/T6t2HQKLO14bSE4EP4xPco
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372832640"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="372832640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728175523"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728175523"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 08:25:21 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWesD-0001Gp-0q;
	Thu, 17 Aug 2023 15:25:21 +0000
Date: Thu, 17 Aug 2023 23:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 6/21] drivers/hid/hid-magicmouse.c:149:
 warning: Function parameter or member 'pos' not described in 'magicmouse_sc'
Message-ID: <202308172326.CMuNhpMp-lkp@intel.com>
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
head:   58700c861f0a37630478bf31ded5eaf81e50b1a2
commit: 579da65c23b20007c89b14ea503ecbbe2a63f4ab [6/21] HID: magicmouse: use struct input_mt_pos for X/Y
config: i386-buildonly-randconfig-r005-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172326.CMuNhpMp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172326.CMuNhpMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172326.CMuNhpMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-magicmouse.c:149: warning: Function parameter or member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:149: warning: Function parameter or member 'battery_timer' not described in 'magicmouse_sc'


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
579da65c23b200 Janne Grunau  2021-12-16  134  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  135  	struct {
c04266889b5911 Chase Douglas 2010-06-20  136  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  137  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  138  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  139  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  140  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  141  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  142  		bool scroll_y_active;
c8be1187e3c8cf Janne Grunau  2021-12-16  143  	} touches[MAX_CONTACTS];
c8be1187e3c8cf Janne Grunau  2021-12-16  144  	int tracking_ids[MAX_CONTACTS];
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
