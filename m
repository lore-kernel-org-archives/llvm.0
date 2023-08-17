Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED63F171BF;
	Thu, 17 Aug 2023 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692294222; x=1723830222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LbiqU98g3ep/SINWmvL4vfmqtl9RKw6NfhsYEIE9L8I=;
  b=WZCNfmKDzKcyYHiLw6hFXjXesDz3++nQ+8QkX81rXMnZiUxeEXIAIfIw
   DQuZUR9vRN0IfAtZCjlZRXw+67s0A+NPlcCJj7AcjgZW/L4mghHqS0bmb
   BugFhJUxDt1hK8M5t0YUja2uZ2xSlfNXsDUR1lDEIipbrFaHKPkcO5pVu
   6C3ZHR+/tEeoNSDxsi/T1euNdD4bg1GLL7OLKK5rdnFKph4I769muiBHG
   TVxvam+1bKopR2SyYdt6hodo9dOSrutPqfC+TdeWyj6JLf9b8jhz/9RiJ
   zRI/rb/0B8VEaIc/wdXIlUiapSOlUR1tCcpbrUGBCBnNDlQCUaGT5eWwj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370352849"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370352849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 10:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="848951577"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="848951577"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 10:43:35 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWh1z-0001M7-0s;
	Thu, 17 Aug 2023 17:43:35 +0000
Date: Fri, 18 Aug 2023 01:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 7/21] drivers/hid/hid-magicmouse.c:157:
 warning: Function parameter or member 'input_ops' not described in
 'magicmouse_sc'
Message-ID: <202308180153.ZdQy8aKS-lkp@intel.com>
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
commit: ad97676a55dbae626213ddf7471e4fc3b2d79fc7 [7/21] HID: magicmouse: use ops function pointers for input functionality
config: i386-buildonly-randconfig-r005-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180153.ZdQy8aKS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180153.ZdQy8aKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180153.ZdQy8aKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'battery_timer' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'input_ops' not described in 'magicmouse_sc'


vim +157 drivers/hid/hid-magicmouse.c

ad97676a55dbae Janne Grunau  2021-12-16  122  
128537cea464d9 Michael Poole 2010-02-06  123  /**
128537cea464d9 Michael Poole 2010-02-06  124   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  125   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  126   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  127   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  128   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  129   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  130   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  131   * @tracking_ids: Mapping of current touch input data to @touches.
128537cea464d9 Michael Poole 2010-02-06  132   */
128537cea464d9 Michael Poole 2010-02-06  133  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  134  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  135  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  136  
128537cea464d9 Michael Poole 2010-02-06  137  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  138  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  139  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  140  
579da65c23b200 Janne Grunau  2021-12-16  141  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  142  	struct {
c04266889b5911 Chase Douglas 2010-06-20  143  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  144  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  145  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  146  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  147  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  148  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  149  		bool scroll_y_active;
c8be1187e3c8cf Janne Grunau  2021-12-16  150  	} touches[MAX_CONTACTS];
c8be1187e3c8cf Janne Grunau  2021-12-16  151  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  152  
c0dc5582812dfa John Chen     2021-03-30  153  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  154  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  155  	struct timer_list battery_timer;
ad97676a55dbae Janne Grunau  2021-12-16  156  	struct magicmouse_input_ops input_ops;
128537cea464d9 Michael Poole 2010-02-06 @157  };
128537cea464d9 Michael Poole 2010-02-06  158  

:::::: The code at line 157 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
